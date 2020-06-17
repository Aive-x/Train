package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Class.Passenger;
import Class.Ticket;
import Class.User;
import MySQL.operate;

public class PersonalInformation extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			operate dao = new operate();
			
			User user = (User)session.getAttribute("user");
			if(user != null){
				List<Passenger> list = new ArrayList<Passenger>();
				list = dao.getPassengerInformation(user.getUser_id());
				request.setAttribute("user", user);
				request.setAttribute("list", list);
				request.getRequestDispatcher("personalIn.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("pleaseLogin.jsp").forward(request, response);
			}
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
