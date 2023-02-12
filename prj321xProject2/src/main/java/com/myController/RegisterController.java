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
import model.Account;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try (PrintWriter out = response.getWriter()){
			HttpSession session = request.getSession(true);
			OrdersDAO dao = new OrdersDAO();
			
			
			String user =  request.getParameter("user");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			
			Account a = new Account(user, password, 1, name, address, password, 1);
			dao.insertAccount(a);
			
			System.out.println("username: " + user);
			System.out.println("address: " + name);
			System.out.println("discount: " + password);
			System.out.println("phoneNumber: " + phone);
			System.out.println("phoneNumber: " + address);
			response.sendRedirect("/prj321xProject1/LoginController");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().println(e);
 			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
