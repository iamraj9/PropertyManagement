package com.infiniteProject.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addProperty")
public class addProperty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String POwnerEmail = request.getParameter("Owner_email");
		String PropertyType = request.getParameter("PropertyType");
		String POwnerName = request.getParameter("Owner_name");
		String PownerId = request.getParameter("owner_id");
		String PropertyCity = request.getParameter("Propertycity");
		String PropertyAddress = request.getParameter("PropertyAddress");
		String PropertyDescription = request.getParameter("PropertyDescription");
		String PownerContact=request.getParameter("Owner_number");
		String PropertyPrice=request.getParameter("Propertyrate");
		String PropertySize=request.getParameter("PropertySize");
		
		RequestDispatcher dispatcher = null;
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false","root","root");
			PreparedStatement pst= con.prepareStatement("insert into property(Property_type,property_price,Owner_id,Owner_name,Owner_email,property_Size,Property_city,Property_address,Property_Description,POwner_number) values(?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, PropertyType);
			pst.setString(2, PropertyPrice);
			pst.setString(3, PownerId);
			pst.setString(4, POwnerName);
			pst.setString(5, POwnerEmail);
			pst.setString(6, PropertySize);
			pst.setString(7, PropertyCity);
			pst.setString(8, PropertyAddress);
			pst.setString(9, PropertyDescription);
			pst.setString(10, PownerContact);
			
			int rowCount=pst.executeUpdate();
			
			if(rowCount>0) {
				request.setAttribute("Addproperty", "success");
				request.getSession().setAttribute("Addproperty","success");
				
			}else {
				request.setAttribute("Addproperty", "failed");
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
	}

}
