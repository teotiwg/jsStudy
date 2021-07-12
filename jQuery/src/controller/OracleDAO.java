package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




//import model.MemberDTO;

public class OracleDAO {

	//멤버변수
		Connection con;//커넥션 객체를 멤버변수로 선언하여 DAO내에서 공유
		PreparedStatement psmt;
		ResultSet rs;
		//HashMap<String, String> MemberMap = new HashMap<String, String>();
		
		//기본생성자를 통한 오라클 연결
		public OracleDAO() {
			try {
				Context ctx = new InitialContext();
				DataSource source = (DataSource)ctx.lookup("java:comp/env/dbcp_myoracle");
				con = source.getConnection();
				System.out.println("DBCP연결성공");
			}
			catch(Exception e) {
				System.out.println("DBCP연결실패");
				e.printStackTrace();
			}
		}
		
		public boolean isMember(String id, String pass) {
		 
			//쿼리문 작성
			String sql = "SELECT COUNT(*) FROM member "
					+ " WHERE id=? AND pass=?";
			
			int isMember = 0;

			try {
				//쿼리문을 인수로 prepare객체를 생성한다. 
				psmt = con.prepareStatement(sql);
				//쿼리문의 인파라미터를 설정한다. DB의 인덱스는 1부터 시작함.
				psmt.setString(1, id);
				psmt.setString(2, pass);
				//select쿼리문의 실행결과는 ResultSet객체를 통해 반환받는다.
				rs = psmt.executeQuery();
				//실행결과를 얻어오기 위해 next()를 호출하여 커서를 이동시킨다.
				rs.next();
				//실행결과중 첫번째 값을 얻어오기 위해 getInt()를 사용한다. 
				isMember = rs.getInt(1);
				System.out.println("affected:"+isMember);
				if(isMember==0) //회원이 아닌경우(아이디 패스워드로 회원을 찾을수 없음)
					return false;
				//else //회원인 경우(아이디, 패스워드 일치함)
					//return true; 
			}
			catch(Exception e) {
				//예외가 발생한다면 확인이 불가하므로 무조건 false를 반환한다. 
				e.printStackTrace();
				return false;
			}
			return true;
		}

		public void close() {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(con != null) con.close();
			}
			catch(Exception e) {
				System.out.println("JDBC 자원 반납 시 예외발생");
			}
		}
	
}
