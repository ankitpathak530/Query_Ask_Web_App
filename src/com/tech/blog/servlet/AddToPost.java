package com.tech.blog.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Post;
import com.tech.blog.entity.User;
import com.tech.blog.helper.MY_CNX;

@WebServlet("/AddToPost")
@MultipartConfig
public class AddToPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method 	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
         PrintWriter out = response.getWriter();
         HttpSession s = request.getSession();
		  String cid = request.getParameter("cid");
          String pTitle = request.getParameter("title");
          String pContent = request.getParameter("content");
          String pCode = request.getParameter("program");
         
  	   	UserDao dao2=new UserDao(MY_CNX.getConnection());
  	   	Post p2;
  	   	String chk = request.getParameter("check");
  	   	if(chk.equals("admin")) {
  	   	  p2 = new Post(pTitle, pContent, pCode, null,cid,"Sr.",1001);
  	   	}
  	   	else {
	  	   	User user = (User)s.getAttribute("username");
	  	    p2 = new Post(pTitle, pContent, pCode, null,cid,user.getName(),user.getId());
  	   	}
  	  
  		if(!dao2.savePost(p2)){
  			out.println("error");
			}
		else {
			out.println("done");
		}
      }
}
