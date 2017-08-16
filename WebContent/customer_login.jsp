<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
 <%  request.setCharacterEncoding("utf-8");
	String msg ="";
	String username = request.getParameter("username"); 
	String password = request.getParameter("password");  
	
	String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
   	
	boolean login = false;
       
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "root", "w9hi2dnters");
  	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from customer");
	  while(rs.next()) {
             if(username!=null&&password!=null
            		 &&username.equals(rs.getString("username"))
            		 &&password.equals(rs.getString("userpassword"))&&rs.getInt("addmission")==1)
             {
            	 int gno = rs.getInt("gno");
            	 msg = "登录成功！您的指定编码是："+gno;
           			
            	 login = true;
            	 break;
             }
             
	  }
	  
	  rs.close();
	  stmt.close();
	  con.close();
	}
	catch (Exception e){
	  msg = e.getMessage();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
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
		<h1>顾客登录</h1>
		<form action="customer_login.jsp?" method="post" name="m">
			用户名：<input id="username" name="username" type="text">
			<br>
			<br>
			密码：  <input id="password" name="password" type="password">
			<br>
			<br>
			<input type="submit"  name="save" value="登录">
			<input type="reset" name="clear" value="清空">
		</form>
			<br>
			<br>
			<a href='login.jsp'>返回</a>
			<a href='customer_regeister.jsp'>注册</a>
			<a <%if(login==true){ %>href="buy_newspaper.jsp"<%} %><%else { %>href="customer_login.jsp"<%} %>>购买报纸</a>
			<%=msg %>
	</div>
</body>
</html>