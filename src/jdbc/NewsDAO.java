package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class NewsDAO {
   // insert
   public static boolean insert(String title, String upfolder, String filename, String uuid) {
      boolean result = false;
      String sql = "INSERT INTO news (ntitle, nupfolder, nuuid, nfilename) VALUES (?, ?, ?, ?)";
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         conn = ConnectionPool.get();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, title);
         pstmt.setString(2, upfolder);
         pstmt.setString(3, uuid);
         pstmt.setString(4, filename);
         
         result = pstmt.executeUpdate() == 1 ? true : false;
      } catch (SQLException | NamingException e) {
         e.printStackTrace();
      } finally {
         close(conn, pstmt, null);
      }
      return result;
   }
   
 //사진 최근꺼 하나 꺼내기
   public static NewsDTO select() throws SQLException, NamingException  {
   	
   	Connection conn = null;
   	PreparedStatement pstmt = null;
   	ResultSet rs = null;
   	NewsDTO ndto = null;
   	
   	try {
   		String sql = "SELECT * FROM news WHERE ndate = (SELECT MAX(ndate) FROM news)";

   		conn = ConnectionPool.get();
   		pstmt = conn.prepareStatement(sql);
   				
   		rs = pstmt.executeQuery(); 	
   		
   		if(rs.next()) {	
   			ndto = new NewsDTO();
   			ndto.setNno(rs.getInt("nno"));
   			ndto.setNtitle(rs.getString("ntitle"));
   			ndto.setNupfolder(rs.getString("nupfolder"));
   			ndto.setNuuid(rs.getString("nuuid"));
   			ndto.setNfilename(rs.getString("nfilename"));
   			ndto.setNdate(rs.getString("ndate"));
   			
   		} return ndto;
   		
   	}finally {
   		if(rs != null) rs.close();
   		if(pstmt != null) pstmt.close();
   		if(conn != null) conn.close();
   	}

   }

   // DB 데이터 전체 삭제
   public static boolean delete() {
      boolean result = false;
      String sql = "DELETE FROM news";
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