package com.tech.blog.entity;
import java.sql.*;

public class Post {
	   public Post(int pId, String pTitle, String pContent, String pCode, Timestamp pDate, String pCat,String pBy,int pById) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pDate = pDate;
		this.pCat = pCat;
		this.pBy=pBy;
		this.pById = pById;
		
	}
	   public Post(String pTitle, String pContent, String pCode, Timestamp pDate, String pCat,String pBy,int pById) {
			super();
			
			this.pTitle = pTitle;
			this.pContent = pContent;
			this.pCode = pCode;
			this.pDate = pDate;
			this.pCat = pCat;
			this.pBy = pBy;
			this.pById = pById;
		}
	private int pId;
	   private String pTitle;
	   private String pContent;
	   private String pCode;
	   private Timestamp pDate;
	   private String pCat;
	   private String pBy;
	   private int pById;
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public String getpCat() {
		return pCat;
	}
	public void setpCat(String pCat) {
		this.pCat = pCat;
	}
	public void setpBy(int pById) {
		this.pById = pById;
	}
	public int getpById() {
		return pById;
	}
	public String getpBy() {
		return pBy;
	}
	public void setpBy(String pBy) {
		this.pBy = pBy;
	}
   }
