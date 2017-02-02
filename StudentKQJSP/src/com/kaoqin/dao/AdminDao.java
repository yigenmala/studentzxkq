package com.kaoqin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.kaoqin.db.Conn;
import com.kaoqin.po.Admin;


public class AdminDao {

	public static boolean login(Admin ad){
		Conn db = new Conn();
        String sqlstr = "select id,userName,userPass from admin where userName='" + ad.getUserName() + "'";
        ResultSet rs = db.executeQuery(sqlstr);
        try {
            if (rs != null && rs.next()) {
                String pass = rs.getString("userPass");
                if (ad.getUserPass().equals(pass)) {
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
}
