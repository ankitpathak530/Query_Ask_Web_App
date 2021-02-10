package com.tech.blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Message;
import com.tech.blog.entity.User;
import com.tech.blog.helper.MY_CNX;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,res);
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		UserDao dao=new UserDao(MY_CNX.getConnection());
		User u=dao.getUsernameByEmailAdndPassword(username, password);
		if(u==null) {
			//out.println("invalid details");
			Message msg = new Message("Invalid details ! try with another","error","alert-danger");
			HttpSession s = req.getSession();
			s.setAttribute("msg", msg);
			res.sendRedirect("login.jsp");
		}
		else {
			//login success
			HttpSession s = req.getSession();
			s.setAttribute("username",u);
			res.sendRedirect("profile.jsp");
		}
  }
		
}

