<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
if(request.getParameter("delete")!=null)  {
	
	String Proid=request.getParameter("delete");
	Connection conn = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
		PreparedStatement pst = conn.prepareStatement("DELETE FROM property WHERE Pid=?;");
		pst.setString(1, Proid);
		int rsdel = pst.executeUpdate();
		if(rsdel>0) {
			out.print("success");
			request.setAttribute("propertyDelete", "success");
		}else{
			out.print("failed");
			request.setAttribute("propertyDelete", "failed");
		}
		
	}catch(Exception e){
		
	}
	
}  
    
    
    



%>