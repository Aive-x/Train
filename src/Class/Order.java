package Class;

public class Order {
	private String order_id;
	private String c_order_id;
	private String train_number;
	private String user_id;
	private float total_price;
	private String date;
	private String state;
//1
	public String getOrder_id()
	{
		return order_id;
	}
	public void setOrder_id(String order_id)
	{
		this.order_id = order_id;
	}
	
	public String getC_order_id()
	{
		return c_order_id;
	}
	public void setC_order_id(String c_order_id)
	{
		this.c_order_id = c_order_id;
	}
//2	
	public String getTrain_number()
	{
		return train_number;
	}
	public void setTrain_number(String train_number)
	{
		this.train_number = train_number;
	}
//3
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
//9
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
//10
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
	}
	
	public float getTotal_price()
	{
		return total_price;
	}
	public void setTotal_price(float total_price)
	{
		this.total_price = total_price;
	}
}
