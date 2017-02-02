package com.kaoqin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.kaoqin.db.Conn;
import com.kaoqin.po.Teacher;

public class TeacherDao {
	
	public static boolean login(Teacher th){
		Conn db = new Conn();
        String sqlstr = "select id,tid,userPass,tname,tsex,office,course,remark from teacher where tid='" + th.getTid() + "'";
        ResultSet rs = db.executeQuery(sqlstr);
        try {
            if (rs != null && rs.next()) {
                String pass = rs.getString("userPass");
                if (th.getUserPass().equals(pass)) {
                	th.setId(rs.getInt("id"));
                	th.setTid(rs.getString("tid"));
                	th.setTname(rs.getString("tname"));
                	th.setTsex(rs.getString("tsex"));
                	th.setOffice(rs.getString("office"));
                	th.setRemark(rs.getString("remark"));
                	th.setCourse(rs.getString("course"));
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
	
	public static boolean addTeacher(Teacher t){
		Conn db = new Conn();
        String sqlstr = "insert into teacher(tid,userPass,tname,tsex,office,course,remark) values('" +
        	t.getTid() + "','" + t.getUserPass() + "','" + t.getTname() + "','" + t.getTsex() + "','" + t.getOffice() + "','" + t.getCourse() + "','" + t.getRemark() + "')";
        System.out.println(sqlstr);
        
        boolean flag = false;

        if( db.executeUpdate(sqlstr) > 0) {
            flag = true;
        }
        db.close();
        return flag;
	}
	
	public static Vector<Teacher> getTeachers(){
		Vector<Teacher> rows = new Vector<Teacher>();
		Conn db = new Conn();
		String sqlstr = "select id,tid,userPass,tname,tsex,office,remark,course from teacher";
		System.out.println(sqlstr);
		
		ResultSet rs = db.executeQuery(sqlstr);
		
		try {
			while(rs.next()) {
 				 
				
				Teacher t = new Teacher(rs.getInt("id"),
						rs.getString("tid"),
						rs.getString("userPass"),
						rs.getString("tname"),
						rs.getString("tsex"),
						rs.getString("course"),
						rs.getString("office"),
						rs.getString("remark"));
				rows.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
			}
			db.close();
		}
		return rows;
	}
	
	public static Teacher getTeacherById(String id){
		Conn conn = new Conn();
        String sqlstr = "select id,tid,userPass,tname,tsex,office,course,remark from teacher where id=" + id;
        System.out.println(sqlstr);
        
        Teacher t = null;
        ResultSet rs = conn.executeQuery(sqlstr);
        
        try {
			if(rs.next()){
				t = new Teacher(rs.getInt("id"),
					rs.getString("tid"),
					rs.getString("userPass"),
					rs.getString("tname"),
					rs.getString("tsex"),
					rs.getString("office"),
					rs.getString("course"),
					rs.getString("remark"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			conn.close();
		}
        return t;
	}
	
	public static boolean updateTeacher(Teacher t, String id){
		Conn db = new Conn();
        String sqlstr = "update teacher set tid='" + t.getTid() + 
        			"',userPass='" + t.getUserPass() + 
        			"',tname='" + t.getTname() + 
        			"',tsex='"  + t.getTsex() + 
        			"',office='" + t.getOffice() + 
        			"',course='" + t.getCourse() + 
        			"',remark='" + t.getRemark() + "' where id=" + id;
        System.out.println(sqlstr);
        
        boolean flag = false;

        if( db.executeUpdate(sqlstr) > 0) {
            flag = true;
        }
        db.close();
        return flag;
	}
	
	public static boolean delTeacher(String id){
		Conn db = new Conn();
        String sqlstr = "delete from teacher where id=" + id;
        System.out.println(sqlstr);
        
        boolean flag = false;

        if( db.executeUpdate(sqlstr) > 0) {
            flag = true;
        }
        db.close();
        return flag;
	}
}
