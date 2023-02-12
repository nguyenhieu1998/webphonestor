<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css\bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css\home.css">
	<link rel="stylesheet" type="text/css" href="css\bootstrap.min.css">
    
</head>
<body>
	<div class="container">
	
		<jsp:include page="header.jsp" />
	
		
		<div class= "container-fluid">
        		 <div class= "row">
            		<div class ="col-2 primary">
             			 <div id="menu">
                         <ul>
                         <li><a href=""> <strong>Cửa Hàng</strong></a></li>
                         <li><a href=""> <strong>Sản Phẩm</strong></a></li>
                         <li><a href=""> <strong>Liên Hệ</strong></a></li>
                         <li><a href=""> <strong>FAQS</strong></a></li>
                         <li><a href=""> <strong>Điện thoại</strong></a></li>
                         <li><a href=""> <strong>Laptop</strong></a></li>
                         <li><a href=""> <strong>Đồng hồ</strong></a></li>
                         <li><a href=""> <strong>Phụ kiện</strong></a></li>
                         </ul>
                         </div>
           			 </div>
            		<div class ="col-7 bg-white" style="height: 400px;">
               			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  							<div class="carousel-indicators">
   								 <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
   								 <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
   								 <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
   								  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
 							 </div>
  							<div class="carousel-inner">
    							<div class="carousel-item active">
      								<img src="image\slide1.png" class="d-block w-100" alt="..."  style="width: 732px; height: 400px;">
   								 </div>
    							<div class="carousel-item" >
     						 		<img src="image\slide2.jpg" class="d-block w-100" alt="..."  style="width: 732px; height: 400px;">
    							</div>
   								 <div class="carousel-item">
     								 <img src="image\slide3.jpg" class="d-block w-100" alt="..."  style="width: 732px; height: 400px;">
   								 </div>
   								 <div class="carousel-item">
     								 <img src="image\slide4.jpg" class="d-block w-100" alt="..."  style="width: 732px; height: 400px;">
   								 </div>
 							 </div>
 							 <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
   							 	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
   								 <span class="visually-hidden">Previous</span>
 							 </button>
 							 <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
   								 <span class="carousel-control-next-icon" aria-hidden="true"></span>
  								  <span class="visually-hidden">Next</span>
  							</button>
			       		</div>
			       	</div>
           			 <div class ="col-3 bg-white">
              			 <img src="image\qc1.jpg" style="height: 120px; width: 310px;">
              			  <img src="image\qc2.jpg" style="height:120px; width: 310px; margin-top: 20px;">
              			  <img src="image\qc3.jpg" style="height:120px; width: 310px; margin-top: 20px;">
           			 </div>
         		</div>
      	</div>
        <div class="banner">
      		<img src="image/banner1.webp" alt="" style="width: 1160px; margin-top:20px;">
      	</div>
      	<div class="main" style="margin-top: 40px;">
      		<div class= "container-fluid">
      		<!-- --------- -->
   				<div class= "row">
   					 <div class="box-title_title bg-light text-center" >
   					 	<h2><img src="image\logo2.png" style="height:30px;"><strong>Apple Store(N T H)</strong></h2>
   					 </div>
   					
   					 <c:forEach var="o" items="${products}">
     					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href="${o.productInfo}"><img src="${o.src}" style="width: 200px; height:200px;" alt="iphone13"></a>
        					 			<h4>${o.name}</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>${o.oldPrice}</s>
        					 				<br><span class="giamoi">${o.price}</span>
        					 			</p>
        					 		</div>
        					 		<form action="AddToCartController?action=add&id=${o.id}" method="get">
        					 		<input type="hidden" name="action" value="add">
        					 		<input type="hidden" name="id" value="${o.id}">
                        			<button type="submit" class="btn btn-danger">Add Cart</button>
           							</form>
        					 		<a href="${o.productInfo}"><button type="submit" class="btn btn-light">Buying</button></a>
        					
        					 </div>
    					  </div>
    					 </c:forEach>
    					  
    				</div>
    				
    						<nav aria-label="Page navigation example" style="margin-top:20px">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
					
      	</div>
      	<div class= "container-fluid">
   				<div class= "row">
   					 <div class="box-title_title bg-light text-center" >
   					 	<h2><img src="image\samsung.png" style="height:50px;"></h2>
   					 </div>
     					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href=""><img src="image\a03s.jpg" style="width: 200px; height:200px;" alt="iphone13"></a>
        					 			<h4>SamSung Galaxy A03   </h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>24.990.000 ₫</s>
        					 				<br><span class="giamoi">23.490.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>
     					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href=""><img src="image\a12.jpg" style="width: 200px; height:200px;" alt="iphone11"></a>
        					 			<h4>SamSung Galaxy A12</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>18.000.000 ₫</s>
        					 				<br><span class="giamoi">16.000.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>

    					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href=""><img src="image\zfold3.jpg" style="width: 200px; height:200px;" alt="iphone12"></a>
        					 			<h4>SamSung Z Fold 3</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>22.990.000 ₫</s>
        					 				<br><span class="giamoi">19.490.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>
     					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href=""><img src="image\f20fe.jpg" style="width: 200px; height:200px;" alt="iphonex"></a>
        					 			<h4>SamSung  S20 FE</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>11.990.000 ₫</s>
        					 				<br><span class="giamoi">9.490.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>
    					  <hr style="margin-top: 15px;">

     					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href="#"><img src="image\zflip.webp" style="width: 200px; height:200px;" alt="samsung"></a>
        					 			<h4>SamSung Galaxy Z Flip</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>40.990.000 ₫</s>
        					 				<br><span class="giamoi">36.490.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>
     					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href="#"><img src="image\sss1.jpg" style="width: 200px; height:200px;" alt="iphone11"></a>
        					 			<h4>SamSung S20 Ultra</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>30.000.000 ₫</s>
        					 				<br><span class="giamoi">25.000.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>

    					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href="#"><img src="image\ssn1.jpg" style="width: 200px; height:200px;" alt="iphone12"></a>
        					 			<h4>SamSung  Note 20Ultra</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>34.990.000 ₫</s>
        					 				<br><span class="giamoi">21.490.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>
     					 <div class ="col-md-3 col-sm-6 col-xs-6 wow fadeInUp" style="margin-top:20px;">
        					 <div class="item-product text-center">
        					 		<div class="image">
        					 			<a href="#"><img src="image\a52s.webp" style="width: 200px; height:200px;" alt="iphonex"></a>
        					 			<h4>iphone 8 Plus</h4>
        					 		</div>
        					 		<div class="price-c">
        					 			<p class="price"><s>11.990.000 ₫</s>
        					 				<br><span class="giamoi">8.490.000 ₫</span>
        					 			</p>
        					 		</div>
        					 		<a href=""><button type="button" class="btn btn-danger">Mua hàng</button></a>
        					 		<a href=""><button type="button" class="btn btn-light">Sản phẩm</button></a>
        					 </div>
    					  </div>
    				</div>
    				
    						<nav aria-label="Page navigation example" style="margin-top:20px">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
</div>
<%@ include file="footer.jsp" %>
<script type="text/javascript" src="bootstrap.js"></script>
<script type="text/javascript" src="js\bootstrap.min.js"></script>
<script type="text/javascript" src="js\jquery-3.6.0.min.js"></script>
</body>
</html>