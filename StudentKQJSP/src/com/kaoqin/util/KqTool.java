package com.kaoqin.util;

import java.io.PrintWriter;

public class KqTool {

	public static void printAlert(PrintWriter out, String message, String location){
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("window.location='" + location + "';");
		out.println("</script>");
	}
	
	public static void printAlertAndGoBack(PrintWriter out, String message){
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("window.history.go(-1);");
		out.println("</script>");
	}
	
	public static void printPrompt(PrintWriter out, String message, String location){
		out.println("<script language='javascript'>");
		out.println("window.prompt('" + message + "');");
		out.println("window.location='" + location + "';");
		out.println("</script>");
	}
}
