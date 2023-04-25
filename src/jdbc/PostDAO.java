package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class PostDAO {
   // insert
   public static boolean insert(String title, String upfolder, String uuid, String filename, int page) {
      boolean result = false;
      String sql = "INSERT INTO post (ptitle, pupfolder, puuid, pfilename, ppage) VALUES (?, ?, ?, ?, ?)";
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         conn = ConnectionPool.get();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, title);
         pstmt.setString(2, upfolder);
         pstmt.setString(3, uuid);
         pstmt.setString(4, filename);
         pstmt.setInt(5, page);
         
         result = pstmt.executeUpdate() == 1 ? true : false;
      } catch (SQLException | NamingException e) {
         e.printStackTrace();
      } finally {
         close(conn, pstmt, null);
      }
      return result;
   }
   
 //사진 최근꺼 하나 꺼내기
   public static PostDTO select(int ppage) throws SQLException, NamingException  {
   	
   	Connection conn = null;
   	PreparedStatement pstmt = null;
   	ResultSet rs = null;
   	PostDTO pdto = null;
   	
   	try {
   		String sql = "SELECT * FROM post WHERE ppage = ?";

   		conn = ConnectionPool.get();
   		pstmt = conn.prepareStatement(sql);
   		pstmt.setInt(1, ppage);
   				
   		rs = pstmt.executeQuery(); 	
   		
   		if(rs.next()) {	
   			pdto = new PostDTO();
   			pdto.setPno(rs.getInt("pno"));
   			pdto.setPtitle(rs.getString("ptitle"));
   			pdto.setPupfolder(rs.getString("pupfolder"));
   			pdto.setPuuid(rs.getString("puuid"));
   			pdto.setPfilename(rs.getString("pfilename"));
   			pdto.setPpage(rs.getInt("ppage"));
   			pdto.setPdate(rs.getString("pdate"));
   			
   		} return pdto;
   		
   	}finally {
   		if(rs != null) rs.close();
   		if(pstmt != null) pstmt.close();
   		if(conn != null) conn.close();
   	}

   }
   
   // DB 데이터 전체 삭제
   public static boolean delete() {
      boolean result = false;
      String sql = "DELETE FROM post";
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         conn = ConnectionPool.get();
         pstmt = conn.prepareStatement(sql);
         
         result = pstmt.executeUpdate() == 1 ? true : false;
      } catch (SQLException | NamingException e) {
         e.printStackTrace();
      } finally {
         close(conn, pstmt, null);
      }
      return result;
   }
   
   // 객체 닫기
   public static void close(Connection conn, PreparedStatement pstmt, ResultSet rSet) {
      try {
         if(rSet!=null) rSet.close();
         if(pstmt!=null) pstmt.close();
         if(conn!=null) conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}