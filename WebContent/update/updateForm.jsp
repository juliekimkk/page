<%@ page contentType = "text/html; charset=utf-8" %>

<html>
<head><title>회원가입</title></head>

<body>

<form action="<%=request.getContextPath() %>/update/update.jsp" method="post">
<table border="1">
<h2>개인정보 수정페이지</h2>
<tr>
	<td>아이디</td>
	<td><input type="text"  name="memberID" size="10" ></td>
	<td>비밀번호</td>
	<td><input type="password" name="password" size="10" ></td>
</tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="name" size="10" ></td>
	<td>이메일</td>
	<td><input type="text" name="email" size="10" ></td>
<tr>	
	<td>주소</td>
	<td><input type="text" name="address" size="30" ></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="수정하기"></td>
	
</tr>

</table>
</form>

</body>


</html>
