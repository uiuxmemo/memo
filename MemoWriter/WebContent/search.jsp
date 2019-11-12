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
<link rel="stylesheet" 
href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" >
<style type="text/css">
	*{margin:0; padding:0; box-sizing: border-box;}
	#head_link{text-decoration: none; color:blue;}
	#head_link:link, #head_link:visited {
		color: blue;
		text-decoration: none;
		cursor: pointer;
	}

	#head_link:link:active, #head_link:visited:active {
 		color: blue;
	}
	#logoutBtn:link, #logoutBtn:visited {
		color: red;
		text-decoration: none;
		cursor: pointer;
	}

	#logoutBtn:link:active, #logoutBtn:visited:active {
 		color: red;
	}
	h1{font-size:50px;}
	body{display:block;}
	.memo{background-color: rgb(250, 250, 159); display:block; border: 2px solid black; width: 100%; height: 360px; resize: none; font-family: "Malgun Gothic"; font-size: 25px;}
	.dtime{display:block; height:40px; font-family: "Malgun Gothic"; font-size: 25px;}
	.textContainer{display:block; position:relative; border: 2px solid black; width: 400px; float:left;
					background-color: rgb(250, 250, 159); margin:10px; height:400px; margin-top:30px;}
	.removeBtn{position:absolute; top:0px; right:0px; height: 40px; width: 60px; font-size:20px;
				background-color: orange; border:none; color:white; font-weight: bold; cursor:pointer;}
	.editBtn{position:absolute; top:0px; right:60px; height: 40px; width: 60px; font-size:20px; 
				background-color:green; border:none; color:white; font-weight: bold; cursor:pointer;}
	.addMemo{display:none;}
	#logoutBtn{text-decoration: none; position: absolute; top:0; right: 100px; font-size:15px;}
	#id_show{position:absolute; top:0; right: 180px; font-size: 15px;}
	.memoBtn{border: 1px solid skyblue; font-size:20px; font-weight: bold; color: white; background-color: skyblue; margin-left: 10px;
	            width: 150px; height: 40px; border-radius: 5px; cursor: pointer;}
	
	#search{position: relative; width: 350px; margin-left: 10px; height:30px;}
	#search_btn{position:absolute; top:0px; right:0px; height:33px; width:30px; font-size:20px; 
				background-color: white; border: none;}
	#search_btn:hover{background-color: skyblue; cursor:pointer;}
	#search_input{positoin:absolute; top:0px; left:0px; width: 150px, height:30px; font-size:25px;}
	#new_memo{margin-top:20px;}
	#head{text-align: center; margin-bottom:40px; margin-top:30px;}
	#contents{width: 95%; height:auto; margin-left:auto; margin-right:auto; padding-left:50px;}
</style>
</head>
<body>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	StringBuilder ps = new StringBuilder();
	String id = (String) session.getAttribute("id");
	
	File jsp = new File("C:"+File.separator+"Users"+File.separator+"YONSAI"+File.separator+"Desktop"+File.separator+
			"Coding"+File.separator+"memoDB"+File.separator+id);
	String f = "";
	File[] list = jsp.listFiles();

	for(int i = list.length - 1; i >= 0 ; i--) {
	    f = list[i].getName();
		Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB",id, f);
		List<String> strs = Files.readAllLines(path);
		int strsLength = strs.size() - 1;
		for(int j = strsLength; j >= 0; j--){
			try{
				if(strs.get(j).substring(12).contains(search)){
					String date = f.substring(0, 8) + " ";
					String time = strs.get(j).substring(0, 5);
					String text = strs.get(j).substring(12);
					ps.append("<span class=\"textContainer\"><p class=\"dtime\">"+ date + time 
							+"</p><form action=\"edit.jsp\" method=\"post\"><textarea class=\"memo\" name=\"tarea\">" + text +
							"</textarea><input style=\"display:none\" type=\"text\" name=\"edText\" value=" + strs.get(j).substring(0,12)
							+ "><button class=\"editBtn\" type=\"submit\">저장</button></form><form action=\"remove.jsp\" method=\"post\">"
							+ "<input style=\"display:none\" type=\"text\" name=\"rmText\" value=" + strs.get(j).substring(0,12)
							+ "><button class=\"removeBtn\" type=\"submit\">삭제</button></form></span>");					
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
%>
<p id="id_show">ID: <%=id %></p>
<a id="logoutBtn" href="logout.jsp">로그아웃</a>
<div id="head">
	<h1><a id="head_link" href="list.jsp">블루하와이 메모장</a></h1>
</div>
<div id="contents">
	<div id="search">
		<form action="search.jsp" method="post">
			<input id="search_input" type="text" name="search" value="<%= search %>"/>
			<button id="search_btn" type="submit"><i class="fas fa-search"></i></button>
		</form>
	</div>
	<div id="new_memo">
		<form action="save_memo.jsp" method="post">
			<input class="addMemo" name="memo"><button class="memoBtn" type="submit">새 메모</button>
		</form>
	</div>
	<div id="text_contents">
		<%= ps %>
	</div>
</div>
</body>
</html>
