package MySQL;

import java.sql.*;

/*连接数据库*/

public class WriteConnect {
	private static final String url = "jdbc:mysql://118.31.106.187:3306/train";
	private static final String username = "masterbackup";   /*账号*/
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
