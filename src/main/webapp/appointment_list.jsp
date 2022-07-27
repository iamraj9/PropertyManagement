<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<div class="card"
	style="display: flex; flex-flow: column; align-items:center;width:800px;"><br>
	<div style="width: 100%; text-align: right">
						<button type="button" class="btn-close"
							onclick="closeAppointmentList()" aria-label="Close"></button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<h3>Appointments booked by Customer</h3>
	<%
	String Aid = request.getParameter("agent_id");

	ResultSet rs = null;
	Connection APcon = null;

	String Customer_id = null;
	String Property_id = null;
	String Adate = null;
	int status;
	String agent_notes = null;
	String Appoint_id = null;

	String StatusWri = null;

	APcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
	PreparedStatement APpst = APcon.prepareStatement("select * from appointment");
	rs = APpst.executeQuery();

	//=============== Customer name ===============
	ResultSet crs = null;
	ResultSet Ors = null;
	ResultSet Prs = null;
	//=====================

	while (rs.next()) {

		Appoint_id = rs.getString(1);
		Customer_id = rs.getString(2);
		Property_id = rs.getString(3);
		Adate = rs.getString(4);
		status = rs.getInt(5);
		agent_notes=rs.getString(6);
		
		//////////////// Status convert //////////////
		if (status == 1) {
			StatusWri = "Pending";
		} else if (status == 2) {
			StatusWri = "Accepted";
		} else if (status == 3) {
			StatusWri = "Rejected";
		}

		//////////////////// Customer db/////////////////
		PreparedStatement Cust_pst = APcon.prepareStatement("select * from customer where cid=?");
		Cust_pst.setString(1, Customer_id);
		crs = Cust_pst.executeQuery();
		crs.next();

		String Cname = crs.getString(2) + " " + crs.getString(3);
		String Cemail = crs.getString(4);
		String Ccontact = crs.getString(10);
		String Cgender = crs.getString(6);
		String Ccity = crs.getString(8);

		out.print(
		"<div  style='border:1px solid;padding:15px;margin: 20px;box-shadow:0 0 8px;border-radius:10px;width:500px'>");
		out.print("<p> Appointment ID: " + Appoint_id + "</p><hr/>");
		out.print("<h3 style='text-align:center'>Customer details</h3>");
		out.print("<p> Customer Name: " + Cname + "</p>");
		out.print("<p> Contact no: " + Ccontact + "</p>");
		out.print("<p> Email Id: " + Cemail + "</p>");
		out.print("<p> Gender: " + Cgender + "</p>");
		out.print("<p> City: " + Ccity + "</p><hr>");

		/////////////////////// Property Db/////////////////////////////
		PreparedStatement Pust_pst = APcon.prepareStatement("select * from property where Pid=?");
		Pust_pst.setString(1, Property_id);
		Prs = Pust_pst.executeQuery();
		Prs.next();
		String Owner_id = Prs.getString(4);

		////////////////////// Owner dB //////////////////////////
		PreparedStatement Oust_pst = APcon.prepareStatement("select * from customer where cid=?");
		Oust_pst.setString(1, Owner_id);
		Ors = Oust_pst.executeQuery();
		Ors.next();
		String Oname = Ors.getString(2) + " " + Ors.getString(3);
		String Oemail = Ors.getString(4);
		String Ocontact = Ors.getString(10);
		String Ogender = Ors.getString(6);
		String Ocity = Ors.getString(8);

		out.print("<h3 style='text-align:center'>Owner details</h3>");
		out.print("<p> Owner Name: " + Oname + "</p>");
		out.print("<p> Contact no: " + Ocontact + "</p>");
		out.print("<p> Email Id: " + Oemail + "</p>");
		out.print("<p> Gender: " + Ogender + "</p>");
		out.print("<p> City: " + Ocity + "</p><hr>");

		out.print("<h3 style='text-align:center'>Appointment details</h3>");
		out.print("<p> Booked on: " + Adate + "</p>");
		out.print("<p> Status: " + StatusWri + "</p><hr>");
		out.print("<p> Agent Mesages: " + agent_notes + "</p><hr>");

		if (status == 1) {
	%>
	<form>
	<div>
		<div style="width:80%" class="mb-3">
		<label for="StatusSelect" class="form-label">Select Action:</label>
		<select class="form-control" id="StatusSelect_<%=Appoint_id %>" name="actiontaken">
		<option value="2">Accept</option>
		<option value="3">Reject</option>
		</select>
		</div>
		<div style="width:80%" class="mb-3">
			<label for="Notes" class="form-label">Notes</label>
			<input name="action_notes" class="form-control" type="textarea"
				id="Action_Notes_<%=Appoint_id %>">
		</div>
		</div>
	</form>
	<div style="display:flex;justify-content:center">
	<button style="width:50%;text-align:center" type="submit" onclick="submitActionTaken(<% out.print(Aid+","+Appoint_id); %>)" class="btn btn-primary btn-lg">Update</button>
	</div>
	



	<%
	}

	out.print("</div>");

	}
	%>
</div>
