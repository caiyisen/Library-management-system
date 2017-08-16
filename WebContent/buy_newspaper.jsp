<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.sql.*"%>
    <%request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:mysql://localhost:3306/pfdingbao"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
        //StringBuilder table=new StringBuilder("");
        String pno[] = new String[30];
        String pna[] = new String[30];
        String ppr[] = new String[30];
        String psi[] = new String[30];
        String pdw[] = new String[30];
        int i = 0;
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "root", "w9hi2dnters");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from paper");
	  while(rs.next()) {
             //table.append(rs.getString("name"));
             pno[i] = rs.getString("pno");
             pna[i] = rs.getString("pna");
             ppr[i] = rs.getString("ppr");
             psi[i] = rs.getString("psi");
             pdw[i] = rs.getString("pdw");
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	
<html>
<head>
<title>购买报纸</title>
</head>
<body>
  <div class="container">
	  <h1>购买报纸</h1>  
  </div>
  	<table border="1" cellspacing="0" cellpadding="0" align="center">
  		<tr height="30" align="center">
  			<td width="100" >编号</td>
  			<td width="100" >报纸</td>
  			<td width="50" >价格</td>
  			<td width="60" >规格</td>
  			<td width="150" >出版社</td>
  			<td width="140">操作</td>
  		</tr>
  		<%for(int j=0;j<i;j++){ %>
  			<tr height="25" align="center">
 				<td><%out.print(pno[j]);%></td>
 				<td><%out.print(pna[j]);%></td>
 				<td><%out.print(ppr[j]);%></td>
 				<td><%out.print(psi[j]);%></td>
 				<td><%out.print(pdw[j]);%></td>
 				<td id="td1"><a class="change" href='confirm_buy.jsp?stuid=<%=pno[j]%>'>购买</a></td>
  			</tr>
  		<%} %>
  	</table>
  	<br>
  	<br>
  	<span id ="back"><a href='login.jsp'>返回登录界面</a></span>
</body>
</html>