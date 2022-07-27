<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

if(request.getParameter("prid")!=null){
	
	
	

String Prid=request.getParameter("prid");

ResultSet APdet = null; 
Connection APcon=null; 
APcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
PreparedStatement APpst = APcon.prepareStatement("select * from property where Pid=?");
APpst.setString(1, Prid);
APdet = APpst.executeQuery();
APdet.next();
String Pdescr=APdet.getString(11);
String loc=APdet.getString(10);
String Rate=APdet.getString(3);
String City =APdet.getString(8);
String Size=APdet.getString(7);
String Type=APdet.getString(2);





%>
<h4><%=Pdescr %></h4>
						<p>Rate: <%=Rate %></p>
						<p>Size: <%=Size %></p>
						<p>City: <%=City %></p>
						<p>Address: <%=loc %></p>
						<p>For: <%=Type %></p>
						
						
						<%
						}
						%>