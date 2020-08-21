<%@ page contentType = "text/html; charset=utf-8" %>

<%@ page buffer="8kb" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String memberid = request.getParameter("memberid");   //가져온 변수를 각각 String 변수에 넣는다//
	String password= request.getParameter("password");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/sessionlogin?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		
		
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);  /*디비에 들록하는 부분*/
		pstmt = conn.prepareStatement(
			"insert into sessionlogin values (?, ? )");
		pstmt.setString(1, memberid);
		pstmt.setString(2, password);
		pstmt.executeUpdate();
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

	response.sendRedirect(request.getContextPath()+"/viewMemberList.jsp"); /*이거 넣으면 주소이동없이 바로이동 */
%>
<html>
<head><title>삽입</title></head>
<body>

MEMBER 테이블에 새로운 레코드를 삽입했습니다

</body>
</html>
