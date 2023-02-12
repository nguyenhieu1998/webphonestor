package com.myController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;



import DAO.ListProductDAO;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class AddToCartController
 */
@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }
    public String getServletInfo() {
		// TODO Auto-generated method stub
		return null; 
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()){
			
			HttpSession session = request.getSession(true);
			String idd = request.getParameter("id");
			String action = request.getParameter("action");
			System.out.println("Action: " + action);
			if(action != null &&  action.equalsIgnoreCase("add")) {
				System.out.println("Execute !");
				
				if(session.getAttribute("cart") == null) {
					session.setAttribute("cart", new Cart());
				}
				
				int id = Integer.parseInt(idd);
				Product p = new ListProductDAO().getProduct(""+ id);
				System.out.println("ID added into cart : " + p.getId());
				Cart c = (Cart) session.getAttribute("cart");
				c.add(new Product(
						p.getId(),p.getName(),
						p.getDescription(),
						p.getPrice(),
						p.getSrc(),
						p.getBrand(),
						p.getOldPrice(),
						p.getProductInfo()));
				System.out.println("Cart size: " + c.getItems().size());
				session.setAttribute("cart", c);
			} else if (action.equalsIgnoreCase("delete")) {
				// Khi nhấn nút delete, form sẽ gủi id lên servlet
				// servlet nhận request (có cả id)
				// Sau đó xóa sản phẩm ra khỏi giỏ hàng bằng id
				// Rồi refresh lại trang
				System.out.println("ID deleted : " + idd);
				Cart c = (Cart) session.getAttribute("cart");
				c.remove(Integer.parseInt(idd));
//				response.sendRedirect("/prj321xProject1/cart.jsp");
			}
			response.sendRedirect("cart.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println(e);
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
