package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Class.Passenger;
import Class.User;
import MySQL.operate;

public class AddPassenger extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String name = new String(request.getParameter("newpassName").getBytes("ISO8859-1"),"UTF-8");;
			String passenger_id = request.getParameter("newpassID");
			String phoneNumber = request.getParameter("newpassPhone");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			String user_id = user.getUser_id();
			
			Passenger passenger = new Passenger();
			passenger.setUser_id(user_id);
			passenger.setPassenger_id(passenger_id);
			passenger.setName(name);
			passenger.setPhoneNumber(phoneNumber);
			
			operate dao = new operate();
			dao.addPassenger(passenger);
			
			request.getRequestDispatcher("PersonalInformation").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
