package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import menu.MenuDTO;
import menu.Paging;
import menu.MenuDAO;

public class MenuDAO {

	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static MenuDAO instance = new MenuDAO();
	public static MenuDAO getInstance() {
		return instance;
	}
	
	private MenuDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null) 		rs.close();
			if(pstmt != null) 	pstmt.close();
			if(conn != null) 	conn.close();
		}catch(SQLException e) {}
	}
	
	private MenuDTO mapping(ResultSet rs) throws SQLException {
		MenuDTO dto = new MenuDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setMenuName(rs.getString("menuName"));
		dto.setMenuImage(rs.getString("menuImage"));
		dto.setCategory(rs.getString("category"));
		return dto;
	}
	
	// 게시글 목록 불러오기
	public List<MenuDTO> selectList(String search, Paging paging) {
		ArrayList<MenuDTO> list = new ArrayList<>();
		String sql = "select * from menu "
				+ "	where "
				+ "		 menuName like '%' || ? || '%' or "
				+ "		 menuImage like '%' || ? || '%' or "
				+ "		 category like '%' || ? || '%'	"
				+ "	order by idx desc"
				+ "	offset ? rows"
				+ "	fetch next ? rows only";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setInt(4, paging.getOffset());
			pstmt.setInt(5, paging.getFetch());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
	
	// 게시글 개수 불러오기
	public int selectCount(String search) {
		int count = 0;
		String sql = "select count(*) from menu "
				+ "	where "
				+ "		 menuName like '%' || ? || '%' or "
				+ "		 menuImage like '%' || ? || '%' or "
				+ "		 category like '%' || ? || '%'	";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return count;
	}
	
	// 추가
	public int insert(MenuDTO dto) {
		int row = 0;
		String sql = "insert into menu (menuName, menuImage, category) values ("
				+ "?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMenuName());
			pstmt.setString(2, dto.getMenuImage());
			pstmt.setString(3, dto.getCategory());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}


}
