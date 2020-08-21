<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>MEMBER 테이블 레코드 삽입</title></head>
<body>


<form action="/sessionlogin/insert/insert.jsp" method="post"> 
<table border="1">
<tr>
    <td>아이디</td>
    <td><input type="text" name="memberid" size="10" onmouseover="this.style.background='white'" onmouseout="this.style.background='pink'"></td>
    <td>비밀번호</td>
    <td><input type="text" name="password" size="10" onmouseover="this.style.background='white'" onmouseout="this.style.background='pink'"></td>
</tr>

<tr>
    <td colspan="4"><input type="submit" value="삽입"></td>
</tr>



</table>
</form>
</body>
</html>
