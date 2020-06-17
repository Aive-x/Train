package Class;

public class C_order {
	private String c_order_id;
	private String passenger_id;
	private String carriage;
	private String seat;
	private String level;
	private float price;
//1
	public String getC_order_id()
	{
		return c_order_id;
	}
	public void setC_order_id(String c_order_id)
	{
		this.c_order_id = c_order_id;
	}
//4
	public String getPassenger_id()
	{
		return passenger_id;
	}
	public void setPassenger_id(String passenger_id)
	{
		this.passenger_id = passenger_id;
	}
//5
	public String getCarriage()
	{
		return carriage;
	}
	public void setCarriage(String carriage)
	{
		this.carriage = carriage;
	}
//6
	public String getSeat()
	{
		return seat;
	}
	public void setSeat(String seat)
	{
		this.seat = seat;
	}
//7
	public String getLevel()
	{
		return level;
	}
	public void setLevel(String level)
	{
		this.level = level;
	}
//8
	public float getPrice()
	{
		return price;
	}
	public void setPrice(float price)
	{
		this.price = price;
	}
}
