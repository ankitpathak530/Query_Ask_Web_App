package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entity.*;

public class UserDao {
     private Connection con;
     public UserDao(Connection con) {
    	 this.con=con;
     }
     //method to insert user to databae
     public boolean saveUser(User user) {
    	 boolean is_inserted=false;
    	 try {
    		 //user--database
    		 String query="INSERT INTO `user`(name,email,password,gender,about) values(?,?,?,?,?)";
    		 PreparedStatement ps= con.prepareStatement(query);
    		 ps.setString(1, user.getName());
    		 ps.setString(2, user.getEmail());
    		 ps.setString(3, user.getPassword());
    		 ps.setString(4, user.getGender());
    		 ps.setString(5, user.getAbout());
    		 
    	    ps.execute();   
    		    is_inserted=true;
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return is_inserted;
     }
     
     
     //get user by username and password
     public User getUsernameByEmailAdndPassword(String email,String password) {
    	 User user=null;
    	 try {
    		 
    		 String query="SELECT * FROM  `user`  WHERE `email`= ? AND `password`=?";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ps.setString(1,email);
    		 ps.setString(2, password);
    		 ResultSet rs=ps.executeQuery();
    		 
    		 if(rs.next()) {
    			 user=new User();
    			 
    			 user.setId(rs.getInt("id"));
    			 user.setName(rs.getString("name"));
    			 user.setEmail(rs.getString("email"));
    			 user.setPassword(rs.getString("password"));
    			 user.setGender(rs.getString("gender"));
    			 user.setAbout(rs.getString("about"));
    			 user.setDateTime(rs.getTimestamp("reg_date"));
    			 user.setProfile(rs.getString("profile"));
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 return user;
     }

     public boolean updateUser(User user) {

         boolean f = false;
         try {

             String query = "update user set name=? , email=? , password=? , gender=? ,about=? , profile=? where  id =?";
             PreparedStatement p = con.prepareStatement(query);
             p.setString(1, user.getName());
             p.setString(2, user.getEmail());
             p.setString(3, user.getPassword());
             p.setString(4, user.getGender());
             p.setString(5, user.getAbout());
             p.setString(6, user.getProfile());
             p.setInt(7, user.getId());

             p.executeUpdate();
             f = true;

         } catch (Exception e) {
             e.printStackTrace();
         }
         return f;
     }
     public boolean savePost(Post post) {
    	boolean b=false ;
    	  try {
    		   String query = "INSERT INTO post(pTitle,pContent,pCode,pCat,pBy,pById)VALUES(?,?,?,?,?,?)";
    		   PreparedStatement ps = con.prepareStatement(query);
    		   ps.setString(1,post.getpTitle());
    		   ps.setString(2, post.getpContent());
    		   ps.setString(3, post.getpCode());
    		   ps.setString(4, post.getpCat());
    		   ps.setString(5, post.getpBy());
    		   ps.setInt(6, post.getpById());
    		   
    		   ps.executeUpdate();
    		   b=true;
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
    	  return b;
     }
     //fetching all posts
     public List<Post> getAllPosts(){
    	 List<Post> list = new ArrayList<>();
    	 
    	 try {
    		 String query="SELECT * FROM post";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ResultSet rs = ps.executeQuery();
    		 while(rs.next()) {
    			 int pId=rs.getInt("pId");
    			 String pTitle=rs.getString("pTitle");
    			 String pContent=rs.getString("pContent");
    			 String pCode=rs.getString("pCode");
    			 Timestamp date = rs.getTimestamp("pDate");
    			 String pCat = rs.getString("pCat");
    			 String pBy= rs.getString("pBy");
    			 int pById=rs.getInt("pById");
    			      System.out.println("\n\n\nyes lge rho\n\n\n");
    			 Post post = new Post(pId,pTitle,pContent,pCode,date,pCat,pBy,pById);
    			 list.add(post);
    		 }
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 
    	 return list;
     }
     public List<Post> getPostByCatId(String catId){
    	 List<Post> list = new ArrayList<>();
       	 try {
    		 String query="SELECT * FROM post where pCat=?";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ps.setString(1, catId);
    		 
    		 ResultSet rs = ps.executeQuery();
    		 while(rs.next()) {
    			 int pId=rs.getInt("pId");
    			 String pTitle=rs.getString("pTitle");
    			 String pContent=rs.getString("pContent");
    			 String pCode=rs.getString("pCode");
    			 Timestamp date = rs.getTimestamp("pDate");
    			 String pBy = rs.getString("pBy");
      			 int pById = rs.getInt("pById");
    			 Post post = new Post(pId,pTitle,pContent,pCode,date,catId,pBy,pById);
    			 list.add(post);
    		 }
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 
    	 return list;
     }
     public Post getAllPostDetailsById(int pId){
    	 Post post =null;
    	 
    	 try {
    		 String query="SELECT * FROM post where pId=?";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ps.setInt(1, pId);
    		 ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			 String pTitle=rs.getString("pTitle");
    			 String pContent=rs.getString("pContent");
    			 String pCode=rs.getString("pCode");
    			 Timestamp date = rs.getTimestamp("pDate");
    			 String pCat = rs.getString("pCat");
    			 String pBy = rs.getString("pBy");
    			 int pById= rs.getInt("pById");
    			 
    		    post = new Post(pId,pTitle,pContent,pCode,date,pCat,pBy,pById);
    			
    		 }
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return post;
     }
     //getAllPostByName
     public List<Post> getAllPostById(int  pById){
    	 List<Post> list = new ArrayList<Post>();
    	 try {
    		 String query="SELECT * FROM post where pById=?";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ps.setInt(1, pById);
    		 ResultSet rs = ps.executeQuery();
    		 while(rs.next()) {
    			 int pId = rs.getInt("pId");
    			 String pTitle=rs.getString("pTitle");
    			 String pContent=rs.getString("pContent");
    			 String pCode=rs.getString("pCode");
    			 Timestamp date = rs.getTimestamp("pDate");
    			 String pCat = rs.getString("pCat");
    			 String pBy = rs.getString("pBy");
    			 int pByIdd=rs.getInt("pById");
    			 
    		   Post post = new Post(pId,pTitle,pContent,pCode,date,pCat,pBy,pByIdd);
    		   list.add(post);
    		 }
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return list;
     }
     
     public boolean saveBook(Book book) {
     	boolean b=false ;
     	  try {
     		   String query = "INSERT INTO `books`(bCat,bTitle,bAuthor,bLink,bPic)VALUES(?,?,?,?,?)";
     		   PreparedStatement ps = con.prepareStatement(query);
     		   ps.setString(1, book.getbCat());
     		   ps.setString(2, book.getbTitle());
     		   ps.setString(3, book.getbAuthor());
     		   ps.setString(4, book.getbLink());
     		   ps.setString(5, book.getbPic());
   
     		   ps.executeUpdate();
     		   b=true;
     	  }catch(Exception e) {
     		  e.printStackTrace();
     	  }
     	  return b;
      }
     public boolean getAdminUsernameByEmailAdndPassword(String username,String password) {
    	 try {
    		 
    		 String query="SELECT * FROM  `admin`  WHERE `username`= ? AND `password`=?";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ps.setString(1,username);
    		 ps.setString(2, password);
    		 ResultSet rs=ps.executeQuery();
    		 
    		 if(rs.next()) {
    			 return true;
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 return false;
     }
     public List<Book> getBookByCatId(String catId){
    	 List<Book> list = new ArrayList<>();
       	 try {
    		 String query="SELECT * FROM books where bCat=?";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ps.setString(1, catId);
    		 
    		 ResultSet rs = ps.executeQuery();
    		 while(rs.next()) {
    			
    			 String bCat=rs.getString("bCat");
    			 String bTitle=rs.getString("bTitle");
    			 String bAuthor=rs.getString("bAuthor");
    			 String bLink = rs.getString("bLink");
    			 String bPic = rs.getString("bPic");
      			 
    			 Book book = new Book(bCat,bTitle,bAuthor,bLink,bPic);
    			 list.add(book);
    		 }
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 System.out.println("i am calling from database");
    	 return list;
     }
     
     public List<Book> getAllBooksById(int  bById){
    	 List<Book> list = new ArrayList<Book>();
    	 try {
    		 String query="SELECT * FROM books where bById=?";
    		 PreparedStatement ps = con.prepareStatement(query);
    		 ps.setInt(1, bById);
    		 ResultSet rs = ps.executeQuery();
    		 while(rs.next()) {
    			 String bCat=rs.getString("bCat");
    			 String bTitle=rs.getString("bTitle");
    			 String bAuthor=rs.getString("bAuthor");
    			 String bLink = rs.getString("bLink");
    			 String bPic = rs.getString("bPic");
      			 
    			 Book book = new Book(bCat,bTitle,bAuthor,bLink,bPic);
    			 list.add(book);
    		 }
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return list;
     }
     
}
