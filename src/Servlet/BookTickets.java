package Servlet;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

import Class.Passenger;
import Class.Ticket;
import Class.User;
import MySQL.operate;


public class BookTickets extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String trainNum = request.getParameter("trainNum");
			
			HttpSession session = request.getSession();
			Ticket tickets = new Ticket();
			operate dao = new operate();
			
			User user = (User)session.getAttribute("user");
			if(user != null){
				List<Passenger> list = new ArrayList<Passenger>();
				list = dao.getPassengerInformation(user.getUser_id());
				request.setAttribute("list", list);
				
				tickets = dao.getTicketInformation(trainNum);
				request.setAttribute("tickets", tickets);
				
				request.getRequestDispatcher("book.jsp").forward(request, response);
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
		System.out.println("post");
	}

}
