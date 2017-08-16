<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
    
<% request.setCharacterEncoding("utf-8");
String msg = ""; 
String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8";
String user="root"; String pwd="w9hi2dnters"; 
String gno = request.getParameter("gno");
String addmission = request.getParameter("addmission");

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection(connectString,user, pwd); 
	Statement stmt = con.createStatement(); 
	try{ 	
		if(addmission!=null&&addmission.equals("1")){
			String fmt="update customer set addmission='%d' where gno='%s';";
			String sql = String.format(fmt,0,gno);
			int cnt = stmt.executeUpdate(sql);
			if(cnt>0) msg = "禁止权限成功！";
		}else{
			String fmt="update customer set addmission='%d' where gno='%s';";
			String sql = String.format(fmt,1,gno);
			int cnt = stmt.executeUpdate(sql);
			if(cnt>0) msg = "恢复权限成功！";
		}
				
		
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
<title>禁止权限</title>
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
		<%=msg %>
		<br>
		<br>
	<a href='manage_customer.jsp' >返回管理顾客界面</a>
	</div>

</body>
</html>