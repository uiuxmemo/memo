<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	header { width: 600px; margin-left: auto; margin-right: auto; padding: 46px 0 20px 0;
	font-size: 80px; text-align:center ; font-family: 'Jeju Hallasan', cursive; margin-top:100px; margin-bottom: 50px;}
	*{margin:0; padding:0; box-sizing: border-box;}
	body {background : skyblue;  }
	#container label{display:block; font-size: 20px; text-align:left; margin-bottom:5px; font-weight: bold; color:white;}
	#container{width:600px; margin:auto; text-align: center; margin-bottom: 100px;}
	#pwd_label{margin-top:20px;}
	input{padding-left:5px; width:600px; height:40px; font-size:25px;}
	#login_btn, #register_btn{display:block; width:600px; height:50px; background-color:blue; color:white; font-weight:bold;
		border:none; text-decoration: none; font-size:25px; margin-top:40px; cursor:pointer; padding:5px 0 5px 0;}
	#login_link{text-decoration:none;}
</style>
</head>
<body>
<header>
    <a id="login_link" href="login_page"><span style ="color:springgreen;font-weight: bold ;">블루</span><span style = "color:greenyellow">하와이</span>
    <br><span style="color:blue">메모장</span></a>
</header>
<div id="container">
	<%
		session.removeAttribute("register_error");
		if(session.getAttribute("login_error") == null){
			session.setAttribute("login_error", "");
		}
	%>
	<p><%= session.getAttribute("login_error") %></p>
	<form action="login.jsp" method="post">
		<label for="id">아이디</label>
		<input type="text" name="id" placeholder="5 ~ 10자, 영문+숫자 조합" /><br>
		<label id="pwd_label" for="password">비밀번호</label>
		<input type="password" name="password" placeholder="5 ~ 15자"/><br>
		<button id="login_btn" type="submit">로그인</button>
	</form>
	<a id="register_btn" href="register_page">회원가입</a>
</div>
</body>
</html>