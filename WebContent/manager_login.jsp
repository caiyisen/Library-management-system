<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%request.setCharacterEncoding("utf-8");
     String admin = request.getParameter("admin");
     String password = request.getParameter("password"); 
    String msg= "";
    boolean login = false;
    if(admin!=null&&password!=null&&admin.equals("admin")&&password.equals("123456")){
    	msg = "登录成功";
    	login = true;
    }
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员登录</title>
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
		<h1>管理员登录</h1>
		<form action="manager_login.jsp?" method="post" name="m">
			用户名：<input id="admin" name="admin" type="text">
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
			<a <%if(login==true){ %>href="manage.jsp"<%} %><%else { %>href="manager_login.jsp"<%} %>>进去管理页面</a>
			
			<%=msg %>
	</div>
</body>
</html>