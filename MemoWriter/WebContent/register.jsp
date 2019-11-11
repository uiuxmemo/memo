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
boolean IdNotExists = true;
boolean IdIsLetterOrDigit = true;
Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB","registerInfo.txt");
List<String> infos = Files.readAllLines(path);
for(String info : infos){
	if(info.substring(0,10).trim().equals(id)){
		IdNotExists = false;
		break;
	}
}

for(int i = 0; i < id.length(); i++){
	if(!Character.isLetterOrDigit(id.charAt(i))){
		IdIsLetterOrDigit = false;
		break;
	}
}
if(IdIsLetterOrDigit == false){
	out.print("아이디는 영문과 숫자만 가능합니다.");
}
if(IdNotExists && IdIsLetterOrDigit){
	if(pw.equals(pw_for_confirm)){
		if(id.length() <= 10 && pw.length() <= 15){
			out.print("계정 생성 성공");
			Packet.inputIdAndPw(id, pw);	
		}else if(id.length() > 10){
			out.print("아이디를 10자 이내로 써주세요");
		}else if(pw.length() > 15){
			out.print("비밀번호를 15자 이내로 써주세요");
		}
	}else{
		out.print("확인용 비밀번호가 틀립니다.");
	}
}else if(!IdNotExists && IdIsLetterOrDigit){
	out.print("이미 있는 아이디입니다.");
}


%>

</body>
</html>