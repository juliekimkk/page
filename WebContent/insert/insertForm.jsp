<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>MEMBER 테이블 레코드 삽입</title></head>
<body>

<P>회원가입하기</P>
<form action="/sessionlogin/insert/insert.jsp" method="post"> 
<table border="1">
<tr>
    <td>아이디</td>
    <td><input type="text" name="memberid" size="15" onmouseover="this.style.background='white'" onmouseout="this.style.background='pink'"></td>
    <td>비밀번호</td>
    <td><input type="password" name="password" size="15" onmouseover="this.style.background='white'" onmouseout="this.style.background='pink'"></td>
      <tr>
      <td>이름</td>
    <td><input type="text" name="name" size="15" onmouseover="this.style.background='white'" onmouseout="this.style.background='pink'"></td>
      <td>이메일</td>
    <td><input type="text" name="email" size="15" onmouseover="this.style.background='white'" onmouseout="this.style.background='pink'"></td>
    </tr>  
    <tr>
      <td>주소</td>
    <td><input type="text" name="address" size="20" onmouseover="this.style.background='white'" onmouseout="this.style.background='pink'"></td>
    
    	<td>파일붙이기 :</td>
    	<td><input type="file" name="file1"/><br/></td>
   </tr>


<tr>
    <td colspan="4"><input type="submit" value="삽입"></td>
</tr>



</table>
</form>
</body>
</html>
