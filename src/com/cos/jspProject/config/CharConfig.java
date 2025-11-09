package com.cos.jspProject.config;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CharConfig implements Filter {
	//클라이언트가 보낸 요청, 서버가 클라이언트에게 보낼 응답
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		
		request.setCharacterEncoding("utf-8");
		
		String fileUri = request.getRequestURI();
		
		if(fileUri.contains(".css")) {
			response.setContentType("text/css; charset=utf-8");
			chain.doFilter(request, response);
		}
		else {
			response.setContentType("text/html; charset=utf-8");
			chain.doFilter(request, response);
		}

	}
}
