package com.kaoqin.po;

public class Student {
	private int id;
	private String sid;
	private String pass;
	private String sname;
	private String sex;
	private String tclass;
	private String zy;
	private String reDate;
	private String course;
	private String remark;
	public long getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	 
	public String getZy() {
		return zy;
	}
	public void setZy(String zy) {
		this.zy = zy;
	}
	public String getReDate() {
		return reDate;
	}
	public void setReDate(String reDate) {
		this.reDate = reDate;
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
	
	public String getTclass() {
		return tclass;
	}
	public void setTclass(String tclass) {
		this.tclass = tclass;
	}
	 
	
	public Student(int id, String sid, String pass, String sname, String sex,
			 String zy,  String course,String reDate,String remark) {
		this.id = id;
		this.sid = sid;
		this.pass = pass;
		this.sname = sname;
		this.sex = sex;
		this.zy = zy;
	 	this.course = course;
	 	this.reDate =reDate;
		this.remark = remark;
	}
	
	public Student(String sid, String pass, String sname, String sex,
			  String zy,String tclass,String course, String remark) {
		this.sid = sid;
		this.pass = pass;
		this.sname = sname;
		this.sex = sex;
	    this.zy= zy;
		this.tclass = tclass;
		this.course = course;
		this.remark = remark;
	}
	
	public Student(String sid, String pass) {
		this.sid = sid;
		this.pass = pass;
	}
	 
	
}
