package com.kaoqin.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncondingFilter implements Filter {

	private String targetEncoding = "gb2312"; 
	private FilterConfig filterConfig;

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		
		//System.out.println("filter run.");
		
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		request.setCharacterEncoding(targetEncoding);// 把请求用指定的方式编码
		response.setCharacterEncoding(targetEncoding);
		chain.doFilter(arg0, arg1);
	}

	public void init(FilterConfig config) throws ServletException {
		this.filterConfig = config; 
		this.targetEncoding = config.getInitParameter("encoding"); 
	}

	public void destroy() {
		this.filterConfig = null;
	}
	
	public void setFilterConfig(final FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	} 

}

/**
在这里是过滤器重新设置获得编码为gb2312 
	<filter> 
		<filter-name>encoding</filter-name>  
	       <filter-class>EncodingFilter</filter-class>  
		       	<init-param> 
			         <param-name>encoding</param-name> 
			         <param-value>gb2312</param-value> 
				</init-param> 
	</filter>
	<filter-mapping>  
	   <filter-name>encoding</filter-name>  
	   <url-pattern>/*</url-pattern>   
	</filter-mapping> 

 <filter-name>auth</filter-name> 
 <filter-class>LoginFilter</filter-class> 
</filter> 
 
<filter-mapping> 
  <filter-name>auth</filter-name> 
 <url-pattern>/target.jsp</url-pattern> 
</filter-mapping>     
*/
