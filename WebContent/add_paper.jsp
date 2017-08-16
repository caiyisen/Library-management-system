<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
<% request.setCharacterEncoding("utf-8");
String msg = ""; 
String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8";
String user="root"; String pwd="w9hi2dnters"; 
String pno = request.getParameter("pno"); 
String pna = request.getParameter("pna"); 
String ppr = request.getParameter("ppr"); 
String psi = request.getParameter("psi"); 
String pdw = request.getParameter("pdw"); 
if(request.getMethod().equalsIgnoreCase("post")){ 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection(connectString,user, pwd); 
	Statement stmt = con.createStatement(); 
	try{ 
		String fmt="insert into paper(pno,pna,ppr,psi,pdw) values('%s', '%s', '%s', '%s', '%s')"; 
		String sql = String.format(fmt,pno,pna,ppr,psi,pdw); 
		int cnt = stmt.executeUpdate(sql); 
		if(cnt>0) msg = "上架成功!"; 
		stmt.close(); 
		con.close(); 
	}catch (Exception e){ 
		msg = e.getMessage(); 
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新报纸上架</title>
</head>
	<style>
 	a:link,a:visited{color:blue;}
	.container{
		margin:0 auto;
		text-align:center;
	}
 </style>
<body>
	<div class="container">
		<h1>新报纸上架</h1>
		<form action="add_paper.jsp?" method="post" name="m">
			编号：<input id="pno" name="pno" type="text" >
			<br>
			<br>
			名字：  <input id="pna" name="pna" type="text">
			<br>
			<br>
			价格：<input id="ppr" name="ppr" type="text" >
			<br>
			<br>
			规格：<input id="psi" name="psi" type="text" >
			<br>
			<br>
			出版商：<input id="pdw" name="pdw" type="text" >
			<br>
			<br>
			<input type="submit"  name="save" value="上架">
			<input type="reset" name="clear" value="清空">
		</form>
			<br>
			<br>
			<a href='manage.jsp'>返回</a>
			<%=msg %>
	</div>
</body>
</html>