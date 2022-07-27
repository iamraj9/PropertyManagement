<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<%
if (request.getParameter("Pid") != null) {

	String Pid = request.getParameter("Pid");
	String City = request.getParameter("city");
	String Ptype = request.getParameter("type");
	String Size = request.getParameter("size");
	String address = request.getParameter("address");
	String Description = request.getParameter("description");
	String Price = request.getParameter("rate");

	Connection conn = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
		PreparedStatement pst = conn.prepareStatement(
		"UPDATE property SET Property_type= ?, property_price=?, property_Size=?,Property_city=?,Property_address=?, Property_Description=? WHERE Pid="+Pid);
		pst.setString(1, Ptype);
		pst.setString(2, Price);
		pst.setString(3, Size);
		pst.setString(4, City);
		pst.setString(5, address);
		pst.setString(6, Description);
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