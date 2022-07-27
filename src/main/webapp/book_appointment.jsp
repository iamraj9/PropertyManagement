<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*"%>
<%
String Pid = request.getParameter("Pid");
String Cid = request.getParameter("Cid");
String date =(new java.util.Date()).toLocaleString();



Connection connu = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	connu = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
	PreparedStatement pstu = connu.prepareStatement("insert into appointment(Status,Customer_id,PropertyId,Adate) values(1,?,?,?)");
	pstu.setString(1, Cid);
	pstu.setString(2, Pid);
	pstu.setString(3, date);
	
	int rcount= pstu.executeUpdate();
	out.print(Cid);
	out.print(Pid);
	out.print(date);
	

} catch (Exception e) {
	e.printStackTrace();
}







%>

