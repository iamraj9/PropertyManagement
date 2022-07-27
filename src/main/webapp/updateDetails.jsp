<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
Connection connu = null;
ResultSet rsu = null;
String Cidu = request.getParameter("id");
String Cfnameu = null;
String Clnameu = null;
String Cemailu = null;
String Ccityu = null;
String Ccontactu = null;
String Cgenderu = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	connu = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
	PreparedStatement pstu = connu.prepareStatement("select * from customer where cid=?");
	pstu.setString(1, Cidu);
	rsu = pstu.executeQuery();
	rsu.next();
	Cidu = rsu.getString(1);
	Cfnameu = rsu.getString(2);
	Clnameu = rsu.getString(3);
	Cemailu = rsu.getString(4);
	Ccityu = rsu.getString(8);
	Ccontactu = rsu.getString(10);
	Cgenderu = rsu.getString(6);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<div style="text-align: center">
	<div class="card"
		style="width: 43rem; border-radius: 35px; background-color: #f0f5f5">
		<br>
		<div style="width: 100%; text-align: right">
			<button type="button" class="btn-close"
				onclick="closeupdatedetails()" aria-label="Close"></button>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="card-body">
			<h1 class="card-title" style="text-align: center">
				<B>Update your Details</B>
			</h1>
			<hr>
			<div style="overflow: auto; height: 400px">
				<form id="update_profile">
				<input hidden name="id" value="<%out.print(Cidu);%>">

					<table style="margin: 0 auto; text-align: left">
						
						<tr class="form-group">
							<td><b>First Name: </b></td>
							<td><input class="form-control" type="text"
								name="fname" value="<%out.print(Cfnameu);%>" size=25></td>
						</tr>
						<tr class="form-group">
							<td><b>Last Name: </b></td>
							<td><input class="form-control" type="text"
								name="lname" value="<%out.print(Clnameu);%>" size=25></td>
						</tr>
						<tr class="form-group">
							<td><b>Email Id: </b></td>
							<td><input class="form-control" name="email"
								value="<%out.print(Cemailu);%>"></td>
						</tr>
						<tr class="form-group">
							<td><b>Contact No.: </b></td>
							<td><input class="form-control" type="text"
								name="number" value="<%out.print(Ccontactu);%>" size=25></td>
						</tr>
						<tr class="form-group">
							<td><b>Gender.: </b></td>
							<td><select class="form-control" name="gender">
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Other">Other</option>
							</select></td>
						</tr>


						<tr class="form-group">
							<td><b>City: </b></td>
							<td><input class="form-control"
								value="<%out.print(Ccityu);%>" name="city"></td>
						</tr>

					</table>
					<br> <br> <a onclick="updateDetails()"
						class="btn btn-danger btn-lg">Submit</a>
				</form>
			</div>
			<br>
		</div>
	</div>
</div>


