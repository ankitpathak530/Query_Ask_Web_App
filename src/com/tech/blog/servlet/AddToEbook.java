package com.tech.blog.servlet;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Book;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.MY_CNX;

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

@WebServlet("/AddToEbook")
@MultipartConfig
public class AddToEbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doGet(request, response);
     
        Part part = request.getPart("image");
        
       Book book = new Book();
       book.setbCat(request.getParameter("bCat"));
       book.setbTitle(request.getParameter("bTitle"));
       book.setbAuthor(request.getParameter("bAuthor"));
       book.setbLink(request.getParameter("bLink"));
 //book.setbPic(part.getSubmittedFileName());
   
        PrintWriter out = response.getWriter();
        //update database....
        UserDao userDao = new UserDao(MY_CNX.getConnection());
        boolean ans = userDao.saveBook(book);
        
        if(ans){
            String path = request.getRealPath("/") + "images" + File.separator +"books"+ File.separator+ book.getbPic();
            //start of photo work      
            if (Helper.saveFile(part.getInputStream(), path))
                out.println("done");
            else 
            	out.println("error");
        }
        else 
           out.println("error");
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}