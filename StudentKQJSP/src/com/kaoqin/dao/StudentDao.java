package com.kaoqin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
 
import com.kaoqin.db.Conn;
import com.kaoqin.po.Student;
 

@SuppressWarnings("unused")
public class StudentDao {
	
	

	public static boolean login(Student sd){
		Conn db = new Conn();
        String sqlstr = "select id,sid,pass,sname,sex,zy,tclass,course,remark from student where sid='" + sd.getSid() + "'";
        ResultSet rs = db.executeQuery(sqlstr);
        try {
            if (rs != null && rs.next()) {
                String pass = rs.getString("pass");
                if (sd.getPass().equals(pass)) {
                	sd.setId(rs.getInt("id"));
                	sd.setSid(rs.getString("sid"));
                	sd.setSname(rs.getString("sname"));
                	sd.setSex(rs.getString("sex"));
                	sd.setZy(rs.getString("zy"));
                	sd.setTclass(rs.getString("tclass"));
                	sd.setCourse(rs.getString("course"));
                	sd.setRemark(rs.getString("remark"));
                    return true;
                }
            }
        } catch (SQLException ex) {
        }
        finally{
            db.close();
        }
        return false;
	}
	
	public static boolean addStudent(Student s){
		Conn db = new Conn();
        String sqlstr = "insert into student(sid,pass,sname,sex,tclass,zy,course,remark) values('" +
        	s.getSid() + "','" + s.getPass() + "','" + s.getSname() + "','" + s.getSex() + "' , '" + s.getTclass() + "','" + s.getZy() + "','" + s.getCourse() + "','" + s.getRemark() + "')";
        System.out.println(sqlstr);
        
        boolean flag = false;

        if( db.executeUpdate(sqlstr) > 0) {
            flag = true;
        }
        db.close();
        return flag;
	}
	public static Student getStudentById(String id){
		Conn conn = new Conn();
        String sqlstr = "select id,sid,pass,sname,sex,tclass,zy,course,remark from student where id=" + id;
        System.out.println(sqlstr);
        
         Student s = null;
        ResultSet rs = conn.executeQuery(sqlstr);
        
        try {
			if(rs.next()){
				s = new Student(rs.getInt("id"),
					rs.getString("sid"),
					rs.getString("pass"),
					rs.getString("sname"),
					rs.getString("sex"),
					rs.getString("tclass"),
					rs.getString("zy"),
					rs.getString("course"),
					rs.getString("remark"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			conn.close();
		}
        return s;
	}
	
	public static boolean updateStudent(Student s, String id){
		Conn db = new Conn();
        String sqlstr = "update student set sid='" + s.getSid() + 
        			"',pass='" + s.getPass() + 
        			"',sname='" + s.getSname() + 
        			"',sex='" + s.getSex() + 
        			"',zy='" + s.getZy() +
        			"',course='" + s.getCourse() +
        			"',tclass='" + s.getTclass() + 
        			"',remark='" + s.getRemark() + "' where id=" + id;
        System.out.println(sqlstr);
        
        boolean flag = false;

        if( db.executeUpdate(sqlstr) > 0) {
            flag = true;
        }
        db.close();
        return flag;
	}
	
	public static boolean delStudent(String id){
		Conn db = new Conn();
        String sqlstr = "delete from student where id=" + id;
        System.out.println(sqlstr);
        
        boolean flag = false;

        if( db.executeUpdate(sqlstr) > 0) {
            flag = true;
        }
        db.close();
        return flag;
	}
}
