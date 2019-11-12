<%@page import="java.nio.file.StandardOpenOption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memo.Packet" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("password");
String pw_for_confirm = request.getParameter("confirm");
String error = "";
boolean idOrPwLong = true;
boolean IdNotExists = true;
boolean IdIsLetterOrDigit = true;
if(id.length() < 5 || pw.length() < 5){
	session.setAttribute("register_error", "아이디와 비밀번호를 5자 이상으로 입력하세요.");
	idOrPwLong = false;
}
Path dir = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB");
if(Files.notExists(dir)) {
	Files.createDirectories(dir);
}
Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB","registerInfo.txt");
if(Files.notExists(path)){
	Files.write(path, ("testtesttesttesttesttest"+System.lineSeparator()).getBytes(), StandardOpenOption.CREATE);
}
List<String> infos = Files.readAllLines(path);
if(idOrPwLong && infos.size() >= 2){
	for(String info : infos){
		if(info.substring(0,10).trim().equals(id)){
			IdNotExists = false;
			break;
		}
	}
}

for(int i = 0; i < id.length(); i++){
	if(!Character.isLetterOrDigit(id.charAt(i))){
		IdIsLetterOrDigit = false;
	}
}
if(IdIsLetterOrDigit == false){
	session.setAttribute("register_error", "아이디는 영문과 숫자만 가능합니다.");
}
if(idOrPwLong && IdNotExists && IdIsLetterOrDigit){
	if(pw.equals(pw_for_confirm)){
		if(id.length() <= 10 && pw.length() <= 15){
			Packet.inputIdAndPw(id, pw);
			session.removeAttribute("register_error");
			session.setAttribute("id", id);
			response.sendRedirect("list.jsp");			
		}else if(id.length() > 10){
			session.setAttribute("register_error", "아이디를 10자 이내로 써주세요");
		}else if(pw.length() > 15){
			session.setAttribute("register_error", "비밀번호를 15자 이내로 써주세요");
		}
	}else{
		session.setAttribute("register_error", "확인용 비밀번호가 틀립니다.");
	}
}else if(!IdNotExists && IdIsLetterOrDigit){
	session.setAttribute("register_error", "이미 존재하는 아이디입니다.");
}
if((String)session.getAttribute("register_error") != null){
	response.sendRedirect("register_test.jsp");
}


%>

</body>
</html>