package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import context.DBContext1;
import model.Product;

public class ListProductDAO {

	Connection conn = null; // kết nối đến sql
	PreparedStatement ps = null; // ném câu lệnh query sang sql
	ResultSet rs = null; // nhận dữ liệu trả về
	
	// kết nối dữ liệu bảng product và load dữ liệu
	public List<Product> getAllProduct(){
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM shoppingdb.products";
		
		try {
			conn = new DBContext1().getConnection();// mở kết nối đến sql
			System.out.println("Database connected !");
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt("product_id"),
						rs.getString("product_name"),
						rs.getString("product_des"),
						rs.getFloat("product_price"),
						rs.getString("product_img_source"),
						rs.getString("product_brand"),
						rs.getFloat("product_old_price"),
						rs.getString("product_information")));
					
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public Product findById(int id) {
		Product product = null;
		String sql = "select * from shoppingdb.products where product_id = ?";
		try {
			conn = new DBContext1().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			rs = ps.executeQuery();
			if(rs.next()) {
				product = new Product(
						rs.getInt("product_id"),
						rs.getString("product_name"),
						rs.getString("product_des"),
						rs.getFloat("product_price"),
						rs.getString("product_img_source"),
						rs.getString("product_brand"),
						rs.getFloat("product_old_price"),
						rs.getString("product_information"));
			}
			return product;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Product> search(String characters) throws Exception{
		List<Product> list = new ArrayList<>();
		String sql = "Select * from shoppingdb.products where product_name like ?";		
		try {
			conn = new DBContext1().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,"%" + characters + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt("product_id"),
						rs.getString("product_name"),
						rs.getString("product_des"),
						rs.getFloat("product_price"),
						rs.getString("product_img_source"),
						rs.getString("product_brand"),
						rs.getFloat("product_old_price"),
						rs.getString("product_information")));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public static void main(String[] args) throws Exception{
		ListProductDAO dao = new ListProductDAO();
		List<Product> list = dao.search("");
		for(Product o : list) {
			System.out.println(o);
		}
	}
	

	public Product getProduct(String characters) throws Exception{
		Product p = new Product();
		String sql = "Select * from shoppingdb.products where product_id like ?";
		try {
			conn = new DBContext1().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,"%" + characters + "%");
			rs = ps.executeQuery();
			if (rs.next()) {
				p.setId(rs.getInt("product_id"));
				p.setName(rs.getString("product_name"));
				p.setDescription(rs.getString("product_des"));
				p.setPrice(rs.getFloat("product_price"));
				p.setSrc(rs.getString("product_img_source"));
				p.setBrand(rs.getString("product_brand"));
				p.setOldPrice(rs.getFloat("product_old_price"));
				p.setProductInfo(rs.getString("product_information"));
			}
			
			conn.close();
			ps.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return p;
	}

}
