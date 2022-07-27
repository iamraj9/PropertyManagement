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

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String usertype = request.getParameter("utype");
		String fname = request.getParameter("Cfname");
		String lname = request.getParameter("Clname");
		String utype = request.getParameter("utype");
		String Clocation = request.getParameter("Ccity");
		String Ccontact = request.getParameter("Ccontact");
		String gender=request.getParameter("Cgender");;
		RequestDispatcher dispatcher = null;
		
		PrintWriter out =response.getWriter();
//		out.print(email);
//		out.print(pass);
//		out.print(fname);
//		out.print(lname);
//		out.print(Clocation);
//		out.print(Ccontact);
//		out.print(gender);
		out.print(utype);
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false","root","root");
			PreparedStatement pst= con.prepareStatement("insert into customer(Cfname,Clname,Cemail,Cpassword,Cgender,Ccontact,Ccity,user_type) values(?,?,?,?,?,?,?,?)");
			pst.setString(1, fname);
			pst.setString(2, lname);
			pst.setString(3, email);
			pst.setString(4, pass);
			pst.setString(5, gender);
			pst.setString(6, Ccontact);
			pst.setString(7, Clocation);
			pst.setString(8, utype);
			
			int rowCount=pst.executeUpdate();
			dispatcher =request.getRequestDispatcher("index.jsp");
			if(rowCount>0) {
				request.setAttribute("signupstatus", "success");
			}
			else {
				request.setAttribute("signupstatus", "Failed");
			}
			dispatcher.forward(request, response);
			
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
