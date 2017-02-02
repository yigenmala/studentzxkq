package com.kaoqin.dao;

import com.kaoqin.db.Conn;
import com.kaoqin.po.QingJia;

public class QingJiaDao {
	
	public static boolean addQingJia(QingJia qj){
		Conn db = new Conn();
        String sqlstr = "insert into kq(tid,sid, ktype,course,courseTime,content,days) values(" +
        	qj.getTid() + "," + qj.getSid() + ",'" + qj.getKtype() + "','" + qj.getCourse() + "','" + qj.getCourseTime() + "','" + qj.getContent() + "'," + qj.getDays() + ")";
        System.out.println(sqlstr);
        
        boolean flag = false;

        if( db.executeUpdate(sqlstr) > 0) {
            flag = true;
        }
        db.close();
        return flag;
	}
}
