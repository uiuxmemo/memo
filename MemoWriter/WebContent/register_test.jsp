<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	header { width: 600px; margin-left: auto; margin-right: auto; padding: 46px 0 20px 0;
	font-size: 80px; text-align:center ; font-family: 'Jeju Hallasan', cursive; margin-top:100px; margin-bottom: 50px;}
	*{margin:0; padding:0; box-sizing: border-box;}
	body {background : skyblue;  }
	#container label{display:block; font-size: 20px; text-align:left; margin-bottom:5px; font-weight: bold; color:white;}
	#container{width:600px; margin:auto; text-align: center;}
	#pwd_label, #pwd_confirm{margin-top:20px;}
	input{width:600px; height:40px; font-size:25px;}
	#login_btn, #register_btn{display:block; width:600px; height:50px; background-color:blue; color:white; font-weight:bold;
		border:none; text-decoration: none; font-size:25px; margin-top:40px; cursor:pointer;}
	#login_link{text-decoration:none;}
</style>
<body>
<header>
    <a id="login_link" href="login_test.jsp"><span style ="color:springgreen;font-weight: bold ;">블루</span> <span style = "color:greenyellow">하와이</span></a>
</header>
<div id="container">
	<% 
		session.removeAttribute("login_error");
		if(session.getAttribute("register_error") == null){
			session.setAttribute("register_error", "");
	}
	%>
	<p><%= session.getAttribute("register_error") %></p>
	<form action="register.jsp" method="post">
		<label for="id">아이디</label>
		<input type="text" name="id" /><br>
		<label id="pwd_label" for="password">비밀번호</label>
		<input type="password" name="password" /><br>
		<label id="pwd_confirm" for="confirm">비밀번호 확인</label>
		<input type="password" name="confirm" /><br>
		<button id="register_btn" type="submit">회원가입</button>
	</form>
</div>
</body>
</html>