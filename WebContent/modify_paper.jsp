<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
    
<% request.setCharacterEncoding("utf-8");
String msg = ""; 
String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8";
String user="root"; String pwd="w9hi2dnters"; 
String stuid = request.getParameter("stuid");
String pno = request.getParameter("pno");

String ppr = request.getParameter("ppr"); 
String psi = request.getParameter("psi"); 

if(request.getMethod().equalsIgnoreCase("post")){ 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection(connectString,user, pwd); 
	Statement stmt = con.createStatement(); 
	try{ 	
		String fmt="update paper set ppr='%s',psi='%s' where pno='%s';";
		String sql = String.format(fmt,ppr,psi,pno);
		int cnt = stmt.executeUpdate(sql);
		if(cnt>0) msg = "修改成功！";		
		
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
<title>修改报纸信息</title>
</head>
<style type="text/css">
	a:link,a:visited{color:blue;}
	.container{
		margin:0 auto;
		text-align:center;
	}
</style>
<body>
	<div class="container">
		<h1>修改报纸信息</h1>
		<form action="modify_paper.jsp?pno=<%=stuid %>" method="post" name="m">
			新价格：<input id="ppr" name="ppr" type="text">
			<br>
			<br>
			新规格：  <input id="psi" name="psi" type="text">
			<br>
			<br>
			<input type="submit"  name="save" value="确认修改">
			<input type="reset" name="clear" value="清空">
		</form>
			<br>
			<br>
			<a href='manage.jsp'>返回</a>			
			<%=msg %>
	</div>
</body>
</html>