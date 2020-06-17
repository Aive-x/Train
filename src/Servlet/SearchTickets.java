package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import MySQL.operate;
import java.util.List;

import Class.C_order;
import Class.Ticket;

public class SearchTickets extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/*使用post方式接收提交的表单，进行车票查询请求的处理*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			/*接收前端传输的数据*/
			String departure_station = new String(request.getParameter("departure_station").getBytes("ISO8859-1"),"UTF-8");
			String destination_station = new String(request.getParameter("destination_station").getBytes("ISO8859-1"),"UTF-8");
/*			if("北京".equals(departure_station))
			{
				departure_station = "10001";
			}
			else if("上海".equals(departure_station))
			{
				departure_station = "10002";
			}
			else if("嘉兴".equals(departure_station))
			{
				departure_station = "10003";
			}
			
			if("北京".equals(destination_station))
			{
				departure_station = "10001";
			}
			else if("上海".equals(destination_station))
			{
				departure_station = "10002";
			}
			else if("嘉兴".equals(destination_station))
			{
				departure_station = "10003";
			}*/
			
			String date = request.getParameter("trainDate");
			
			Ticket ticket = new Ticket();
			ticket.setDeparture_station(departure_station);
			ticket.setDestination_station(destination_station);
			ticket.setDate(date);
			operate dao = new operate();
			List<Ticket> list = dao.getTicket(ticket);
			
			request.setAttribute("ticket", ticket);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("searchResult.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
