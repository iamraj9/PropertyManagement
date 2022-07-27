package com.infiniteProject.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signIn
 */
@WebServlet("/signIn")
public class signIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail=request.getParameter("email");
		String upassword=request.getParameter("password");
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher = null;
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/infinite_project?useSSL=false","root","root");
			PreparedStatement pst = con.prepareStatement("select * from customer where Cemail=? and Cpassword=?");
			pst.setString(1, uemail);
			pst.setString(2, upassword);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				
				session.setAttribute("ActiveUser", rs.getString("Cemail"));
				
				int userType=Integer.parseInt(rs.getString("user_type"));
				session.setAttribute("UserType", userType);
				if(userType==1) {
					dispatcher= request.getRequestDispatcher("userPage.jsp");
				}else if(userType==2) {
					dispatcher= request.getRequestDispatcher("owner.jsp");
				}else if(userType==3) {
					dispatcher= request.getRequestDispatcher("agent.jsp");
				}
				else {
					PrintWriter out =response.getWriter();
					out.print(userType);
				}
				
				
				
				
				
			}else {
				request.setAttribute("signInStatus", "failed");
				dispatcher=request.getRequestDispatcher("index.jsp");
			}
			dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
