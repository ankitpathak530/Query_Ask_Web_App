package com.tech.blog.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Message;

import com.tech.blog.helper.MY_CNX;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
      
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		Connection con = MY_CNX.getConnection();
		UserDao user = new UserDao(con);
		boolean chk=user.getAdminUsernameByEmailAdndPassword(username, password);
		if(chk)
		{
			HttpSession s = req.getSession();
			s.setAttribute("username",username);
			res.sendRedirect("dadmin.jsp");
		}
		else {
			Message msg = new Message("Invalid details ! try with another","error","alert-danger");
			HttpSession s = req.getSession();
			s.setAttribute("msg", msg);
			res.sendRedirect("admin_login.jsp");
		}		
	}
}
