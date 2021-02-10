package com.tech.blog.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entity.Message;
import com.tech.blog.helper.MY_CNX;

/**
 * Servlet implementation class DeleteToEbook
 */
@WebServlet("/DeleteToEbook")
public class DeleteToEbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DeleteToEbook() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
			HttpSession s = request.getSession();
			int eu=0;
			String bId = request.getParameter("bId");		
		    	 try {
		    		 String query = "DELETE FROM `books` WHERE bId=?";
		    		 PreparedStatement ps = MY_CNX.getConnection().prepareStatement(query);
		    		 ps.setInt(1, Integer.parseInt(bId));
		    		 eu=ps.executeUpdate();
		    	 }catch(Exception ex) {
		    		 ex.printStackTrace();
		    	 }
		    if(eu==0) {
		    	Message msg = new Message("Invalid Id ! try with another","error","alert-danger");
				s.setAttribute("msg", msg);
				response.sendRedirect("dadmin.jsp");
		    }
		    else {
		    	Message msg = new Message("Book deleted","success","alert-success");
				s.setAttribute("msg", msg);
		    	response.sendRedirect("dadmin.jsp");
		    }
		    
		    	
		}
}


