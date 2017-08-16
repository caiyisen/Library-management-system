<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
    <%request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
			+ "?autoReconnect=true&useUnicode=true"
			+ "&characterEncoding=UTF-8";
        
        String gno[] = new String[30];
        String gna[] = new String[30];
        String gte[] = new String[30];
        String gad[] = new String[30];
        String gpo[] = new String[30];
        String username[] = new String[30];
        String password[] = new String[30];
        int addmission[] = new int[30];
        int i = 0;
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "root", "w9hi2dnters");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from customer");
	  while(rs.next()) {
             
             gno[i] = rs.getString("gno");
             gna[i] = rs.getString("gna");
             gte[i] = rs.getString("gte");
             gad[i] = rs.getString("gad");
             gpo[i] = rs.getString("gpo");
             username[i] = rs.getString("username");
             password[i] = rs.getString("userpassword");
             addmission[i] = rs.getInt("addmission");
             i++;
	  }
	  rs.close();
	  stmt.close();
	  con.close();
	}
	catch (Exception e){
	  msg = e.getMessage();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>管理顾客</title>
</head>
<style>
		.change{
			color:blue;
			text-decoration: underline; 
		}
		#td1{
			white-space:pre;
		}
		.back{
			color:blue;
			text-decoration: underline;
			text-align:center;
		}
		h1{
			text-align:center;
		}
	</style>
<body>
  <div class="container">
	  <h1>管理顾客</h1>  
  </div>
  	<table border="1" cellspacing="0" cellpadding="0" align="center">
  		<tr height="30" align="center">
  			<td width="50" >编码</td>
  			<td width="100" >姓名</td>
  			<td width="100" >电话</td>
  			<td width="200" >地址</td>
  			<td width="80" >邮编</td>
  			<td width="130" >登录用户名</td>
  			<td width="120" >登录密码</td>
  			<td width="50" >权限</td>
  			<td width="180">操作</td>
  		</tr>
  		<%for(int j=0;j<i;j++){ %>
  			<tr height="25" align="center">
 				<td><%out.print(gno[j]);%></td>
 				<td><%out.print(gna[j]);%></td>
 				<td><%out.print(gte[j]);%></td>
 				<td><%out.print(gad[j]);%></td>
 				<td><%out.print(gpo[j]);%></td>
 				<td><%out.print(username[j]);%></td>
 				<td><%out.print(password[j]);%></td>
 				<td><%out.print(addmission[j]);%></td>
 				<td id="td1"><a class="change" href='disabled_customer.jsp?gno=<%=gno[j]%>&addmission=<%=addmission[j]%>'>更改权限</a>   <a class="change" href='delete_customer.jsp?stuid=<%=gno[j]%>'>删除用户</a></td>
  			</tr>
  		<%} %>
  	</table>
  	<br>
  	<br>
  	<span id ="back"><a href='manage.jsp'>返回管理界面</a> 
</body>
</html>