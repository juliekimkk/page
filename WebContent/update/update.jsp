<%@ page contentType = "text/html; charset=utf-8" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	int updateCount = 0;
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement  pstmt= null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/sessionlogin?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		String query = "update sessionlogin set password=?, name=?, email=?, address=? from sessionlogin where id='"+id+"'";
		pstmt = conn.prepareStatement(query);

		pstmt.setString(1,  password);
		pstmt.setString(2,name);
		pstmt.setString(3, email);
		pstmt.setString(4, address);
		
		pstmt.executeUpdate();
		
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	response.sendRedirect(request.getContextPath()+"/viewMemberList.jsp"); /*이거 넣으면 주소이동없이 바로이동 */
%>

"insert into member values(' "     +     name    +     " ', '"
