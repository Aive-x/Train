package MySQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReadConnect {
	private static final String url = "jdbc:mysql://47.240.63.204:3306/train";
	private static final String username = "root";   /*账号*/
	private static final String password = "123456789";   /*密码*/
	private static Connection conn = null;
	
	public static Connection getConnection() throws SQLException
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        }
        catch(ClassNotFoundException e)
        {
        	System.out.println("数据库连接失败");
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(ResultSet rs,PreparedStatement ps,Connection conn) throws SQLException
    {
        try
        {
            rs.close();
            ps.close();
            conn.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
}
