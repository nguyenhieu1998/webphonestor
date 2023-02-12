package com.myController.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import DAO.ListProductDAO;
import model.Product;


@WebServlet("/ListController")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListController() {
        super();
       
    }

	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null; 
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			ListProductDAO dao = new ListProductDAO();
			List<Product> list = dao.getAllProduct();
			request.setAttribute("products", list);
			out.println("<h2> KICH CO SAN PHAM: " + list.size() + "</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
			System.out.print("Kích co la" + list.size());
			
		} catch (Exception e) {
			Logger.getLogger(ListController.class.getName()).log(Level.SEVERE,null,e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
