package com.myController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.parser.Cookie;

import com.myController.product.ListController;
import com.sun.jdi.Value;

import DAO.ListProductDAO;
import model.Account;
import model.Product;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TEST listproduc
		
		request.getRequestDispatcher("admin/quantriadmin/login.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequerst(request, response);
	}

	protected void processRequerst(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		try {
			request.getSession(true).invalidate();
			//make sure that email is valid
			String regexMail = "[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			//collect data from a login form
			String user = request.getParameter("usr");
			String password = request.getParameter("pwd");
			
			Account acc = new Account();
			acc.setName(user);
			acc.setPwd(password);
			
			HttpSession session = request.getSession(true);
			if(!password.matches(regex) || !user.matches(regexMail)) {
				session.setAttribute("error", "invalid syntax");
				System.out.println("invalid syntax");
				response.sendRedirect("/prj321xProject1/LoginController");
				return;
			}
			//read information of account in web.xml
			String uid = getServletContext().getInitParameter("username");
			String pwd = getServletContext().getInitParameter("password");
			//check account - use validate code in ASM1 to valid user
			System.out.println("pwd: " + pwd + " / pass: " + acc.getPwd());
			System.out.println("username: " + uid + " / username: " + acc.getName());
			
			if(acc.checkLogin(acc.getName(), acc.getPwd()) != null) {
				// set session
				session.setAttribute("user", user);
				// save cookie
				if(request.getParameter("remember") != null) {
				javax.servlet.http.Cookie userCookie = new javax.servlet.http.Cookie("user", user);	
				userCookie.setMaxAge(300);
				response.addCookie(userCookie);
				
				javax.servlet.http.Cookie passCookie = new javax.servlet.http.Cookie("password", password);
				passCookie.setMaxAge(300);
				response.addCookie(passCookie);
				}
				// login is valid, now redirect to index page of admin
				response.sendRedirect("/prj321xProject1/ListController");
			}
			else {
				session.setAttribute("error", "wrong username or password");
				response.sendRedirect("/prj321xProject1/LoginController");
			}
			
		} catch(NullPointerException e) {
			System.out.println(e.getMessage());
		} catch(Exception ex) {
			ex.printStackTrace();
			response.getWriter().println(ex);
		}
	}
}
