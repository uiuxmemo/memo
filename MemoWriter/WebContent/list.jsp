<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.lang.StringIndexOutOfBoundsException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0; padding:0; box-sizing: border-box;}
	.memo{display:block; border: 1px solid black; width: 100%; height: 150px; resize: none;}
	.dtime{display:block; height:22px;}
	.textContainer{display:block; position:relative; border: 1px solid red; width: 25%; float:left;  margin:10px; height:auto;}
	.removeBtn{position:absolute; top:0px; right:0px;}
	.editBtn{position:absolute; top:0px; right:30px;}
	.addMemo{display:none;}
</style>
</head>
<body>
메모장 목록

<%
	StringBuilder ps = new StringBuilder();
	String id = (String) session.getAttribute("id");
	
	File jsp = new File("C:"+File.separator+"Users"+File.separator+"YONSAI"+File.separator+"Desktop"+File.separator+
			"Coding"+File.separator+"memoDB"+File.separator+id);
	String f = "";
	File[] list = jsp.listFiles();

	for(int i = list.length - 1; i >= 0 ; i--) {
	    f = list[i].getName();
	    out.println(id);
	    out.println(f);
	    out.print((String) session.getAttribute("test"));
		Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB",id, f);
		List<String> strs = Files.readAllLines(path);
		int strsLength = strs.size() - 1;
		for(int j = strsLength; j >= 0; j--){
			try{
				String date = f.substring(0, 8) + " ";
				String time = strs.get(j).substring(0, 5);
				String text = strs.get(j).substring(12);
				ps.append("<span class=\"textContainer\"><p class=\"dtime\">"+ date + time 
						+"</p><form action=\"edit.jsp\" method=\"post\"><textarea class=\"memo\" name=\"tarea\">" + text +
						"</textarea><input style=\"display:none\" type=\"text\" name=\"edText\" value=" + strs.get(j).substring(0,12)
						+ "><button class=\"editBtn\" type=\"submit\">저장</button></form><form action=\"remove.jsp\" method=\"post\">"
						+ "<input style=\"display:none\" type=\"text\" name=\"rmText\" value=" + strs.get(j).substring(0,12)
						+ "><button class=\"removeBtn\" type=\"submit\">삭제</button></form></span>");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
%>
<div>
	<form action="search.jsp" method="post">
		<input type="text" name="search" />
		<button type="submit">검색</button>
	</form>
</div>
<div>
	<form action="save_memo.jsp" method="post">
		<input class="addMemo" name="memo"><button type="submit">새 메모</button>
	</form>
</div>
<div>
	<%= ps %>
</div>
</body>
</html>