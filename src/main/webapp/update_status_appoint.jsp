<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<%
String AppointmentID = request.getParameter("appoiid");
String AgentID = request.getParameter("Agentid");
String ActionTaken = request.getParameter("actiontaken");
String ActionNotes = request.getParameter("action_notes");

Connection conn = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
	PreparedStatement pst = conn.prepareStatement("UPDATE appointment SET Status = ?, agent_notes=?, agent_id=? WHERE Aid=" + AppointmentID);
	pst.setString(1, ActionTaken);
	pst.setString(2, ActionNotes);
	pst.setString(3, AgentID);
	
	
	int rsdel = pst.executeUpdate();
	if (rsdel > 0) {
		out.print("success");
	} else {
		out.print("failed");
	}

} catch (Exception e) {

}
%>