package board;

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

import board.BoardDAO;
import board.BoardDTO;
import board.Paging;

public class BoardDAO {
	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {
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
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setWriter(rs.getString("writer"));
		dto.setContent(rs.getString("content"));
		dto.setImage(rs.getString("image"));
		dto.setViewCount(rs.getInt("viewCount"));
		dto.setWriteDate(rs.getDate("writeDate"));
		return dto;
	}
	
	// 게시글 목록 불러오기
	public List<BoardDTO> selectList(String search, Paging paging) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql = "select * from board "
				+ "	where "
				+ "		 title like '%' || ? || '%' or "
				+ "		 writer like '%' || ? || '%' or "
				+ "		 content like '%' || ? || '%'	"
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
		String sql = "select count(*) from board "
				+ "	where "
				+ "		 title like '%' || ? || '%' or "
				+ "		 writer like '%' || ? || '%' or "
				+ "		 content like '%' || ? || '%'	";
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
		public int insert(BoardDTO dto) {
			int row = 0;
			String sql = "insert into board (title, writer, content, image) values ("
					+ "?, ?, ?, ?)";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getWriter());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getImage());
				row = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { close(); }
			return row;
		}
		
	// 내가 쓴 글 (삭제 된 글 포함)
	public List<BoardDTO> selectListByWriter(String userid) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql = "select * from board where writer = ? order by idx desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
}
