package icecream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;

public class IcecreamDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// getConncetion
	private Connection getConnection() throws Exception {
		Class.forName(OracleDriver.class.getName());
		return DriverManager.getConnection(url, user, password);
	}
	
	// close
	private void close() {
		try {
			if (rs != null) 	rs.close();
			if (pstmt != null)	pstmt.close();
			if (conn != null)	conn.close();
		} catch (Exception e) {}
	}
	
	// mapping
	private IcecreamDTO mapping(ResultSet rs) throws SQLException {
		IcecreamDTO dto = new IcecreamDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setPrice(rs.getInt("price"));
		
		return dto;
	}
	
	// 전체목록
	public List<IcecreamDTO> selectList() {
		ArrayList<IcecreamDTO> list = new ArrayList<>();
		String sql = "select * from product";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 단일조회
	public IcecreamDTO selectOne(int idx) {
		String sql = "select * from product where idx = ?";
		IcecreamDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	// 추가
	public int insert(IcecreamDTO dto) {
		int row = 0;
		String sql = "insert into product (name, price) values (?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 삭제
	public int delete(int idx) {
		int row = 0;
		String sql = "delete product where idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 수정
	public int update(IcecreamDTO dto) {
		int row = 0;
		String sql = "update product set name = ?, price = ? where idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setInt(3, dto.getIdx());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 마지막으로 사용한 시퀀스 번호를 불러오는 함수
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from product";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return idx;
	}
}
