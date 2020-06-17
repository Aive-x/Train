package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Class.User;
import MySQL.operate;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/*使用post方式接收提交的表单，进行注册请求的处理*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			/*接收前端传输的数据*/
			/*可能还需要增加例如此账号已注册等判断，以及前端页面现在可以做到无视不符合条件的提示直接提交表单，可能需要在这里再做一下拦截*/
			String user_id = request.getParameter("createID");
			String phoneNumber = request.getParameter("createPhone");
			String name = new String(request.getParameter("createName").getBytes("ISO8859-1"),"UTF-8");;
			String password = request.getParameter("createPwd");
			
			User user = new User();
			user.setPhoneNumber(phoneNumber);
			user.setName(name);
			user.setUser_id(user_id);
			user.setPassword(password);
			
			operate dao = new operate();
			dao.setUser(user);
			
			/*同样添加了一个registerOK.jsp的界面用于注册登录成功的提示*/
			request.getRequestDispatcher("registerOK.jsp").forward(request, response);
			
		} catch (SQLException e) {
			System.out.print("创建用户失败！");
			e.printStackTrace();
		}
		
	}

}
