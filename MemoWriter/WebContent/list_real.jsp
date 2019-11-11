<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" >
<style>
	header {text-align: center; /*border: 1px solid black;*/}
	header img{width: auto; height: 80px;}
	/*검색창, 새글쓰기,*/
	input {height: 22px;}
	.button { border: 1px solid skyblue; background-color: rgba(0,0,0,0); color: rgb(57, 57, 128); padding: 5px; }  
	a { background-color: rgba(0,0,0,0); color: rgb(57, 57, 128); padding: 5px; } 
	.button:hover, a:hover{ color:rgb(57, 57, 128); background-color: skyblue; }
	.search {margin: 30px auto 20px 0;height: 22px;}
	div .button2{border: 1px solid skyblue; color: white; background-color: skyblue;margin-left: 90px;
	            width: 100px; height: 30px; border-radius: 5px;
	}
	div .button2:hover {background-color: rgb(235, 189, 216);color:rgb(57, 57, 128); }
	/*body 영역*/
	 body div .button{margin:0 auto 0 90px}
	 table {border: 1px solid lightgray; width : 200px; height: 240px;
	 		margin:10px 50px 10px 90px; float: left; background-color: rgb(250, 250, 159);
	 }
	 section {border: 1px solid lightgray; height: 100%;width: 90%; margin:20px auto 20px auto ;
	      
	 }
	 a{position: fixed; top:0; right: 0;}
</style>
</head>
<body>
<header>
		<h1><img src="./캡처.PNG">블루하와이 메모장</h1>
</header>
	<div class=search>
		<button class=button><i class="fas fa-search"></i></button>
        <input type="text" name="keyword" >
	</div>
    <div>
        <button type="button" class=button2>새글쓰기</button>
	</div>
<section>
	    <table>
	    	<tr>
	    		<td>
                    내용을 입력하시오
                </td>
	    	</tr>
	    </table>
	    <table>
	    	<tr>
	    		<td></td>
	    	</tr>
	    </table>
	    <table>
	    	<tr>
	    		<td></td>
	    	</tr>
	    </table>
	    <table>
	    	<tr>
	    		<td></td>
	    	</tr>
	    </table>
	    <table>
	    	<tr>
	    		<td></td>
	    	</tr>
	    </table>
        
        <a href="#">로그아웃</a>
</section>
</body>
</html>