package com.cos.jspProject.config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DB {
	//서버에 등록된 커넥션 풀에서 DB 연결을 받아옴.
	public static Connection getConnection() {
		try {
			Context initContext = new InitialContext(); //JNDI를 통해 서버 설정을 가져오기 위한 시작점
			Context envContext  = (Context)initContext.lookup("java:/comp/env"); //Tomcat의 컨텍스트 환경설정 영역.
			DataSource ds = (DataSource)envContext.lookup("jdbc/jsp_project"); // 우리가 Tomcat context.xml에 등록한 JNDI 이름
			Connection conn = ds.getConnection();
		//DB 연결이 되었나 체크
			return conn;
		} catch (Exception e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
		return null;
	}
	//자원 해제용 메소드들
	//DB 연결이 끝나고 나면 자원을 반드시 반납해야 해. 자원을 닫지 않으면 메모리 누수, 커넥션 누수 발생해서 서버가 뻗어.
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}