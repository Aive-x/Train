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

import Class.Order;
import Class.Passenger;
import Class.Ticket;
import Class.User;
import MySQL.operate;

public class searchOrderInformation extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			operate dao = new operate();
			
			if(user != null)
			{
				List<Order> listOfOrder = new ArrayList<Order>();
				List<Ticket> listOfTickets = new ArrayList<Ticket>();
				listOfOrder = dao.searchOrderInformation(user.getUser_id());
				
				for (Order order : listOfOrder) {
					listOfTickets.add(dao.getStationInformation(order.getTrain_number()));
				}
				
				request.setAttribute("listOfOrder", listOfOrder);
				request.setAttribute("listOfTickets", listOfTickets);
				request.getRequestDispatcher("orderCenter.jsp").forward(request, response);
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
