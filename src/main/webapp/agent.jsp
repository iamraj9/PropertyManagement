<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
if (session.getAttribute("ActiveUser") != null) {
	String usermail = session.getAttribute("ActiveUser").toString();
	int usertype = (int) session.getAttribute("UserType");
	if (usertype == 1) {
		response.sendRedirect("userPage.jsp");
	} else if (usertype == 2) {
		response.sendRedirect("owner.jsp");
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
<title>agent Page</title>
</head>
<body>
	<!-- ===============Menu ==============-->
	<nav class="navbar navbar-expand-lg navbar-dark text-white bg-dark">
		<a class="navbar-brand text-danger" href="#">AgentPage</a>
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
					<li class="nav-item"><a class="nav-link" href="#">Contact
							us &nbsp;&nbsp;&nbsp; </a></li>
					<li class="nav-item"><a class="nav-link" href="logout">
							Logout &nbsp;&nbsp;&nbsp;</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- -------------------------------------- -->
	<div class="container"
		style="min-height: 500px; display: flex; flex-flow: column; justify-content: center;">
		<div>
			<h1 style="text-align: center">Hi! Agent, Select your options
				below</h1>
		</div>
		<hr>
		<div class="row" style="justify-content: center">




			<button onclick="closeViewProperty()"
				class="shadow col-2 btn btn-lg btn-primary">View Property</button>
			&nbsp;


			<button onclick="closeupdatedetails()"
				class="shadow col-2 btn btn-lg btn-primary ">Update Details</button>
			&nbsp;

			<button class="shadow col-2 btn btn-lg btn-primary "
				onclick="closeAppointmentList()">Appointment's</button>


		</div>





		<!-- ------------  view Added Property  -------------- -->
		<div id="ViewOwnerProperty" class="background popup hide">
			<div style="text-align: center; width: 95%">
				<div class="card"
					style="border-radius: 35px; background-color: #f0f5f5; width: 90% display:content">
					<br>
					<div style="width: 100%; text-align: right">
						<button type="button" class="btn-close"
							onclick="closeViewProperty()" aria-label="Close"></button>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<h2>Property Added By Owner's</h2>
					<hr>
					<div
						style="display: flex; padding: 10px; justify-content: center; overflow: auto">

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

								out.print("Property: " + pcount + "&nbsp;&nbsp; || &nbsp;&nbsp; Property ID: " + Pid);
						%>

						<div class="row">
							<div class="card col" style="width: 18rem;">
								<img class="card-img-top"
									src="https://img.onmanorama.com/content/dam/mm/en/lifestyle/decor/images/2021/4/16/reader-home-aluva-c.jpg"
									alt="Card image cap">
								<div class="card-body" style="text-align: left">
									<h4 class="card-text">
										<%
										out.print(Pdescription);
										%>
									</h4>
									<p>
										Property Type :
										<%
									out.print(Ptype);
									%>
									</p>
									<p>
										Property Size(Sqft):
										<%
									out.print(PSize);
									%>
									</p>
									<p>
										Location :
										<%
									out.print(Paddress);
									%>
									</p>
									<p>
										City :
										<%
									out.print(Pcity);
									%>
									</p>
									<p>
										Price :
										<%
									out.print(Price);
									%>
									</p>
									<button class="btn btn-primary book_button"
										onclick="updateProperty(<%out.print(Pid);%>)">Update
										Property</button>
								</div>
							</div>



						</div>



						<%
						out.print("</div>");
						}

						} catch (Exception e) {
						e.printStackTrace();
						}
						%>









					</div>
					<div>No Property left to Display.</div>



				</div>
			</div>

		</div>
		<!-- -------------------------------------------------------------------------- -->


		<!--  ==============User info ===================  -->

		<div id="backgroundUser" class="background hide">
			<div class="PropertyBG" style="margin: 0 auto">
				<div style="width: 100%; text-align: right">
					<button type="button" class="btn-close" onclick="closeUserInfo()"
						aria-label="Close"></button>
				</div>
				<h1 class="text-primary">Your Details</h1>
				<hr style="color: black;" />
				<div class="property text-danger">
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
					</table>
				</div>
				<hr />
			</div>

		</div>
		<!-- --------------------------------------------------------------- -->


<!-- -----------------------Update Property------------------------ -->

		<div id="Property_update" class="background popup hide" style="position:sticky;z-index:100">
		

		</div>
		<!-- ---------------------------------------- -->



		<!--  ===================== Update details ============================= -->

		<div id="UpdateDetails" class="background popup hide">

			<jsp:include page="updateDetails.jsp" flush="true">
				<jsp:param name="id" value="<%=Cid%>" />
				<jsp:param name="amount" value="18" />
			</jsp:include>


		</div>
		<!-- ------------------------------------------------------------------- -->

		<!-- ----------------------- Appointment list------------------ -->
		<div id="AppointmentDetails" class="background popup hide">
			<jsp:include page="appointment_list.jsp" flush="true">
				<jsp:param name="agent_id" value="<%=Cid %>" />
			</jsp:include>

		</div>








	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css" />

</body>
</html>