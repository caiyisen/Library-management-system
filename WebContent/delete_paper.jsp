<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
<%
String stuid = request.getParameter("stuid");
String msg = ""; 
String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8";
String user="root"; String pwd="w9hi2dnters"; 
 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection(connectString,user,pwd); 
	Statement stmt = con.createStatement(); 
	try{ 
		
		int cnt = stmt.executeUpdate("delete from paper where pno ="+stuid);
		if(cnt>0) msg = "下架成功！"; 
		stmt.close(); 
		con.close(); 
	}catch (Exception e){ 
		msg = e.getMessage(); 
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>报纸下架</title>
</head>
<style>
	a:link,a:visited{color:blue;}
	.container{
		margin:0 auto;
		width:500px;
		text-align:center;
	}
</style>
<body>
	<div id="container">
		<h1>报纸下架</h1>
		<%=msg %>
		<br>
		<br>
	<a href='manage.jsp' >返回</a>
	</div>

</body>
</html>