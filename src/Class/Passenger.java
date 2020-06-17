package Class;

/*用户-乘客表*/

public class Passenger {
	private String passenger_id;
	private String user_id;
	private String name;
	private String phoneNumber;
	private boolean ticket;
	
	public String getPassenger_id()
	{
		return passenger_id;
	}
	public void setPassenger_id(String passenger_id)
	{
		this.passenger_id = passenger_id;
	}
	
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	
	public String getPhoneNumber()
	{
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber = phoneNumber;
	}
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	
	public Boolean getTicket()
	{
		return ticket;
	}
	public void setTicket(Boolean ticket)
	{
		this.ticket = ticket;
	}
}
