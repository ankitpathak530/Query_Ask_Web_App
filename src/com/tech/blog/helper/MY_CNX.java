package com.tech.blog.helper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MY_CNX {
     private static Connection con;
     public static Connection getConnection() {
    	 if(con==null) {    	 
    	 try {
    		 Class.forName("com.mysql.cj.jdbc.Driver");
    		 con=DriverManager.getConnection("jdbc:MySQL://localhost:3306/learntech","root","Ankit@1234");
    	 }catch(ClassNotFoundException e) {
    		 e.printStackTrace();
    	 }catch(SQLException e) {
    		 e.printStackTrace();
    	 } 
     return con;
     }
    else
      return con;
     }
}
