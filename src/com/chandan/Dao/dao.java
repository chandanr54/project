package com.chandan.Dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class dao {
	
		private static Connection link;
		

	public static Connection getconnection(){
		try {
			//Properties properties = new Properties();
			//properties.load(new FileInputStream("/src/conect.properties"));
			Class.forName("com.mysql.jdbc.Driver");
			link = DriverManager.getConnection("jdbc:mysql://localhost:3306/Expence","root","root");
			
			
		} catch (Exception e) {
			System.out.println(e);
			
		}
		return link;

		}
	


}
