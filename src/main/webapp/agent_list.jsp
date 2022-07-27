<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<div style="display:flex;flex-wrap:wrap;justify-content:space-around">
<%

if(request.getParameter("agent_list")!=null){
	
	
	

String Agent_request=request.getParameter("agent_list");

ResultSet rs = null; 
Connection APcon=null; 


String Agentid = null;
String Afname =null;
String Alname = null;
String Aemail = null;
String Acity = null;
String Acontact = null;
String Agender = null;



APcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
PreparedStatement APpst = APcon.prepareStatement("select * from customer where user_type=3");
rs = APpst.executeQuery();

 while(rs.next()){
	 Agentid = rs.getString(1);
	 Afname = rs.getString(2);
	 Alname = rs.getString(3);
	 Aemail = rs.getString(4);
	 Acity = rs.getString(8);
	  Acontact = rs.getString(10);
	  Agender = rs.getString(6);
	 out.print("<div class='card-body' style='border:1px solid;padding:15px;margin: 20px;width: 300px;box-shadow:0 0 8px;border-radius:10px'>");
	 
	 out.print("<p> Agent ID: "+Agentid+"</p>");
	 out.print("<p> Name: "+Afname+" "+Alname+"</p>");
	 out.print("<p> Email: "+Aemail+"</p>");
	 out.print("<p> Contact no."+Acontact+"</p>");
	 out.print("<p> City: "+Acity+"</p>");
	 out.print("<p> Gender: "+Agender+"</p>");
	
	 
	 
	 
	 
	 
	 out.print("</div>");
	 
	 
	 
 }



}

%>
</div>
