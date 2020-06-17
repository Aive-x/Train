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

public class EditPassenger extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String name = new String(request.getParameter("editpassName").getBytes("ISO8859-1"),"UTF-8");
			String passengerID = request.getParameter("passengerID");  /*修改之前的乘客身份证号*/
			String passenger_id = request.getParameter("editpassID");  /*修改之后的乘客身份证号*/
			String phoneNumber = request.getParameter("editpassPhone");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			String user_id = user.getUser_id();
			
			Passenger passenger = new Passenger();
			passenger.setUser_id(user_id);
			passenger.setPassenger_id(passenger_id);
			passenger.setName(name);
			passenger.setPhoneNumber(phoneNumber);
			
			operate dao = new operate();
			dao.updatePassengerInformation(passenger, passengerID);
			
			request.getRequestDispatcher("PersonalInformation").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}

}
