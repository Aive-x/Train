package MySQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import Class.C_order;
import Class.Order;
import Class.Passenger;
import Class.Ticket;
import Class.User;
import MySQL.WriteConnect;

/*对数据库进行的操作*/

public class operate {
	
	
	/*根据用户选择的出发地、目的地与日期筛选出符合条件的车票*/
	public List<Ticket> getTicket(Ticket ticket) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from train_tickets where departure_station = '" + ticket.getDeparture_station() + "' and destination_station = '" + ticket.getDestination_station() + "' and date = '" + ticket.getDate() + "'";
		List<Ticket> list = new ArrayList<Ticket>();
		try { 
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				Ticket tickets = new Ticket();
				tickets.setTrain_number(rst.getString("train_number"));
				tickets.setDeparture_station(rst.getString("departure_station"));
				tickets.setDestination_station(rst.getString("destination_station"));
				tickets.setDeparture_time(rst.getString("departure_time"));
				tickets.setBusiness_ticket(rst.getString("business_ticket"));
				tickets.setLev1_ticket(rst.getString("lev1_ticket"));
				tickets.setLev2_ticket(rst.getString("lev2_ticket"));
				tickets.setNoSeat_ticket(rst.getString("noSeat_ticket"));
				list.add(tickets);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return list;
	}
	
	
	/*根据用户输入的个人信息进行注册*/
	public boolean setUser(User user) throws SQLException
	{
		String sql = "INSERT INTO `user`(`user_id`,`name`,`phoneNumber`,`password`) VALUES (?,?,?,?)"; // 添加的SQL语句
		Connection conn = WriteConnect.getConnection();
		System.out.print(user.getPhoneNumber());
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUser_id());
			pst.setString(2, user.getName());
			pst.setString(3, user.getPhoneNumber());
			pst.setString(4, user.getPassword());
			int count = pst.executeUpdate();
			pst.close();
			return count > 0 ? true : false;
		} catch (SQLException e) {
			System.out.println("数据添加失败");
			e.printStackTrace();
		}
		return false;
	}
	
	/*根据用户输入的账号获取对应的账号信息，在servlet里进行密码匹配是否正确*/
	public User Login(String phoneNumber) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from user where phoneNumber = '" + phoneNumber + "'";
		User user = new User();
		try { 
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				user.setUser_id(rst.getString("user_id"));
				user.setName(rst.getString("name"));
				user.setPhoneNumber(rst.getString("phoneNumber"));
				user.setPassword(rst.getString("password"));
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return user;
	}
	
	/*获取选择车票的具体信息*/
	public Ticket getTicketInformation(String train_number) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from train_tickets where train_number = '" + train_number + "'";
		Ticket tickets = new Ticket();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				tickets.setTrain_number(rst.getString("train_number"));
				tickets.setDeparture_station(rst.getString("departure_station"));
				tickets.setDestination_station(rst.getString("destination_station"));
				tickets.setDate(rst.getString("date"));
				tickets.setDeparture_time(rst.getString("departure_time"));
				tickets.setDestination_time(rst.getString("destination_time"));
				tickets.setBusiness_ticket(rst.getString("business_ticket"));
				tickets.setBusiness_price(rst.getString("business_price"));
				tickets.setLev1_ticket(rst.getString("lev1_ticket"));
				tickets.setLev1_price(rst.getString("lev1_price"));
				tickets.setLev2_ticket(rst.getString("lev2_ticket"));
				tickets.setLev2_price(rst.getString("lev2_price"));
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return tickets;
	}
	
	/*获取与用户绑定的可添加为乘车人的乘客信息*/
	public List<Passenger> getPassengerInformation(String user_id) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from passenger where user_id = '" + user_id + "'";
		List<Passenger> list = new ArrayList<Passenger>();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				Passenger passenger = new Passenger();
				passenger.setName(rst.getString("name"));
				passenger.setPhoneNumber(rst.getString("phoneNumber"));
				passenger.setPassenger_id(rst.getString("passenger_id"));
				list.add(passenger);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return list;
	}
	
	/*在数据库中保存主订单信息*/ 
	public boolean setOrder(Order order) throws SQLException
	{
		Connection conn = WriteConnect.getConnection();
		
		Date d = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String cc=date.format(d);
		
		String sql = "INSERT INTO `orders`(`order_id`,`c_order_id`,`train_number`,`user_id`,`total_price`,`date`,`state`) VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, order.getOrder_id());
			pst.setString(2, order.getC_order_id());
			pst.setString(3, order.getTrain_number());
			pst.setString(4, order.getUser_id());
			pst.setFloat(5, order.getTotal_price());
			pst.setString(6, cc);
			pst.setString(7, order.getState());
			int count = pst.executeUpdate();
			pst.close();
			return count > 0 ? true : false;
		} catch (SQLException e) {
			System.out.println("数据添加失败");
			e.printStackTrace();
		}
		return false;
	}
	
	/*在数据库中保存子订单信息*/ 
	public boolean setC_Order(C_order c_order) throws SQLException
	{
		Connection conn = WriteConnect.getConnection();
		
		String sql = "INSERT INTO `c_orders`(`c_order_id`,`passenger_id`,`carriage`,`seat`,`level`,`price`) VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c_order.getC_order_id());
			pst.setString(2, c_order.getPassenger_id());
			pst.setString(3, c_order.getCarriage());
			pst.setString(4, c_order.getSeat());
			pst.setString(5, c_order.getLevel());
			pst.setFloat(6, c_order.getPrice());
			int count = pst.executeUpdate();
			pst.close();
			return count > 0 ? true : false;
		} catch (SQLException e) {
			System.out.println("数据添加失败");
			e.printStackTrace();
		}
		return false;
	}
	
	/*添加与用户绑定的乘客*/
	public boolean addPassenger(Passenger passenger) throws SQLException
	{
		String sql = "INSERT INTO `passenger`(`user_id`,`passenger_id`,`name`,`phoneNumber`) VALUES (?,?,?,?)"; // 添加的SQL语句
		Connection conn = WriteConnect.getConnection();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, passenger.getUser_id());
			pst.setString(2, passenger.getPassenger_id());
			pst.setString(3, passenger.getName());
			pst.setString(4, passenger.getPhoneNumber());
			int count = pst.executeUpdate();
			pst.close();
			return count > 0 ? true : false;
		} catch (SQLException e) {
			System.out.println("数据添加失败");
			e.printStackTrace();
		}
		return false;
	}
	
	/*更新与用户绑定的乘车人信息*/
	public boolean updatePassengerInformation(Passenger passenger, String passengerID) throws SQLException
	{
		String sql = "UPDATE `passenger` SET `passenger_id`=?,`name`=?,`phoneNumber`=? WHERE `passenger_id` = ?"; 
		Connection conn = WriteConnect.getConnection();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, passenger.getPassenger_id());
			pst.setString(2, passenger.getName());
			pst.setString(3, passenger.getPhoneNumber());
			pst.setString(4, passengerID);
			int count = pst.executeUpdate();
			pst.close();
			return count > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/*退票*/
	public boolean refundTickets(String orderNum) throws SQLException
	{
		String sql = "update `orders` set `state`=? where `order_id`=?";
		Connection conn = WriteConnect.getConnection();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "1");
			pst.setString(2, orderNum);
			int count = pst.executeUpdate();
			pst.close();
			return count > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/*订单中心查询所有订单信息*/
	public List<Order> searchOrderInformation(String user_id) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from orders where user_id = '" + user_id + "'";
		List<Order> list = new ArrayList<Order>();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				Order order = new Order();
				order.setOrder_id(rst.getString("order_id"));
				order.setTrain_number(rst.getString("train_number"));
				order.setDate(rst.getString("date"));
				order.setTotal_price(Float.parseFloat(rst.getString("total_price")));
				order.setState(rst.getString("state"));
				if("0".equals(order.getState()))
					list.add(order);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return list;
	}
	
	/*根据从订单号中获取的车次号查询获得出发地与目的地*/
	public Ticket getStationInformation(String train_number) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from train_tickets where train_number = '" + train_number + "'";
		Ticket tickets = new Ticket();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				tickets.setDeparture_station(rst.getString("departure_station"));
				tickets.setDestination_station(rst.getString("destination_station"));
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return tickets;
	}
	
	/*查询某一个订单的详细信息*/
	public Order getOrderDetails(String order_id) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from orders where order_id = '" + order_id + "'";
		Order order = new Order();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				order.setOrder_id(rst.getString("order_id"));
				order.setDate(rst.getString("date"));
				order.setC_order_id(rst.getString("c_order_id"));
				order.setTrain_number(rst.getString("train_number"));
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return order;
	}
	
	/*查询某一个订单的子订单的详细信息*/
	public List<C_order> getC_orderDetails(String c_order_id) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from c_orders where c_order_id = '" + c_order_id + "'";
		List<C_order> list = new ArrayList<C_order>();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				C_order c_order = new C_order();
				c_order.setC_order_id(rst.getString("c_order_id"));
				c_order.setPassenger_id(rst.getString("passenger_id"));
				c_order.setCarriage(rst.getString("carriage"));
				c_order.setSeat(rst.getString("seat"));
				c_order.setPrice(Float.parseFloat(rst.getString("price")));
				list.add(c_order);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return list;
	}
	
	/*根据用户ID与乘客ID获取乘客的姓名*/
	public Passenger getPassengerName(String passenger_id, String user_id) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		String sql = "select * from passenger where user_id = '" + user_id + "' and passenger_id = '" + passenger_id + "'";
		Passenger passenger = new Passenger();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				passenger.setName(rst.getString("name"));
				passenger.setPhoneNumber(rst.getString("phoneNumber"));
				passenger.setPassenger_id(rst.getString("passenger_id"));
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			System.out.println("数据库出现异常");
			e.printStackTrace();
		}
		return passenger;
	}
	
	/*在改签中通过车次获取信息*/
	public Ticket changeBook1(Ticket ticket) throws SQLException
	{
		Connection conn = ReadConnect.getConnection();
		
		String sql = "select * from train_tickets where train_number = '" + ticket.getTrain_number() + "'";
		Ticket changeBook1 = new Ticket();
		try { 
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {				
				changeBook1.setDeparture_station(rst.getString("departure_station"));				
				changeBook1.setDestination_station(rst.getString("destination_station"));			
				changeBook1.setDate(rst.getString("date"));				
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return changeBook1;
	}
	
	//检验此手机号是否已注册
	public String isPhoneExist(String phone) throws SQLException
	{
		String sql = "select * from user where phoneNumber=?";
		Connection conn = ReadConnect.getConnection();
		String flag = "";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, phone);
			ResultSet rst = pst.executeQuery();
			if(rst.next())
			{
				flag = "1";
			}
			else
			{
				flag = "servlet:0";
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
}
