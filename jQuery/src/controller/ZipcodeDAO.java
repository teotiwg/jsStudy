package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ZipcodeDAO {
			//멤버변수
			Connection con;//커넥션 객체를 멤버변수로 선언하여 DAO내에서 공유
			PreparedStatement psmt;
			ResultSet rs;
			//HashMap<String, String> MemberMap = new HashMap<String, String>();
			
			//기본생성자를 통한 오라클 연결
			public ZipcodeDAO() {
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
			
			// 우편번호 테이블에서 시/도 추출
			public ArrayList<String> getSido(){
				ArrayList<String> sidoAddr = new ArrayList<String>();
				// 시/도의 중복을 제거한 상태로 레코드 가져옴
				String sql = "SELECT sido FROM zipcode "
						+ " WHERE 1=1 "
						+ " GROUP BY sido "
						+ " ORDER BY sido ASC";
				try {
					psmt = con.prepareStatement(sql);
					rs = psmt.executeQuery();
					while(rs.next()) {
						sidoAddr.add(rs.getString(1));
					}
				}
				catch(Exception e) {}
				return sidoAddr;
			}
			
			// 시/도를 인수로 받아 해당 구/군을 추출
			public ArrayList<String> getGugun(String sido){
				ArrayList<String> gugunAddr = new ArrayList<String>();
				String sql = "SELECT DISTINCT gugun FROM zipcode "
						+ " WHERE sido=? "
						+ " ORDER BY gugun DESC";
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, sido);
					rs = psmt.executeQuery();
					while(rs.next()) {
						gugunAddr.add(rs.getString(1));
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return gugunAddr;
			}
			
}
