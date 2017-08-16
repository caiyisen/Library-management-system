<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*" %>
<% request.setCharacterEncoding("utf-8");
String msg = ""; 
String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8";
String stuid = request.getParameter("stuid");
String pno = request.getParameter("pno");
String user="root"; String pwd="w9hi2dnters"; 
String gno = request.getParameter("gno");
String num = request.getParameter("num"); 
if(request.getMethod().equalsIgnoreCase("post")){ 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection(connectString,user, pwd); 
	Statement stmt = con.createStatement(); 
	try{ 
		String fmt="insert into cp(gno,pno,num) values('%s','%s','%s')"; 
		String sql = String.format(fmt,gno,pno,num); 
		int cnt = stmt.executeUpdate(sql); 
		if(cnt>0) msg = "购买成功!"; 
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
<title>确认购买</title>
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
		<h1>确认购买</h1>
		<form action="confirm_buy.jsp?pno=<%=stuid %>" method="post" name="c">
			购买数量：  <input id="num" name="num" type="text">
			<br>
			<br>
			顾客编码：  <input id="gno" name="gno" type="text">
			<br>
			<br>
			<input type="submit"  name="save" value="确认购买">
			<input type="reset" name="clear" value="清空">
		</form>
			<br>
			<br>
			<a href='buy_newspaper.jsp'>返回</a>
			<%=msg %>
	</div>
</body>
</html>