package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import context.DBContext1;

public class Account {
	private String usr, pwd;
	private int role;
	private String name, address, phone;
	private int check;
	private String message = "";
	
	public Account (Connection conn) {
		this.conn = conn;
	}
	
	public String getMessage() {
		return message;
	}
	
	public Account() {
		
	}
	
	public Account(String usr, String pwd, int role, String name, String address, String phone, int check) {
		this.usr = usr;
		this.pwd = pwd;
		this.role = role;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.check = check;
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}
	
	public boolean validate() {
		if(usr == null) {
			message = "No username set.";
			return false;
		}
		if(pwd == null) {
			message = "No password set";
			return false;
		}
		
		if(!usr.matches("[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$")) {
			message = "invalid syntax";
			return false;
		} else if(!pwd.matches("[a-zA-Z0-9_!@#$%^&*]+")) {
			message = "invalid syntax";
			return false;
		}
		return true;
	}
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Connection conn = null;

	public Account checkLogin(String usr, String pwd) throws SQLException {
		conn = DBContext1.getConnection();
		String sql = "select * from shoppingdb.account where usr = ? and pwd = ?";

		ps = conn.prepareStatement(sql);
		
		ps.setString(1, usr);
		ps.setString(2, pwd);
		
		rs = ps.executeQuery();
		
		System.out.println("Run here !");
		if (rs.next()) {
			// Thay vì dùng index để lấy value column, thì mình dùng label của column cho chắc ăn
			// Bảng account ko có cột thứ 7, sao code chạy dc ta
			
			// cái số 7 thì em nghĩ là cái biến check nhưng mà trong file sql trong bài cho thì ko có nên ko biết dung biến này để checjk cái j
			// Vậy thôi mình bỏ biến check đó đi
			System.out.println("usr: " + rs.getString("usr"));
			System.out.println("pwd:: " + rs.getString("pwd"));
			return new Account(rs.getString("usr"), rs.getString("pwd"), rs.getInt("role"), rs.getString("name"), rs.getString("address"), rs.getString("phone"), 0);
			
		}
		
		return null;
	}
}	
