package com.tech.blog.entity;
public class Book {
	public Book() {
		super();
	}
     public Book(String bCat, String bTitle, String bAuthor, String bLink, String bPic) {
		super();
		this.bCat = bCat;
		this.bTitle = bTitle;
		this.bAuthor = bAuthor;
		this.bLink = bLink;
		this.bPic = bPic;
	}
	public Book(String bCat, String bTitle, String bAuthor, String bLink) {
		super();
		this.bCat = bCat;
		this.bTitle = bTitle;
		this.bAuthor = bAuthor;
		this.bLink = bLink;
	}
	private String bCat;
     private String bTitle;
     private String bAuthor;
     private String bLink;
     private String bPic;
	public String getbCat() {
		return bCat;
	}
	public void setbCat(String bCat) {
		this.bCat = bCat;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbAuthor() {
		return bAuthor;
	}
	public void setbAuthor(String bAuthor) {
		this.bAuthor = bAuthor;
	}
	public String getbLink() {
		return bLink;
	}
	public void setbLink(String bLink) {
		this.bLink = bLink;
	}
	public String getbPic() {
		return bPic;
	}
	public void setbPic(String bPic) {
		this.bPic = bPic;
	}
     
}
