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

import Class.C_order;
import Class.Order;
import Class.Passenger;
import Class.Ticket;
import Class.User;
import MySQL.operate;


public class SearchOrderDetails extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			String order_id = request.getParameter("orderNum");
			
			operate dao = new operate();
			Order order = new Order();
			Ticket ticket = new Ticket();
			List<C_order> listOfC_order = new ArrayList<C_order>();
			List<Passenger> listOfPassenger = new ArrayList<Passenger>();
			
			order = dao.getOrderDetails(order_id);		//根据订单id获取主订单信息
			listOfC_order = dao.getC_orderDetails(order.getC_order_id());	//根据从主订单信息中获取的子订单号获取子订单信息
			ticket = dao.getStationInformation(order.getTrain_number());
			
			for (C_order c_order : listOfC_order) {		//根据子订单信息中的子订单号获取乘客信息
				listOfPassenger.add(dao.getPassengerName(c_order.getPassenger_id(), user.getUser_id()));
			}
			
			request.setAttribute("order", order);
			request.setAttribute("ticket", ticket);
			request.setAttribute("listOfC_order", listOfC_order);
			request.setAttribute("listOfPassenger", listOfPassenger);
			
			request.getRequestDispatcher("orderMsg.jsp").forward(request, response);
			
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
