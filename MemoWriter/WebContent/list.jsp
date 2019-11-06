<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.util.List" %>
<%@ page import="memo.MemoPaper" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
메모장 목록
<%
	Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB","jaehyun", "1106.txt");
	List<String> strs = Files.readAllLines(path);
	for(String str : strs){
	   out.println(str);
	}
%>
</body>
</html>