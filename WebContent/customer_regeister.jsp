<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
	<% request.setCharacterEncoding("utf-8");
	String msg = ""; 
	String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
			+ "?autoReconnect=true&useUnicode=true"
			+ "&characterEncoding=UTF-8";
	String user="root"; String pwd="w9hi2dnters"; 
	String username = request.getParameter("username"); 
	String password = request.getParameter("password");
	String gna = request.getParameter("gna");
	String gte = request.getParameter("gte");
	String gad = request.getParameter("gad");
	String gpo = request.getParameter("gpo");
	int addmission = 1;
	if(request.getMethod().equalsIgnoreCase("post")){ 
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(connectString,user, pwd); 
		Statement stmt = con.createStatement(); 
		try{ 
			String fmt="insert into customer(gna,gte,gad,gpo,username,userpassword,addmission) values('%s','%s','%s','%s','%s','%s','%d')"; 
			String sql = String.format(fmt,gna,gte,gad,gpo,username,password,addmission); 
			int cnt = stmt.executeUpdate(sql); 
			if(cnt>0) msg = "注册成功!"; 
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
<title>用户注册</title>
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
		<h1>顾客注册</h1>
		<form action="customer_regeister.jsp?" method="post" name="m">
			用户名：<input id="username" name="username" type="text" >
			<br>
			<br>
			密码：  <input id="password" name="password" type="password">
			<br>
			<br>
			姓名：<input id="gna" name="gna" type="text" >
			<br>
			<br>
			电话：<input id="gte" name="gte" type="text" >
			<br>
			<br>
			地址：<input id="gad" name="gad" type="text" >
			<br>
			<br>
			邮编：<input id="gpo" name="gpo" type="text" >
			<br>
			<br>
			<input type="submit"  name="save" value="保存">
			<input type="reset" name="clear" value="清空">
		</form>
			<br>
			<br>
			<a href='customer_login.jsp'>返回</a>
			<%=msg %>
	</div>
</body>
</html>