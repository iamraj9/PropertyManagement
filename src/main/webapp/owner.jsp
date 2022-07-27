<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
if (session.getAttribute("ActiveUser") != null) {
	String usermail = session.getAttribute("ActiveUser").toString();
	int usertype = (int) session.getAttribute("UserType");
	if (usertype == 1) {
		response.sendRedirect("userPage.jsp");
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
<title>Owner Page</title>
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
</head>
<body>


	<!-- ===============Menu ==============-->
	<nav class="navbar navbar-expand-lg navbar-dark text-white bg-dark">
		<a class="navbar-brand text-danger" href="#">OwnerPage</a>
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

	<div class="container"
		style="min-height: 500px; display: flex; flex-flow: column; justify-content: center;">

		<div>
			<h1 style="text-align: center">Hi! Owner, Select your options
				below</h1>
		</div>
		<hr>
		<div class="row" style="justify-content: center">

			<button onclick="closeAddProperty()"
				class="shadow col-2 btn btn-lg btn-primary">Add Property</button>
			&nbsp;


			<button onclick="closeViewProperty()"
				class="shadow col-2 btn btn-lg btn-primary">View Property</button>
			&nbsp;


			<button onclick="closeupdatedetails()"
				class="shadow col-2 btn btn-lg btn-primary ">Update Details</button>
			&nbsp;

			<button class="shadow col-2 btn btn-lg btn-primary "
				onclick="ViewAAgentlist()">View Available Agent</button>


		</div>
		
		<!-- -----------------------Update Property------------------------ -->

		<div id="Property_update" class="background popup hide" style="position:sticky;z-index:100">
		

		</div>
		<!-- ---------------------------------------- -->
		
		
		
		
		
		

		<!-- --------------------------Agent list---------------- -->
		<div id="view_agent_list" class="background popup hide">
			<div style="text-align: center" class="card" style="width:90%">
				<div style="width: 100%; text-align: right">
					<button type="button" class="btn-close" onclick="ViewAAgentlist()"
						aria-label="Close"></button>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<p>
				<h3>Available agents</h3>
				</p>
				<hr>
				<jsp:include page="agent_list.jsp" flush="true">
					<jsp:param name="agent_list" value="get" />
				</jsp:include>



			</div>
		</div>





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





		<!-- +++++++++++++++++++++++ Property Add Form +============++++  -->
		<div id="backgroundAddProperty" class="background popup hide">


			<div style="text-align: center">
				<div class="card"
					style="width: 43rem; border-radius: 35px; background-color: #f0f5f5">
					<br>
					<div style="width: 100%; text-align: right">
						<button type="button" class="btn-close"
							onclick="closeAddProperty()" aria-label="Close"></button>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="card-body">
						<h1 class="card-title" style="text-align: center">
							<B>Add Property</B>
						</h1>
						<hr>
						<div style="overflow: auto; height: 400px">
							<form id="addingproperty">
								<input hidden name="owner_id" type="number"
									value="<%out.print(Cid);%>">

								<table style="margin: 0 auto; text-align: left">
									<tr class="form-group">
										<td><b>Owner Email Id: </b></td>
										<td><input readonly="readonly" class="form-control"
											name="Owner_email" value="<%out.print(Cemail);%>"></td>
									</tr>
									<tr class="form-group">
										<td><b>Owner Name: </b></td>
										<td><input readonly="readonly" class="form-control"
											type="text" name="Owner_name"
											value="<%out.print(Cfname + " " + Clname);%>" size=25></td>
									</tr>
									<tr class="form-group">
										<td><b>Owner Contact No.: </b></td>
										<td><input readonly="readonly" class="form-control"
											type="text" name="Owner_number"
											value="<%out.print(Ccontact);%>" size=25></td>
									</tr>


									<tr class="form-group">
										<td><b>Property Type: </b></td>

										<td><select name="PropertyType" class="form-control">
												<option value="Rent">Rent</option>
												<option value="Lease">Lease</option>
												<option value="Sell">Sell</option>
										</select>
									</tr>
									<tr class="form-group">
										<td><b>Property Size(Sqft): </b></td>
										<td><input class="form-control" type=text
											name="PropertySize"></td>
									</tr>
									<tr class="form-group">
										<td><b>Rate(INR): </b></td>
										<td><input class="form-control" type="text"
											name="Propertyrate"></td>
									</tr>
									<tr class="form-group">
										<td><b>Property Photo: </b></td>
										<td><input class="form-control" type=file name="u"
											accept="image/*"></td>
									</tr>
									<tr class="form-group">
										<td><b>City: </b></td>
										<td><input class="form-control" type=textbox
											name="Propertycity"></td>
									</tr>
									<tr class="form-group">
										<td><b>Address: </b></td>
										<td><input class="form-control" type=textbox
											name="PropertyAddress"></td>
									</tr>
									<tr class="form-group">
										<td><b>Property Description: </b></td>
										<td><input class="form-control" type=textbox
											name="PropertyDescription" size=25></td>
									</tr>
								</table>
								<br> <br> <a onclick="sendproperty()"
									class="btn btn-danger btn-lg">Submit</a>
							</form>
						</div>
						<br>
					</div>
				</div>
			</div>


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
					<h2>Property Added By You</h2>
					<hr>
					<div
						style="display: flex; padding: 10px; justify-content: center; overflow: auto">

						<%
						ResultSet rsView = null;
						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
							PreparedStatement pstPView = conn.prepareStatement("select * from property where Owner_id=?");
							pstPView.setString(1, Cid);
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
									<button id="updateBTN_<%=Pid %>" class="btn btn-primary book_button"
										onclick="updateProperty(<%out.print(Pid);%>)">Update
										Property</button>
									<button class="btn btn-primary book_button"
										onclick="deleteProperty(<%out.print(Pid);%>)">Delete
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



		<!--  ===================== Update details ============================= -->

		<div id="UpdateDetails" class="background popup hide">
			<jsp:include page="updateDetails.jsp" flush="true">
				<jsp:param name="id" value="<%=Cid%>" />
				<jsp:param name="amount" value="18" />
			</jsp:include>


		</div>
		


	</div>



	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css" />
	<script type="text/javascript">
		

		
		
		function deleteProperty(id){
			$.ajax({
	            url: 'deleteproperty.jsp',
	            type: 'post',
	            data: {delete :id},
	            success: function(data) {
	                console.log(data);
	                swal("Done!", "Property deleted Successfully", "success");
	                setInterval(function(){ location.reload(); }, 3000);
	                
	            }
	        });
		}
		
		//======================= add property ================
			function sendproperty(){
			$.ajax({
	            url: 'addProperty',
	            type: 'get',
	            data: $("#addingproperty input,select").serialize(),
	            success: function(data) {
	            	swal("Great!", "Property Added Successfully", "success");
	            	setInterval(function(){ location.reload(); }, 3000);
	            }
	        });
		}
		
		
			
			
	
		
	</script>
	<%
	request.setAttribute("Addproperty", "");
	request.setAttribute("propertyDelete", "");
	%>


</body>
</html>