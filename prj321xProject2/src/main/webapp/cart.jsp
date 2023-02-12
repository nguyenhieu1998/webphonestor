<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css\bootstrap.css">
</head>
<body>
<div class="container">
		<div class="banner">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
 				 <div class="container-fluid">
   					 <a class="navbar-brand" href="#">
     					 <img src="image\logo.png" alt="" width="180" height="36">
   					 </a>
   					 <div class="collapse navbar-collapse" id="navbarSupportedContent">
     					 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       						 <li class="nav-item">
         						 <a class="nav-link active" aria-current="page" href="#" style="padding-left: 25px; padding-right: 25px;"><strong>Giỏ hàng</strong></a>
       						 </li>
       						<li class="nav-item">
         						 <strong><a class="nav-link active" aria-current="page" href="#" style="padding-left: 25px; padding-right: 25px;">Tra cứu đơn hàng</a>
   						     </strong></li>
       						 <li class="nav-item dropdown">
         						 <strong><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="padding-left: 25px; padding-right: 25px;">
          						  Chọn địa điểm quán
         						 </a>
         						 </strong>
         						 <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
           							 <li><strong><a class="dropdown-item" href="#">Hà Nội</a></strong></li>
           							 <li><strong><a class="dropdown-item" href="#">Hồ Chí Minh</a></strong></li>
           							 <li><strong><a class="dropdown-item" href="#">Nam Định</a></strong></li>
         						 </ul>
      						  </li>
    				 	 </ul>
     					 <form class="d-flex">
       						 <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width: 326px;">
       						 <button class="btn btn-outline-success" type="submit">Search</button>
      					</form>
   					 </div>
 				 </div>
			</nav>
		</div>
<!-- phần hiện thị thông tin sản phẩm -->

<section class="h-100 h-custom" style="background-color: white;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-8">
              
                <div class="p-5">
                  <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold mb-0 text-black"></h1>
                    <h6 class="mb-0 text-muted">1 sản phẩm</h6>
                  </div>
            
                  <hr class="my-4">

				<c:forEach var="c" items="${cart.getItems()}">
                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-2 col-lg-2 col-xl-2">
                      <img
                        src="${c.getSrc()}"
                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                 



                      <h6 class="text-muted">${c.getName()}</h6>
                      <h6 class="text-black mb-0">${c.getBrand()}</h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                      <button class="btn btn-link px-2"
                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                        <i class="fas fa-minus"></i>
                      </button>

                      <input id="form1" min="0" name="quantity" value="${c.getNumber()}" type="number"
                        class="form-control form-control-sm" />

                      <button class="btn btn-link px-2"
                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                        <i class="fas fa-plus"></i>
                      </button>
                    </div>
                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                      <h6 class="mb-0">${c.getPrice()}</h6>
                    </div>
                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                      <a href="#!" class="text-muted">
                      
                      <form action="/prj321xProject1/AddToCartController" method="get">
                      <input type="hidden" name="action" value="delete">
        			  <input type="hidden" name="id" value="${c.getId()}">
                      <button type="submit" class="btn btn-light" style="background-color: #dc3545;">Delete</button>
                      </form>
                                            
                      <i class="fas fa-times"></i></a>
                    </div>
                  </div>
                  </c:forEach>
                 
                  <hr class="my-4">
                  <div class="pt-5">
                    <h6 class="mb-0"><a href="/prj321xProject1/home.jsp" class="text-body"><i
                          class="fas fa-long-arrow-alt-left me-2"></i>Trở lại cửa hàng</a></h6>
                  </div>    
                </div>
              </div>
              <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <hr class="my-4">
                <a href="/prj321xProject1/payitem.jsp"><button type="submit" class="btn btn-primary" id="liveToastBtn">Thanh Toán</button></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script type="js\themgiohang.js"></script>
<script type="js\bootstrap.js"></script>
<script type="js\jquery-3.6.0.min.js"></script>
</body>
</html>