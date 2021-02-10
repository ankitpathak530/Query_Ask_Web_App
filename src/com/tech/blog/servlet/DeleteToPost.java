package com.tech.blog.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tech.blog.helper.MY_CNX;

@WebServlet("/DeleteToPost")
public class DeleteToPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String pId = request.getParameter("pId");		
	    	 try {
	    		 String query = "DELETE FROM `post` WHERE pId=?";
	    		 PreparedStatement ps = MY_CNX.getConnection().prepareStatement(query);
	    		 ps.setInt(1, Integer.parseInt(pId));
	    		 ps.executeUpdate();
	    	 }catch(Exception ex) {
	    		 ex.printStackTrace();
	    	 }
	    	response.sendRedirect("dadmin.jsp");
	}

}
