package com.chandan.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.chandan.model.user;






public class userdao {
	private static userdao usd=new userdao();
	private userdao()
	{
		
	}
	
	public static  userdao getUserDao() {
		return usd;
		
	}
	//insert user
public int  insert_u(user us) {
	int i=0;	
	try(Connection con=dao.getconnection();) {
		
		PreparedStatement ps=con.prepareStatement("insert into user values(default,?,?,?,?,?)");
		ps.setString(1,us.getName());
		ps.setString(2,us.getEmail());
		ps.setString(3,us.getPass());
		ps.setString(4,us.getTables());
		ps.setString(5,us.getImages());
		i=ps.executeUpdate();
		
		
	} catch (Exception e) {
		System.out.println(e+"insert");
	}
	
	return i;
	
}

public int  id( String email) {
	int j=0;
	try(Connection con=dao.getconnection();){
		PreparedStatement sp=con.prepareStatement("select * from user where email=?");
		sp.setString(1,email);
		ResultSet rs=sp.executeQuery();
		if(rs.next())
		{
			j=rs.getInt(1);
		}
		
	} catch (Exception e) {
		System.out.println(e+"iddao");
	}
	return j;
	
	
}
 
public user loging(String email, String pass)
 {
	 user us=null;
	
	 try (Connection con=dao.getconnection();){
	
		 PreparedStatement ps= con.prepareStatement("select * from user where name=? and pass=?");
	
		 ps.setString(1,email);
		 ps.setString(2,pass);
		 
		 ResultSet rs=ps.executeQuery();
		 if(rs.next())
		 { us=new user();
		 	us.setId(rs.getInt(1));
			 us.setName(rs.getString(2));
			 us.setEmail(rs.getString(3));
			 us.setPass(rs.getString(4));
			 us.setTables(rs.getString(5));
			 us.setImages(rs.getString(6));
			 
		 }
		
	} catch (Exception e) {
		System.out.println(e+"loging");
	}
	
	 return us;
	 
 }

public int update(int i, user us) {
	int ch=0;
	try(Connection con=dao.getconnection();){
		 PreparedStatement ps= con.prepareStatement("update user set  tables=? where id=? ");
		 ps.setString(1,us.getTables());
		 ps.setInt(2, i);
		 ch=ps.executeUpdate();
	} catch (Exception e) {
		System.err.println(e+"update");
	}
	return ch;
	
}

public void create_t(String tables) {
	try(Connection con=dao.getconnection();){
		 PreparedStatement ps= con.prepareStatement("create table "+tables+"(id int NOT NULL AUTO_INCREMENT,name varchar(20),price float,cate varchar(20),date varchar(30),qunty int, primary key(id)) ");
		 ps.executeUpdate();
		 
	} catch (Exception e) {
		System.err.println(e+"creat table");
	}
	
}


public int updates(String name,String pass,int id ) {
	int i=0;
try(Connection con=dao.getconnection();) {
		
		PreparedStatement ps=con.prepareStatement("update user set  name=? and pass=? where id=? ");
		 ps.setString(1,name);
		 ps.setString(2,pass);
		 ps.setInt(3, id);
		i=ps.executeUpdate();
		
		
	} catch (Exception e) {
		System.out.println(e+"insert");
	}
	return i;
	
	
}

}
