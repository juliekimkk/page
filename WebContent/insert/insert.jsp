<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="member.*" %>
<%@ page buffer="8kb" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<jsp:useBean id="memberInfo"  class="member.MemberInfo"  scope="session"/>
<jsp:setProperty name="memberInfo" property="*" />

<%
	FileOutputStream fos= new FileoutputStream("./aaa.txt");
	InputStream is = null;
	InputStreamReader isr= null;

	out.print("[");
	out.print(request.getContentStream);
	

	try {
		is = new FileOutputStream("is.txt");
		is = new PrintStream(fos);
		System.setOut(ps);    //  System.out의 출력대상을 test.txt파일로 변경
	} catch(FileNotFoundException e) {
		System.err.println("File not found.");
	} 
	
	while (%>
<%
	request.setCharacterEncoding("utf-8");

	String UserID = memberInfo.getMemberid();
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/sessionlogin?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);  /*디비에 들록하는 부분*/
		
		
		pstmt = conn.prepareStatement("insert into sessionlogin values (?, ?, ?, ?, ?)");
		
		pstmt.setString(1,  memberInfo.getMemberid());
		pstmt.setString(2,memberInfo.getPassword());
		pstmt.setString(3, memberInfo.getName());
		pstmt.setString(4, memberInfo.getEmail());
		pstmt.setString(5, memberInfo.getAddress());
		
		pstmt.executeUpdate();
		
		session.setAttribute("memberid", UserID);
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	response.sendRedirect(request.getContextPath()+"/viewMemberOne.jsp?memberid="+UserID); /*이거 넣으면 주소이동없이 바로이동 */
%>
<html>
<head><title>삽입</title></head>
<body>

MEMBER 테이블에 새로운 레코드를 삽입했습니다

</body>
</html>
