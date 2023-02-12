<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="css\header.css">

<div class="banner">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
 				 <div class="container-fluid">
   					 <a class="navbar-brand" href="/prj321xProject1/ListController">
     					 <img src="image\logo.png" alt="" width="180" height="36">
   					 </a>
   					 <div class="collapse navbar-collapse" id="navbarSupportedContent">
     					 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       						 <li class="nav-item">
         						 <a class="nav-link active" aria-current="page" href="" style="padding-left: 25px; padding-right: 25px;"><strong>Giỏ hàng</strong></a>
       						 </li>
       						<li class="nav-item">
         						 <a class="nav-link active" aria-current="page" href="#" style="padding-left: 25px; padding-right: 25px;"><strong>Tra cứu đơn hàng</strong></a>
   						   </li>
   						   <%
   						   String uString = (String) session.getAttribute("user");
   						   %>
   						   <%if(session.getAttribute("user") == null) { %>
       						 <li class="nav-item dropdown">
         						 <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="padding-left: 25px; padding-right: 25px;">
       						     <strong>Tài Khoản</strong></a>
         						 <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
       							   <li><a class="dropdown-item" href="/prj321xProject1/register.jsp"><strong>Register</strong></a></li>
           						   <li><a class="dropdown-item" href="/prj321xProject1/LoginController"><strong>Login</strong></a></li>
       						   </ul>
   						   </li>
   						   <%} else { %>
		   						   <li class="nav-item dropdown">
		         						 <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="padding-left: 25px; padding-right: 25px;">
		       						     <strong><%= uString %></strong></a>
		         						 <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		       							   <li><a class="dropdown-item" href="/prj321xProject1/LogoutServlet"><strong>Logout</strong></a></li>
		           						   
		       						   </ul>
		   						   </li>
   						   <% } %>
    				 	 </ul>
    				 	 
     					 <form class="d-flex" action="/prj321xProject1/SearchController" method="post">
       						 <input name="txt" type="text" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width: 326px;">
       						 <button class="btn btn-outline-success" type="submit">Search</button>
      					</form>
   					 </div>
 				 </div>
			</nav>
		</div>
