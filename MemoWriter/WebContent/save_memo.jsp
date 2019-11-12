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
// 인코딩
request.setCharacterEncoding("utf-8");

String id = (String) session.getAttribute("id");
String memo = request.getParameter("memo");

Packet.inputMemo(id, memo);
response.sendRedirect("list");
%>

</body>
</html>