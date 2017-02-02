package com.kaoqin.po;

public class QingJia {
	private long kid;
	private String tid;
	private String sid;
	private String course;
	private String courseTime;
	private String ktype;
	private String content;
	private String redate;
	private int days;
	
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public long getKid() {
		return kid;
	}
	public void setKid(long kid) {
		this.kid = kid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
 
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
	public String getKtype() {
		return ktype;
	}
	public void setKtype(String ktype) {
		this.ktype = ktype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	
	 
	
	public QingJia( long kid,String redate,String tid, String sid, String course,
			String courseTime, String ktype, String content   ) {
		this.kid = kid;
		this.tid = tid;
		this.sid = sid;
		this.course = course;
		this.courseTime = courseTime;
		this.ktype = ktype;
		this.content = content;
		this.redate = redate;
	}
	
	public QingJia( String tid, String sid, String course,
			String courseTime, String ktype, String content,int days) {
		this.tid = tid;
		this.sid = sid;
		this.course = course;
		this.courseTime = courseTime;
		this.ktype = ktype;
		this.content = content;
		this.days = days;
	}
}
