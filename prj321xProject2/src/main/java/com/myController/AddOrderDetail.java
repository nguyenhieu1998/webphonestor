package com.myController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrdersDAO;
import model.Cart;
import model.ProductOrders;

/**
 * Servlet implementation class AddOrderDetail
 */
@WebServlet("/AddOrderDetail")
public class AddOrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddOrderDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try  (PrintWriter out = response.getWriter()){
			HttpSession session = request.getSession(true);
			
			OrdersDAO dao = new OrdersDAO();
			Cart c = (Cart)session.getAttribute("cart");
			
			ProductOrders p = new ProductOrders(0, 0, 0, 0);

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
