package bugs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BugsDAO {
	
	// 싱글톤 (DAO 객체가 여러개일 필요가 없다)
	// 외부에서 DAO의 객체를 함부로 생성할 수 없도록 생성자의 접근제한자를 private으로 수정해야 한다.
	private static BugsDAO instance = new BugsDAO();
	public static BugsDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;		// context.xml에서 작성한 내용대로의 객체를 포함하는 컨테이너
	private DataSource ds;		// 여러 커넥션을 관리하는 DataSource 객체
	// 커넥션풀 : 요청이 들어올 때마다 새로운 커넥션을 생성하지 말고
	// 		   미리 충분히 사용할만큼의 커넥션을 생성해두고, 돌려가면서 사용하기 위해서 쓴다.
	
//	public BugsDAO() {
	private BugsDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("지정한 이름의 객체를 찾을 수 없습니다. : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}


	// void close()
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
		}
	}

	// BugsDTO mapping(ResultSet rs)
	private BugsDTO mapping(ResultSet rs) throws SQLException {
		// 프로그래머스 문제처럼 반환형 return을 먼저 써놓고
		BugsDTO dto = new BugsDTO(); // 빈 통에 채워주는 데이터는 rs로부터 온다.
		dto.setId(rs.getInt("id"));
		dto.setArtist_name(rs.getString("artist_name"));
		dto.setArtist_img(rs.getString("artist_img"));
		dto.setAlbum_name(rs.getString("album_name"));
		dto.setAlbum_img(rs.getString("album_img"));
		dto.setName(rs.getString("name"));
		dto.setGenre(rs.getString("genre"));
		dto.setPlayTime(rs.getInt("playTime"));
		dto.setLyrics(rs.getString("lyrics"));
		dto.setIsTitle(rs.getInt("isTitle"));

		return dto;
	}

	// 공개 함수
	// List<BugsDTO> selectAll() 참고로 맵핑은 select 할 때만 쓴다.
	// select * from bugs order by artist_name, id
	public List<BugsDTO> selectAll(String search){ // 전체목록 띄우기 + 검색
		ArrayList<BugsDTO> list = new ArrayList<>();
		String sql = "select * from bugs" 
				   + " where"
			       + "		name like '%' || ? || '%'"
			       + "		or"
			       + "		artist_name like '%' || ? || '%'"
			       + " order by artist_name, id";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
//		System.out.println("불러온 목록의 개수 : " + list.size());
		return list;
		}
}
