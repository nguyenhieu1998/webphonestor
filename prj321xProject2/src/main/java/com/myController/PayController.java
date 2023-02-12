package com.myController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ListProductDAO;
import DAO.OrdersDAO;
import model.Cart;
import model.Orders;
import model.Product;
import model.ProductOrders;


@WebServlet("/PayController")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try (PrintWriter out = response.getWriter()){
			HttpSession session = request.getSession(true);
			
			if(session.getAttribute("cart") == null) {
				
			}
			System.out.println("aaaaaa");
			OrdersDAO dao = new OrdersDAO();
			Cart c = (Cart)session.getAttribute("cart");
			String username = request.getParameter("name");
			String address = request.getParameter("address");
			String discount = request.getParameter("discount");
			String phoneNumber = request.getParameter("phone");
			Orders d = new Orders(username, 2, discount, address, phoneNumber, null);
			int orderId = dao.insertOrder(d, c);
			
			List<Product> products = new ArrayList<Product>();
			ListProductDAO listProductDAO = new ListProductDAO();
			System.out.print("Cart size = " + c.getItems().size());
			for (Product product : c.getItems()) {
				products.add(listProductDAO.findById(product.getId()));
				ProductOrders p = new ProductOrders(orderId, product.getId(), 1, product.getPrice());
				System.out.print("Create Order Detail with order id = " + orderId);
				dao.createOrderdetail(orderId, p);
			}
				
			
			System.out.println("username: " + username);
			System.out.println("address: " + address);
			System.out.println("discount: " + discount);
			System.out.println("phoneNumber: " + phoneNumber);
			
			response.sendRedirect("/prj321xProject1/ListController");
			
 		} catch (Exception e) {
 			response.getWriter().println(e);
 			e.printStackTrace();
		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
