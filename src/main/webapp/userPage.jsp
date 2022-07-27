<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
if (session.getAttribute("ActiveUser") != null) {
	String usermail = session.getAttribute("ActiveUser").toString();
	int usertype = (int) session.getAttribute("UserType");
	if (usertype == 2) {
		response.sendRedirect("owner.jsp");
	} else if (usertype == 3) {
		response.sendRedirect("agent.jsp");
	}

} else {
	response.sendRedirect("index.jsp");
}
String userEmail = null;
if (session.getAttribute("ActiveUser") != null) {
	userEmail = session.getAttribute("ActiveUser").toString();
}

Connection conn = null;
ResultSet rs = null;
String Cid = null;
String Cfname = null;
String Clname = null;
String Cemail = null;
String Ccity = null;
String Ccontact = null;
String Cgender = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
	PreparedStatement pst = conn.prepareStatement("select * from customer where Cemail=?");
	pst.setString(1, userEmail);
	rs = pst.executeQuery();
	rs.next();
	Cid = rs.getString(1);
	Cfname = rs.getString(2);
	Clname = rs.getString(3);
	Cemail = rs.getString(4);
	Ccity = rs.getString(8);
	Ccontact = rs.getString(10);
	Cgender = rs.getString(6);

} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>
<script src="jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Customer Page</title>
</head>
<body>
	<!-- ===============Menu ==============-->
	<nav class="navbar navbar-expand-lg navbar-dark text-white bg-dark">
		<a class="navbar-brand text-danger" href="#">CustomerPage</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div
			style="display: flex; justify-content: space-between; padding: 0 15px"
			class="collapse navbar-collapse" id="navbarNav">
			<div>
				<!--    <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home &nbsp;&nbsp;&nbsp;  </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#Featured">Features &nbsp;&nbsp;&nbsp; </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing  &nbsp;&nbsp;&nbsp; </a>
        </li>
      </ul>
      
       -->
			</div>
			<div>
				<ul class="navbar-nav">
					<li onclick="closeUserInfo()" class="nav-item"><a
						class="nav-link text-danger" href="#"> <%
 out.print(Cfname + " " + Clname);
 %> &nbsp;&nbsp;&nbsp;
					</a></li>
					<li onclick="closeAppointmentView()" class="nav-item"><a
						class="nav-link" href="#">Appointment &nbsp;&nbsp;&nbsp; </a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact
							us &nbsp;&nbsp;&nbsp; </a></li>
					<li onclick="ViewAAgentlist()" class="nav-item"><a
						class="nav-link" href="#">Agent list &nbsp;&nbsp;&nbsp;</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">
							Logout &nbsp;&nbsp;&nbsp;</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- ------------------------------------- -->
	<div class="container">



		<!-- --------------------------Agent list---------------- -->
		<div id="view_agent_list" class="background popup hide">
			<div style="text-align: center" class="card" style="width:90%">
				<div style="width: 100%; text-align: right">
					<button type="button" class="btn-close"
						onclick="ViewAAgentlist()" aria-label="Close"></button>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<p><h3>Available agents</h3></p><hr>
				<jsp:include page="agent_list.jsp" flush="true">
					<jsp:param name="agent_list" value="get" />
				</jsp:include>
				
				
				
			</div>
		</div>




		<!--  ==============User info ===================  -->

		<div id="backgroundUser" class="background popup hide">
			<div class="PropertyBG card" style="margin: 0 auto">
				<div style="width: 100%; text-align: right">
					<button type="button" class="btn-close" onclick="closeUserInfo()"
						aria-label="Close"></button>
				</div>
				<h1 class="text-primary">Your Details</h1>

				<div class="property text-danger">
					<hr />
					<table>
						<tr>
							<td>Name :</td>
							<td>
								<%
								out.print(Cfname + " " + Clname);
								%>
							</td>
						</tr>
						<tr>
							<td>Email Id:</td>
							<td>
								<%
								out.print(Cemail);
								%>
							</td>
						</tr>
						<tr>
							<td>Contact No. :</td>
							<td>
								<%
								out.print(Ccontact);
								%>
							</td>
						</tr>
						<tr>
							<td>Gender :</td>
							<td>
								<%
								out.print(Cgender);
								%>
							</td>
						</tr>
						<tr>
							<td>Preferred City :</td>
							<td>
								<%
								out.print(Ccity);
								%>
							</td>
						</tr>
						<tr>
							<th colspan="2" style="text-align: center"><button
									onclick="closeupdatedetails()" class="btn btn-danger btn-lg">Edit
									Profile</button></th>
						</tr>
					</table>
				</div>
				<hr />
			</div>

		</div>


		<!-- ----------------Update Profile----------------- -->
		<div id="UpdateDetails" class="background popup hide">
			<jsp:include page="updateDetails.jsp" flush="true">
				<jsp:param name="id" value="<%=Cid%>" />
			</jsp:include>


		</div>








		<!-- ----------------- Featured--------------------- -->

		<div id="featured" class="featured">
			<h2>Featured Property</h2>

			<div class="row" style="justify-content: space-around">
				<%
				Connection fconn = null;
				ResultSet frsView = null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					fconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
					PreparedStatement pstPView = conn.prepareStatement("select * from property limit 3");
					frsView = pstPView.executeQuery();

					String fPid;
					String fPtype;
					String fPrice;
					String fPSize;
					String fPcity;
					String fPaddress;
					String fPdescription;
					String fPimage;

					int fpcount = 0;

					while (frsView.next()) {
						out.print("<div class='card col-3'>");

						fpcount = fpcount + 1;
						fPid = frsView.getString(1);
						fPtype = frsView.getString(2);
						fPrice = frsView.getString(3);
						fPSize = frsView.getString(7);
						fPcity = frsView.getString(8);
						fPaddress = frsView.getString(10);
						fPdescription = frsView.getString(11);
						fPimage = frsView.getString(12);
				%>

				<img class="card-img-top"
					src="https://img.onmanorama.com/content/dam/mm/en/lifestyle/decor/images/2021/4/16/reader-home-aluva-c.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h4 class="card-text">
						<%
						out.print(fPdescription);
						%>
					</h4>
					<p>
						Property Size(Sqft) :
						<%
					out.print(fPSize);
					%>
					</p>
					<p>
						Ready for :
						<%
					out.print(fPtype);
					%>
					</p>
					<p>
						City:
						<%
					out.print(fPcity);
					%>
					</p>
					<p>
						Location :
						<%
					out.print(fPaddress);
					%>
					</p>
					<p>
						Price(INR) :
						<%
					out.print(fPrice);
					%>.
					</p>
					<button class="btn btn-primary book_button"
						onclick="BookAppointment(<%out.print(fPid + "," + Cid);%>)">Book
						Appointment</button>
				</div>

				<%
				out.print("</div>");
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
				%>

			</div>


		</div>









		<!-- ===================== recent proprty ================== -->

		<div class="row featured">
			<h2>Recently added Property</h2>

			<div class="row" style="justify-content: space-around">

				<%
				ResultSet rsView = null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
					PreparedStatement pstPView = conn.prepareStatement("select * from property order by Pid desc");
					rsView = pstPView.executeQuery();

					String Pid;
					String Ptype;
					String Price;
					String PSize;
					String Pcity;
					String Paddress;
					String Pdescription;
					String Pimage;

					int pcount = 0;

					while (rsView.next()) {
						out.print("<div class='card col-3'>");

						pcount = pcount + 1;
						Pid = rsView.getString(1);
						Ptype = rsView.getString(2);
						Price = rsView.getString(3);
						PSize = rsView.getString(7);
						Pcity = rsView.getString(8);
						Paddress = rsView.getString(10);
						Pdescription = rsView.getString(11);
						Pimage = rsView.getString(12);
				%>

				<img class="card-img-top"
					src="https://img.onmanorama.com/content/dam/mm/en/lifestyle/decor/images/2021/4/16/reader-home-aluva-c.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h4 class="card-text">
						<%
						out.print(Pdescription);
						%>
					</h4>
					<p>
						Property Size(Sqft) :
						<%
					out.print(PSize);
					%>
					</p>
					<p>
						Ready for :
						<%
					out.print(Ptype);
					%>
					</p>
					<p>
						City:
						<%
					out.print(Pcity);
					%>
					</p>
					<p>
						Location :
						<%
					out.print(Paddress);
					%>
					</p>
					<p>
						Price(INR) :
						<%
					out.print(Price);
					%>.
					</p>
					<button class="btn btn-primary book_button"
						onclick="BookAppointment(<%out.print(Pid + "," + Cid);%>)">Book
						Appointment</button>
				</div>

				<%
				out.print("</div>");
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</div>



		</div>





		<div id="backgroundAppointment" class="background popup hide">
			<div class="PropertyBG card" style="margin: 0 auto">
				<div style="width: 100%; text-align: right">
					<button type="button" class="btn-close"
						onclick="closeAppointmentView()" aria-label="Close"></button>
				</div>
				<h1>Your Appointment Status</h1>
				<div class="property row" style="justify-content: space-around;">


					<%
					ResultSet rsAppoint = null;
					Connection conA = null;
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						conA = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
						PreparedStatement pstAppoint = conn
						.prepareStatement("select * from appointment where Customer_id=? order by Aid desc");
						pstAppoint.setString(1, Cid);
						rsAppoint = pstAppoint.executeQuery();

						String Aid;
						String ProID;
						String ADate;
						int Astatus;
						String Agent_notes;
						int ACount = 0;

						while (rsAppoint.next()) {
							ACount = ACount + 1;

							Aid = rsAppoint.getString(1);
							ProID = rsAppoint.getString(3);
							ADate = rsAppoint.getString(4);
							Astatus = rsAppoint.getInt(5);
							Agent_notes = rsAppoint.getString(6);
					%>
					<div class="col-sm-10 center"
						style="border: 1px solid; margin: 10px; border-radius: 20px">
						<p>
							Appointment:
							<%=ACount%></p>
						<p>
							Booked on:
							<%=ADate%></p>
						<hr />
						<jsp:include page="appointmentdetails.jsp" flush="true">
							<jsp:param name="prid" value="<%=ProID%>" />
						</jsp:include>


						<p>

							<%
							String appstatus = null;
							if (Astatus == 1) {
								appstatus ="<b class='text-warning'>Waiting for Confirmation</b>";
							}else if (Astatus == 2) {
								appstatus = "<b class='text-primary'>Confirmed</b>";
							}else if (Astatus == 3) {
								appstatus = "<b class='text-danger'>Rejected</b>";
							}
							%>




							Appointment Status: 
								<%
								out.print(appstatus);
								%>
						</p>
						<%
						if (Agent_notes != null) {
							out.print("<p>Agent Remarks: <b class='text-primary'>" + Agent_notes + "</b></p>");
						}
						%>
					</div>


					<%
					}
					out.print("<b>Nothing left to Show</b>");

					} catch (Exception e) {
					e.printStackTrace();
					}
					%>







				</div>
				<hr />
			</div>

		</div>






	</div>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css" />




</body>
</html>