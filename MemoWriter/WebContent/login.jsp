<%@page import="javafx.scene.shape.Line"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.util.List" %>
<%@ page import="memo.Item" %>
<%@ page import="memo.Packet" %>

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
boolean idOrPwLong = true;
boolean IdNotExists = true;
boolean PwNotExists = true;
if(id.length() < 5 || pw.length() < 5){
	session.setAttribute("login_error", "아이디와 비밀번호를 5자 이상으로 입력하세요.");
	idOrPwLong = false;
}
if(idOrPwLong){
	Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB","registerInfo.txt");
	Packet packet = new Packet();
	Item item1 = Item.create("ID", 10, id);
	Item item2 = Item.create("PW", 15, pw);
	packet.addItem(item1);
	packet.addItem(item2);
	String check = packet.raw();
	List<String> infos = Files.readAllLines(path);
	for(String info : infos){
		if(info.substring(0,10).trim().equals(id)){
			IdNotExists = false;
		}
		if(info.substring(10).trim().equals(pw)){
			PwNotExists = false;
		}
		if(info.substring(0,10).trim().equals(id) && info.substring(10).trim().equals(pw)){
			session.setAttribute("id", id);
			session.removeAttribute("login_error");
			response.sendRedirect("list");
			break;
		}
	}
	//if(infos.contains(check)){
	//	session.setAttribute("id", id);
	//	session.removeAttribute("login_error");
	//	response.sendRedirect("list.jsp");
	//}
}
if(idOrPwLong && IdNotExists){
	session.setAttribute("login_error", "존재하지 않는 아이디입니다");
}else if(idOrPwLong && !IdNotExists){
	if(PwNotExists){
		session.setAttribute("login_error", "비밀번호가 틀립니다");
	}
}
if((String)session.getAttribute("login_error") != null){
	response.sendRedirect("login_page");
}
%>
</body>
</html>