<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<%
if (request.getParameter("id") != null) {

	String Uid = request.getParameter("id");
	String Email = request.getParameter("email");
	String FName = request.getParameter("fname");
	String LName = request.getParameter("lname");
	String City = request.getParameter("city");
	String Contact = request.getParameter("number");
	String Gender = request.getParameter("gender");

	Connection conn = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
		PreparedStatement pst = conn.prepareStatement(
		"UPDATE customer SET Cfname = ?, Clname=?, Cemail=?,Cgender=?, Ccity=?, Ccontact=? WHERE cid="+Uid);
		pst.setString(1, FName);
		pst.setString(2, LName);
		pst.setString(3, Email);
		pst.setString(4, Gender);
		pst.setString(5, City);
		pst.setString(6, Contact);
		int rsdel = pst.executeUpdate();
		if (rsdel > 0) {
	out.print("success");
		} else {
	out.print("failed");
		}

	} catch (Exception e) {

	}

}
%>