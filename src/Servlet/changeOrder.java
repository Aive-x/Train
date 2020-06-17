package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Class.Order;
import Class.Ticket;
import MySQL.operate;

public class changeOrder extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			operate dao = new operate();
			String orderNum = request.getParameter("orderNum");
			Order order = new Order();
			order = dao.getOrderDetails(orderNum);
			
			dao.refundTickets(orderNum);
			
			
			Ticket changeBook1 = new Ticket();
			changeBook1.setTrain_number(order.getTrain_number());
			
			changeBook1 = dao.changeBook1(changeBook1);
			request.setAttribute("changeBook1", changeBook1);
			request.getRequestDispatcher("changeOrder.jsp").forward(request, response);
			
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
