package Servlet;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import Class.User;
import MySQL.operate;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	/*使用post方式接收提交的表单，进行登陆请求的处理*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			/*接收前端传输的数据*/
			String phoneNumber = request.getParameter("textPhone");
			String password = request.getParameter("textPwd");
			
			/*调用operate类*/
			operate dao = new operate();
			User user = new User();
			user = dao.Login(phoneNumber);
			HttpSession session = request.getSession();
			
			if(password.equals(user.getPassword()))
			{
				/*将user储存进session中，方便每个页面进行调用，显示出已登录的状态*/
				/*我添加了一个loginOK.jsp的界面用于提示登录成功，但好像有直接通过这里的代码进行alert的方法，我之后会去看看，但现在就先这样吧*/
				/*或者你们知道的话可以在群里说一下*/
				session.setAttribute("user", user);
				request.getRequestDispatcher("loginOK.jsp").forward(request, response); 
			}
			else
			{
				/*如果账号密码不匹配，返回登录界面并提示密码错误（暂时还没写）*/
				System.out.print("2");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
