<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
Connection connu = null;
ResultSet rsu = null;
String Pidu = request.getParameter("Pid");
String Ptype = null;
String Size = null;
String City = null;
String address = null;
String Description = null;
String Price = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	connu = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false", "root", "root");
	PreparedStatement pstu = connu.prepareStatement("select * from property where Pid=?");
	pstu.setString(1, Pidu);
	rsu = pstu.executeQuery();
	rsu.next();
	Pidu = rsu.getString(1);
	Ptype = rsu.getString(2);
	Size = rsu.getString(7);
	City = rsu.getString(8);
	address = rsu.getString(10);
	Description = rsu.getString(11);
	Price = rsu.getString(3);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<div style="text-align: center">
	<div class="card"
		style="width: 43rem; border-radius: 35px; background-color: #f0f5f5">
		<br>
		<div style="width: 100%; text-align: right">
			<button type="button" class="btn-close" onclick="updateProperty()"
				aria-label="Close"></button>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="card-body">
			<h1 class="card-title" style="text-align: center">
				<B>Update Property Details</B>
			</h1>
			<hr>
			<div style="overflow: auto; height: 400px">
				<form id="update_property">
					<input hidden name="Pid" value="<%out.print(Pidu);%>">

					<table style="margin: 0 auto; text-align: left">
						<tr class="form-group">
							<td><b>Description: </b></td>
							<td><input name="description"
									class="md-textarea form-control" value="<%=Description%>" rows="2">
							</td>
						</tr>

						<tr class="form-group">
							<td><b>City: </b>
							<td><input value="<%=City %>" name="city" class="form-control"></td>
						</tr>

						<tr class="form-group">
							<td><b>Address: </b>
							<td><input value="<%=address%>" name="address" class="form-control">
							</td>
						</tr>

						<tr class="form-group">
							<td><b>Property Size(Sqft): </b>
							<td><input value="<%=Size%>" name="size" class="form-control">
							</td>
						</tr>

						<tr class="form-group">
							<td><b>Rate (INR): </b>
							<td><input value="<%=Price%>" name="rate" class="form-control">
							</td>
						</tr>

						<tr class="form-group">
							<td><b>Property Type: </b></td>
							<td><select class="form-control" name="type">
							<option disabled >Select</option>
									<option value="Rent">Rent</option>
									<option value="Sell">Sell</option>
									<option value="Lease">Lease</option>
							</select></td>
						</tr>




					</table>
					<br> <br> <a onclick="SendPropertyDetails()"
						class="btn btn-danger btn-lg">Submit</a>
				</form>
			</div>
			<br>
		</div>
	</div>
</div>


