<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.stream.Stream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");
	String ps = request.getParameter("rmText");
	out.print(ps);
	String id = (String) session.getAttribute("id");
	
	File jsp = new File("C:"+File.separator+"Users"+File.separator+"YONSAI"+File.separator+"Desktop"+File.separator+
			"Coding"+File.separator+"memoDB"+File.separator+id);
	String f = "";
	File[] list = jsp.listFiles();
	
	for(int i = list.length - 1; i >= 0 ; i--) {
	    f = list[i].getName();
	    out.println(id);
	    out.println(f);
		Path path = Paths.get("C:","Users","YONSAI","Desktop","Coding","memoDB",id, f);
		List<String> strs = Files.readAllLines(path);
		int strsLength = strs.size() - 1;
		for(int j = strsLength; j >= 0; j--){
			try{
				if(strs.get(j).contains(ps)){
					strs.remove(j);
					Files.write(path, strs);
					response.sendRedirect("list");
					break;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}
%>

</body>
</html>