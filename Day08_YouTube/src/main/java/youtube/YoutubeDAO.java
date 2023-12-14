package youtube;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;

public class YoutubeDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs; // 결과 집합 (select) -> 자바 객체 (디비에서 select * from 맥도날드 하면 나오는 결과들 !!)
	
	// getConnection
	private Connection getConnection() throws Exception {
		Class.forName(OracleDriver.class.getName());
		return DriverManager.getConnection(url, user, password);
	}
	
	// close
	private void close() {
		try {
			if (rs != null)		rs.close();
			if (pstmt != null) 	pstmt.close();
			if (conn != null) 	conn.close();
		} catch (SQLException e) {}
	}
	
	// mapping
	private YoutubeDTO mapping(ResultSet rs) throws SQLException {
		YoutubeDTO dto = new YoutubeDTO();
		dto.setCategory(rs.getString("category"));
		dto.setTitle(rs.getString("title"));
		dto.setIdx(rs.getInt("idx"));
		dto.setChname(rs.getString("chname"));
		dto.setThumbnail(rs.getString("thumbnail"));
		dto.setTag(rs.getString("tag"));
		return dto;
	}
	
	// 전체목록 (select * from youtube)
	public List<YoutubeDTO> selectList() {
		ArrayList<YoutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube";
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
		} return list;
	}
	
	// 카테고리별 목록 (select * from youtube where category = ?)
	public List<YoutubeDTO> selectListByCategory(String category){
		ArrayList<YoutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube where category = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
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
	
	// 단일 조회 (select * from youtube where idx = ?)
	public YoutubeDTO selectOne(int idx) {
		String sql = "select * from youtube where idx = ?";
		YoutubeDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);  // 넣어놓고 sql문에 물음표 몇개 있는지 확인하기
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		} return dto;
	}
	
	// 추가
	public int insert(YoutubeDTO dto) {
		int row = 0;
		String sql = "insert into youtube (category, title, chname, thumbnail, tag) values (?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getChname());
			pstmt.setString(4, dto.getThumbnail());
			pstmt.setString(5, dto.getTag());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 수정 (update)
	public int update(YoutubeDTO dto) {
		int row = 0;
		String sql = "update youtube"
				+ "		set "
				+ " 		category = ?,"	
				+ "			title = ?,"
				+ "			chname = ?,"
				+ "			thumbnail = ?,"
				+ "			tag = ?"
				+ "		where"
				+ "			idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getChname());
			pstmt.setString(4, dto.getThumbnail());
			pstmt.setString(5, dto.getTag());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 삭제 (delete youtube where idx = ?)
	// delete.jsp 에서 파라미터 idx를 받아서 레코드 하나를 삭제하는 함수
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete youtube where idx = ?";
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
	
	// 마지막으로 사용한 시퀀스 번호를 불러오는 함수
	// select youtube_seq.currval from dual
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from youtube";
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
