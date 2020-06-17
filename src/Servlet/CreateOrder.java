package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Class.C_order;
import Class.Order;
import Class.User;
import MySQL.operate;

public class CreateOrder extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String seat[] = request.getParameterValues("seat");
		String passenger_id[] = request.getParameterValues("passenger_id");
		String train_number = request.getParameter("trainNum");
		System.out.print(train_number);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		
		/*获取当前时间用于生成订单号*/
		Calendar   c   =   Calendar.getInstance();//可以用set()对每个时间域单独修改    
		int   year   =   c.get(Calendar.YEAR);    
		int   month   =   c.get(Calendar.MONTH) + 1;    
		int   date   =   c.get(Calendar.DATE);    
		int   hour   =   c.get(Calendar.HOUR_OF_DAY);    
		int   minute   =   c.get(Calendar.MINUTE);    
		int   second   =   c.get(Calendar.SECOND);    
		String order_id = "0" + year + month + date +hour + minute + second;
		String c_order_id = "1" + year + month + date +hour + minute + second;
		
		operate dao = new operate();
		
		Float total_price = (float) 0;
		

		
		/*保存子订单信息*/
		for(int i = 0; i < passenger_id.length;++i){
			try {
				
				/*通过随机数生成车厢号*/
				Random r = new Random();
				int carriageNumber = r.nextInt(14);
				while(carriageNumber ==0 )
					carriageNumber = r.nextInt(14);
				
				/*通过随机数生成座位号*/
				int seatNumber = r.nextInt(14);
				while(seatNumber ==0 )
					seatNumber = r.nextInt(14);
				
				 int mid = r.nextInt(4);
			        String ans = new String();
			        if (mid == 0) {
			            ans = "a";
			        }
			        else if (mid == 1) {
			            ans = "b";
			        }
			        else if (mid == 2) {
			            ans = "c";
			        }
			        else if (mid == 3) {
			            ans = "d";
			        }
			        else if (mid == 4) {
			            ans = "f";
			        }
				
				C_order c_order = new C_order();
				seat[i] = new String(seat[i].getBytes("ISO8859-1"),"UTF-8");
				String level = seat[i].substring(0, 3);
				Float price = Float.parseFloat(seat[i].substring(4, 8));
				total_price  = total_price + price;
				c_order.setC_order_id(c_order_id);
				c_order.setPassenger_id(passenger_id[i]);
				c_order.setCarriage(Integer.toString(carriageNumber));
				c_order.setSeat(ans + Integer.toString(seatNumber));
				c_order.setLevel(level);
				c_order.setPrice(price);
				
				
				dao.setC_Order(c_order);
			} catch (SQLException e) {
				System.out.print("订单生成失败！");
			}
		}
		
		/*保存主订单信息*/
		try {
			
			Order order = new Order();
			order.setOrder_id(order_id);
			order.setC_order_id(c_order_id);
			order.setTrain_number(train_number);
			order.setUser_id(user_id);
			order.setTotal_price(total_price);
			order.setState("0");
			dao.setOrder(order);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		JOptionPane.showMessageDialog(null, "下单成功", "提示", JOptionPane.INFORMATION_MESSAGE);
	}

}
