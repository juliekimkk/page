<%@ page contentType = "text/html; charset=utf-8" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/sessionlogin?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		String query = 
		   "select * from  sessionlogin where id = '"+request.getParameter("id")+"'";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(query);
		if( rs.next() ) {
%>


	

	<% request.setCharacterEncoding("utf-8"); %>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(id.equals(rs.getString("id")) && pass.equals(rs.getString("password"))){
		session.setAttribute("id",id);
		response.sendRedirect("viewMemberOne.jsp"); //아이디와 비밀번호가 일치할경우
		
	}else if(id.equals(rs.getString("id"))){
		out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
		
	}else if(pass.equals(rs.getString("password"))){
		out.println("<script>alert('아이디가 틀렸습니다.'); history.back();</script>");
		
	}else{
		out.println("<script>alert('아이디와 비밀번호가 틀렸습니다.'); history.back();</script>");
	}
		%>
		
<%
		}
	} catch(SQLException ex) {}
%>