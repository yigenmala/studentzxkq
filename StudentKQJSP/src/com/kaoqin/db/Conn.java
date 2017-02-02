package com.kaoqin.db;

import java.sql.*;
import java.util.Vector;
import java.util.Enumeration;

public class Conn {
    private final static String DRIVER = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
    private String URL = "jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=StudentKQ";
    private String user = "sa";
    private String password = "123";

    private Connection conn ;
    private Statement stmt;

    static{
    	registerDriver();
    }
    
    public Conn() {
    }

    public static boolean registerDriver(){
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public ResultSet executeQuery(String sql) {
        ResultSet rs ;
        try{
        	//ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE
            conn = DriverManager.getConnection(URL,user,password);
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs = stmt.executeQuery(sql);
        }catch(SQLException e) {
            rs = null;
            e.printStackTrace();
        }
        return rs;
    }

    public int executeUpdate(String sql) {
        int result = -1;
        try{
            conn = DriverManager.getConnection(URL,user,password);
            stmt = conn.createStatement();
            result = stmt.executeUpdate(sql);
        }catch(SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }

    public boolean executeUpdate(Vector sqlstr){
        boolean bFlag = false;
        try{
            conn = DriverManager.getConnection(URL,user,password);
            conn.setAutoCommit(false);
            stmt = conn.createStatement();
            Enumeration enu = sqlstr.elements();
            while(enu.hasMoreElements()){
                String sql = enu.nextElement().toString();
                stmt.executeUpdate(sql);
            }
            conn.commit();
            bFlag = true;
        }catch(SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            close();
        }
        return bFlag ;
    }


    public void close() {
        try{
            if(stmt!=null)
                stmt.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }

         try{
             if(conn!=null)
                 conn.close();
         }catch(Exception e) {
             e.printStackTrace();
         }
     }
    
    public static void main(String[] args) throws Exception {
    	ResultSet rs = new Conn().executeQuery("select * from admin");
    	rs.next();
    	System.out.println(rs.getString(1));
    	System.out.println(rs.getString("userName"));
    	System.out.println(rs.getString("id"));
    }

}
