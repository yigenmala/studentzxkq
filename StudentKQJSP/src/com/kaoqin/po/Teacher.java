package com.kaoqin.po;

public class Teacher {
	private int id;
	private String tid;
	private String userPass;
	private String tname;
	private String tsex;
	private String office;
	private String remark;
	private String course;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTsex() {
		return tsex;
	}
	public void setTsex(String tsex) {
		this.tsex = tsex;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	public Teacher(int id, String tid, String userPass, String tname,
			String tsex, String office,String course , String remark) {
		this.id = id;
		this.tid = tid;
		this.userPass = userPass;
		this.tname = tname;
		this.tsex = tsex;
		this.office = office;
		this.course =course;
		this.remark = remark;
	}
	
	public Teacher(String tid, String userPass, String tname,
			String tsex, String course,String office, String remark) {
		this.tid = tid;
		this.userPass = userPass;
		this.tname = tname;
		this.tsex = tsex;
		this.course=course;
		this.office = office;
		this.remark = remark;
	}
	
	public Teacher(int id, String tid, String userPass, String tname,
			String tsex, String office, String remark) {
		this.id = id;
		this.tid = tid;
		this.userPass = userPass;
		this.tname = tname;
		this.tsex = tsex;
		this.office = office;
		this.remark = remark;
	}
	
	public Teacher( String tid , String userPass ){
		this.tid = tid;
		this.userPass = userPass;
	}
}
