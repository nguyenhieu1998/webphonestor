package DAO;


import java.awt.event.ItemEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import context.DBContext1;
import model.Account;
import model.Cart;
import model.Orders;
import model.Product;
import model.ProductOrders;



public class OrdersDAO {
	Connection conn = null;
	
	
	
	public int insertOrder(Orders d, Cart c) throws Exception{
		LocalDate curDate = LocalDate.now();
		String date = curDate.toString();
		int id = -1;
		try {
			//add order
			conn = DBContext1.getConnection();
			String sql = "insert into shoppingdb.orders(user_mail, order_id, order_status, order_date, order_discount_code, order_address) values(?,?,?,?,?,?)";
			
			String generatedColumns[] = { "order_id" };
			PreparedStatement ps = conn.prepareStatement(sql, generatedColumns);
			ps.setString(1, d.getUserMail());
			ps.setInt(2, d.getOrderId());
			ps.setInt(3, d.getStatus());
			ps.setString(4, date);
			ps.setString(5, d.getDiscount());
			ps.setString(6, d.getAddress());
			
			System.out.println("insert succsess");

			int result = ps.executeUpdate();
			
			if(result == 0) {
				throw new SQLException("Creating order failed");
			}
			

			try (ResultSet generatedKeys = ps.getGeneratedKeys()){
				if(generatedKeys.next()) {
					id = generatedKeys.getInt(1);
				} else {
					throw new SQLException("failed");
				}
			}
			ps.close();
			conn.close();
	
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 
		return id;
		
	}


	public void createOrderdetail(int orderId, ProductOrders p) {
			
			
			conn = DBContext1.getConnection();
			String sql = "insert into shoppingdb.orders_detail(order_id, product_id, amount_product, price_product) value(?,?,?,?)";
			
			try {
				
				PreparedStatement ps = conn.prepareStatement(sql);
				// set parameters for statement
				ps.setInt(1, orderId);
				ps.setInt(2, p.getProductId());
				ps.setInt(3, p.getAmountProduct());
				ps.setFloat(4, p.getPriceProduct());
				
				int rowAffected = ps.executeUpdate();
				System.out.println(rowAffected);
				System.out.println("insert succsess");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	}
	
	
	public void insertAccount(Account a) throws Exception{
		try {
			conn = DBContext1.getConnection();
			String sql = "insert into shoppingdb.account(usr, pwd, role, name, address, phone) value(?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, a.getUsr());
			ps.setString(2, a.getPwd());
			ps.setInt(3, a.getRole());
			ps.setString(4, a.getName());
			ps.setString(5, a.getAddress());
			ps.setString(6, a.getPhone());
			
			ps.executeUpdate();
			System.out.println("insert succsess");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
}
