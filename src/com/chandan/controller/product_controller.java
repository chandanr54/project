package com.chandan.controller;

import java.io.IOException;
import java.text.NumberFormat.Style;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chandan.Dao.productdao;
import com.chandan.model.product;
import com.chandan.model.user;
@WebServlet("/product")
public class product_controller extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String opt = req.getParameter("opt");

		if (opt != null) {
			int ch = Integer.parseInt(opt);
			switch (ch) {
			case 1:
				addproduct(req,resp);
				break;
			case 2:
				update(req,resp);
				break;
			case 3:
				del(req,resp);
				break;
			case 4:
				getdata(req,resp);
				break;
			case 5:
				download_data(req,resp);
				break;
			} 
		}

	}

	private void download_data(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("application/vnd.ms-excel");
		resp.setHeader("Content-Disposition", "attachment; filename="+"Expence.xls");
		
		List<product> exp=(List<product>)req.getSession(false).getAttribute("list");
		int a=1;
		double tot=0.0;
		resp.getWriter().println("S.No"+"\t"+"ID"+"\t"+"NAME"+"\t"+"PRICE"+"\t"+"QUENTY"+"\t"+"TOTAL PRICE"+"\t"+"CATEGORY"+"\t"+"DATE");
		for(product p:exp)
		{	tot += p.getPrice()*p.getQuntity();
			resp.getWriter().println(a+"\t"+p.getId()+"\t"+p.getName()+"\t"+p.getPrice()+"\t"+p.getQuntity()+"\t"+p.getPrice()*p.getQuntity()+"\t"+p.getCategory()+"\t"+p.getDate());
			a++;
		}
		
		resp.getWriter().println("Total Expence"+"\t"+tot);
	}

	private void getdata(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		reff(req, resp);
		resp.sendRedirect("expencelist.jsp");
		
	}
	
	private void reff(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		user us=(user)req.getSession(false).getAttribute("user");
		List< product> lists=productdao.getUserDao().getdatas(us.getTables());
		double total=0.0;
		for (product p:lists) {
			total += p.getPrice()*p.getQuntity();
			
		}
		req.getSession(false).setAttribute("total",total);
		req.getSession(false).setAttribute("list",lists);
		
	}

	private void del(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		user us=(user)req.getSession(false).getAttribute("user");
		int i=productdao.getUserDao().dels(Integer.parseInt(req.getParameter("id")),us.getTables());
		resp.getWriter().print((i>0)?"Data Delete":" Data Deletion fail");
		reff(req, resp);
	}

	private void update(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException  {
		product pro=new product();
		pro.setId(Integer.parseInt(req.getParameter("id")));
		pro.setName(req.getParameter("name"));
		pro.setPrice(Float.parseFloat( req.getParameter("price")));
		pro.setQuntity(Integer.parseInt(req.getParameter("qty")));
		pro.setDate(req.getParameter("date"));
		pro.setCategory(req.getParameter("cat"));
		
		user us=(user)req.getSession(false).getAttribute("user");
		int i=productdao.getUserDao().updates(pro,us.getTables());
		String msg;
		if (i>0) {
			reff(req, resp);
			msg="Update success";
		}
		else
		{
			msg="Update success";
		}
		resp.getWriter().print(msg);
		
	}

	private void addproduct(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException  {
		product pro=new product();
		pro.setName(req.getParameter("name"));
		pro.setPrice(Float.parseFloat( req.getParameter("price")));
		pro.setQuntity(Integer.parseInt(req.getParameter("qty")));
		pro.setDate(req.getParameter("date"));
		pro.setCategory(req.getParameter("cat"));
		
		user us=(user)req.getSession(false).getAttribute("user");
	///	resp.getWriter().print(pro.getDate()+"\n"+pro.getCategory()+"\n"+pro.getId()+"\n"+pro.getName()+"\n"+pro.getQuntity()+"\n"+pro.getPrice());
		int i=	productdao.getUserDao().insert(pro,us.getTables());
	
		resp.getWriter().print((i>0)?"Data save":" Saving data fail");
		
	}

}
