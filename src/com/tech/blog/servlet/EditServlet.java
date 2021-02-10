package com.tech.blog.servlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Message;
import com.tech.blog.entity.User;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.MY_CNX;


@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("updated");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

        Part part = request.getPart("image");

       //fetch all data
      String userEmail = request.getParameter("email");
      String userName = request.getParameter("name");
      String userPassword = request.getParameter("password");
      String userAbout = request.getParameter("about");
//      String imageName = part.getSubmittedFileName();
String imageName="";

		//get the user from session
      HttpSession s = request.getSession();
      User user = (User) s.getAttribute("username");
      user.setEmail(userEmail);
      user.setName(userName);
      user.setPassword(userPassword);
      user.setAbout(userAbout);
      user.setProfile(imageName);
		   
		//update database
        UserDao userDao = new UserDao(MY_CNX.getConnection());
        boolean ans = userDao.updateUser(user);
        if (!ans) {
            out.println("not updated..");
            Message msg = new Message("Something went wrong..", "error", "alert-danger");
            s.setAttribute("msg", msg);
        }
        else {
        	   String path = request.getRealPath("/") + "images" + File.separator + user.getProfile();
               //start of photo work      
              Helper.saveFile(part.getInputStream(), path);
        }
        response.sendRedirect("profile.jsp");
    }
}
