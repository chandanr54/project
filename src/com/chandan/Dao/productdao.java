package com.chandan.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.chandan.model.product;





public class productdao {
	private static productdao product=new productdao();
	private productdao()
	{
		
	}
	
	public static  productdao getUserDao() {
		return product;
		
	}

	public int insert(product pro, String table) {
		int i=0;
		try(Connection con=dao.getconnection();) {
			
			PreparedStatement ps=con.prepareStatement("insert into "+table+" values(default,?,?,?,?,?)");
			ps.setString(1,pro.getName());
			ps.setFloat(2,pro.getPrice());
			ps.setString(3, pro.getCategory());
			ps.setString(4, pro.getDate());
			ps.setInt(5, pro.getQuntity());
			
			
			i=ps.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e+"insert product doa");
		}
		
		return i;
		
		
	}

	public List<product> getdatas(String tables) {
		List<product> exp=new ArrayList<>();
		try (Connection con = dao.getconnection();) {

			PreparedStatement ps = con.prepareStatement("select * from "+tables+"");
			ResultSet rs= ps.executeQuery();
			while (rs.next()) {
				product exps=new product();
				exps.setId(rs.getInt(1));
				exps.setName(rs.getString(2));
				exps.setPrice(rs.getFloat(3));
				exps.setCategory(rs.getString(4));
				exps.setDate(rs.getString(5));
				exps.setQuntity(rs.getInt(6));
				
				exp.add(exps);
			}
			

		} catch (Exception e) {
			System.out.println(e + "insert product doa");
		}
		return exp;
		
		
	}

	public int updates(product pro, String tables) {
		int i=0;
		try(Connection con=dao.getconnection();) {
			
			PreparedStatement ps=con.prepareStatement("update "+tables+" set name=?,price=?,cate=?,date=?,qunty=? where id=?" );
			ps.setString(1,pro.getName());
			ps.setFloat(2,pro.getPrice());
			ps.setString(3, pro.getCategory());
			ps.setString(4, pro.getDate());
			ps.setInt(5, pro.getQuntity());
			ps.setInt(6, pro.getId());
			
			
			i=ps.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e+"update product doa");
		}
		
		return i;
		
		
	}

	public int dels(int id, String tables) {
		int i=0;
		
try(Connection con=dao.getconnection();) {
			
			PreparedStatement ps=con.prepareStatement("delete from "+tables+" where id=?" );
			ps.setInt(1,id);			
			i=ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e+"dele product doa");
		}
		
		return i;
	}

}
	