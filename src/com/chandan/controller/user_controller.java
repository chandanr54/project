package com.chandan.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chandan.Dao.userdao;
import com.chandan.model.user;
@WebServlet("/user")
public class user_controller extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String opt=req.getParameter("opt");
		
		if(opt !=null)
		{
			int ch=Integer.parseInt(opt);
			switch (ch)
			{
			case 1:
				logpro(req, resp);
				break;
			case 2:
				regpro(req, resp);
				break;
			case 3:
				update(req, resp);
				break;
			case 4:
			 HttpSession hs=req.getSession(false);
			 hs.removeAttribute("user");
			 hs.removeAttribute("list");
			 hs.removeAttribute("total");
			 hs.invalidate();
			resp.sendRedirect("index.jsp");
			 
				break;
			}
		}
		
		
		
	}
	
	private void update(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String name= req.getParameter("name");
		String email= req.getParameter("email");
		String pass= req.getParameter("pass");
		
		resp.getWriter().print(name+"\n"+email+"\n"+pass);
		
	}

	private void logpro(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
	
		String email= req.getParameter("email");		
		String pass=req.getParameter("pass");
				user us=userdao.getUserDao().loging(email, pass);
		if(us!=null)
		{
			HttpSession hs=req.getSession();
			hs.setAttribute("user",us);
			
		}
		else {
			resp.getWriter().print("Invaid email,pass");
		}
		
		
	}
	
	private void regpro(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String email= req.getParameter("email");
		String name= req.getParameter("name");
		String pass=req.getParameter("pass");
		String tables="";
		user us=new user();
		us.setName(name);
		us.setEmail(email);
		us.setPass(pass);
		us.setImages("");
		us.setTables(tables);
		int i=userdao.getUserDao().insert_u(us);
		if(i>0)
		{	
			int j=userdao.getUserDao().id(email);
			if(j>0)
			{	System.err.println(j);
				tables= name+j;	
				us.setTables(tables);
				userdao.getUserDao().create_t(tables);
				int k=userdao.getUserDao().update(j,us);
				if(k>0)
				{
					resp.getWriter().print("Register done");
				}else
				{
					resp.getWriter().print("Register Fail");
				}
				
			}
			
			
			
			
		}
		
		
		

	}
	

	
	
}
