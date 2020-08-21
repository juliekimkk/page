<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
section {
	border:1px solid black;
	width: 1000px;
	height:600px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin:0px;
	padding:0px;
}
#left {
	border:1px solid blue;
	width:200px;
	height:600px;
	margin:0px;
	padding:0px;
}
#center {
	border:1px solid red;
	width: 600px;
	height: 600px;
	margin:0px;
	padding:0px;
}
#right {
	border: 1px solid gray;
	width:200px;
	height:600px;
	margin:0px;
	padding:0px;
}
</style>
</head>
<body>

<section>

<div id="left">
<div>카테고리</div>
<div>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/shoppingmall?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		
		String query = "select * from category";
		
		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs.next()) {
%>
<br>
<%= rs.getString("c_name") %>




<%
		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
</div>
</div>







<div id="center">
<div>
<div>추천 상품</div>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn1 = null;
	Statement stmt1 = null;
	ResultSet rs1 = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/shoppingmall?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		
		String query = "select * from recommend";
		
		// 2. 데이터베이스 커넥션 생성
		conn1 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt1 = conn1.createStatement();
		
		// 4. 쿼리 실행
		rs1 = stmt1.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs1.next()) {
%>
<br>
<%= rs1.getString("r_name") %> : 
<%= rs1.getString("r_description") %>



<%
		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs1 != null) try { rs1.close(); } catch(SQLException ex) {}
		if (stmt1 != null) try { stmt1.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn1 != null) try { conn1.close(); } catch(SQLException ex) {}
	}
%>
</div>

<br>

<div>
<div>인기 상품</div>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn2 = null;
	Statement stmt2 = null;
	ResultSet rs2 = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/shoppingmall?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		
		String query = "select * from popular";
		
		// 2. 데이터베이스 커넥션 생성
		conn2 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt2 = conn2.createStatement();
		
		// 4. 쿼리 실행
		rs2 = stmt2.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs2.next()) {
%>
<br>

<%= rs2.getString("p_name") %> : 
<%= rs2.getString("p_description") %>



<%
		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs2 != null) try { rs2.close(); } catch(SQLException ex) {}
		if (stmt2 != null) try { stmt2.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn2 != null) try { conn2.close(); } catch(SQLException ex) {}
	}
%>
</div>

</div>

<div id="right">로그인
<form method="post" action="loginAction.jsp">	
	<div>
		<input type="text" placeholder="아이디" name="id" size=20>
	</div>
	<div>
		<input type="password" placeholder="비밀번호" name="pass" size=20>
	</div>
	<input type="submit" value="로그인">
</form>

</div>
</section>

</body>
</html>