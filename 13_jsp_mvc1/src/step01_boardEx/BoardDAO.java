package step01_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.text.StyledEditorKit.BoldAction;

// D(Data) A(Access) O(Object) : 데이터 접근 객체
public class BoardDAO<pubilc> {

	private BoardDAO(){}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 데이터베이스 연결 메서드
	public void getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MVC1_PRACTICE?serverTimezone=Asia/Seoul", "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// 데이터베이스 연결 자원 해제 메서드
	public void getClose() {
		if (rs != null)    try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if (pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if (conn != null)  try {conn.close();} catch (SQLException e) {e.printStackTrace();}
	}
	
	
	// 게시글 작성 DAO
	public void insertBoard(BoardDTO boardDTO) {
		
		// 단위 테스트
		//System.out.println(boardDTO);
		
		try {
			
			getConnection();
			
			String sql = "INSERT INTO BOARD(WRITER , EMAIL , SUBJECT , PASSWORD , CONTENT , READ_CNT , ENROLL_DT)";
				   sql += "VALUES(? , ? , ? , ? , ? , 0 , NOW())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getWriter());
			pstmt.setString(2, boardDTO.getEmail());
			pstmt.setString(3, boardDTO.getSubject());
			pstmt.setString(4, boardDTO.getPassword());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
	}
	
	
	// 전체 게시글 조회 DAO
	public ArrayList<BoardDTO> getBoardList() {
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			
			getConnection();
								// (참고)SQL Syntax Exception : 쿼리 문법 오류
			pstmt = conn.prepareStatement("SELECT * FROM BOARD");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				BoardDTO temp = new BoardDTO();
				//temp.boardId = rs.getLong("BOARD_ID");
				temp.setBoardId(rs.getLong("BOARD_ID"));
				temp.setWriter(rs.getString("WRITER"));
				temp.setSubject(rs.getString("SUBJECT"));
				temp.setReadCnt(rs.getLong("READ_CNT"));
				temp.setEnrollDt(rs.getDate("ENROLL_DT"));
				
				boardList.add(temp);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		// 단위테스트
		//System.out.println(boardList);
		
		return boardList;
	
	}
	
public BoardDTO getBoardDetail(long boardId){
		
		BoardDTO boardDTO = null;
		
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_ID = ?");
			pstmt.setLong(1, boardId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setBoardId(boardId);
				boardDTO.setWriter(rs.getString("WRITER"));
				boardDTO.setEmail(rs.getString("EMAIL"));
				boardDTO.setSubject(rs.getString("SUBJECT"));
				boardDTO.setContent(rs.getString("CONTENT"));
				boardDTO.setReadCnt(rs.getLong("READ_CNT"));
				boardDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		// 단위테스트
		//System.out.println(boardDTO);
		
		return boardDTO;
	
	}

		//유저 인증 DAO
		public boolean checkAuthorizedUser(BoardDTO boardDTO) {
			
			boolean isAuthorizedUser = false;
			
			try {
				
				getConnection();
				
				pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_ID = ? AND PASSWORD = ?");
				pstmt.setLong(1, boardDTO.getBoardId()); 
				pstmt.setString(2, boardDTO.getPassword()); 
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					isAuthorizedUser = true;
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				getClose();
			}
			 
			
			return isAuthorizedUser;
			
		}
	
	
	
	
	
	
	
	
}
