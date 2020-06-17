package Class;

/*车次信息表*/

public class Ticket {
	private String train_number;
	private String departure_station;    	//出发站
	private String destination_station;		//终点站
	private String date;
	private String departure_time;
	private String destination_time;
	private String business_ticket;
	private String business_price;
	private String lev1_ticket;
	private String lev1_price;
	private String lev2_ticket;
	private String lev2_price;
	private String noSeat_ticket;
	private String noSeat_price;
	
	
	public String getTrain_number()
	{
		return train_number;
	}
	public void setTrain_number(String train_number)
	{
		this.train_number = train_number;
	}
	
	public String getDeparture_station()
	{
		return departure_station;
	}
	public void setDeparture_station(String departure_station)
	{
		this.departure_station = departure_station;
	}
	
	public String getDestination_station()
	{
		return destination_station;
	}
	public void setDestination_station(String destination_station)
	{
		this.destination_station = destination_station;
	}
	
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	
	public String getDeparture_time()
	{
		return departure_time;
	}
	public void setDeparture_time(String departure_time)
	{
		this.departure_time = departure_time;
	}
	
	public String getDestination_time()
	{
		return destination_time;
	}
	public void setDestination_time(String destination_time)
	{
		this.destination_time = destination_time;
	}
	
	public String getBusiness_ticket()
	{
		return business_ticket;
	}
	public void setBusiness_ticket(String business_ticket)
	{
		this.business_ticket = business_ticket;
	}
	
	public String getBusiness_price()
	{
		return business_price;
	}
	public void setBusiness_price(String business_price)
	{
		this.business_price = business_price;
	}
	
	public String getLev1_ticket()
	{
		return lev1_ticket;
	}
	public void setLev1_ticket(String lev1_ticket)
	{
		this.lev1_ticket = lev1_ticket;
	}
	
	public String getLev1_price()
	{
		return lev1_price;
	}
	public void setLev1_price(String lev1_price)
	{
		this.lev1_price = lev1_price;
	}
	
	public String getLev2_ticket()
	{
		return lev2_ticket;
	}
	public void setLev2_ticket(String lev2_ticket)
	{
		this.lev2_ticket = lev2_ticket;
	}
	
	public String getLev2_price()
	{
		return lev2_price;
	}
	public void setLev2_price(String lev2_price)
	{
		this.lev2_price = lev2_price;
	}
	
	public String getNoSeat_ticket()
	{
		return noSeat_ticket;
	}
	public void setNoSeat_ticket(String noSeat_ticket)
	{
		this.noSeat_ticket = noSeat_ticket;
	}
	
	public String getNoSeat_price()
	{
		return noSeat_price;
	}
	public void setNoSeat_price(String noSeat_price)
	{
		this.noSeat_price = noSeat_price;
	}
	
}
