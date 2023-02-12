<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css\bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css\home.css">
	<link rel="stylesheet" type="text/css" href="css\bootstrap.min.css">
	<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css" type="text/css">
    <!-- Font awesome -->
    <link rel="stylesheet" type="text/css" href="css\font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css\app.css">
    
</head>
<body>
<jsp:include page="header.jsp" />

<main role="main">
        <!-- Block content - Đục lỗ trên giao diện bố cục chung, đặt tên là `content` -->
        <div class="container mt-4">
            <form class="needs-validation" name="frmthanhtoan" action="/prj321xProject1/PayController" method="get">
                <input type="hidden" name="kh_tendangnhap" value="dnpcuong">

                <div class="py-5 text-center">
                    
                    <h2>Thanh toán</h2>
                    <p class="lead">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>
                </div>
				
                <div class="row">
                    <div class="col-md-4 order-md-2 mb-4">
                    
                    <c:forEach var="c" items="${cart.getItems()}">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            
                            <span class="badge badge-secondary badge-pill">${c.getNumber()}</span>
                        </h4>
                        
                        <ul class="list-group mb-3">
                            <input type="hidden" name="sanphamgiohang[1][sp_ma]" value="2">
                            <input type="hidden" name="sanphamgiohang[1][gia]" value="11800000.00">
                            <input type="hidden" name="sanphamgiohang[1][soluong]" value="2">

                            
                                <div>
                                    <h6 class="my-0">${c.getName()}</h6>
                                    <small class="text-muted">${c.getBrand()}</small>
                                </div>
                                <span class="text-muted">${c.getPrice()}</span>
                            </li>
                            <input type="hidden" name="sanphamgiohang[2][sp_ma]" value="4">
                            <input type="hidden" name="sanphamgiohang[2][gia]" value="14990000.00">
                            <input type="hidden" name="sanphamgiohang[2][soluong]" value="8">
                            
                        </ul>
					</c:forEach>
                    </div>
                    
                    
               <div>
                    <div class="col-md-8 order-md-1">
                        <h4 class="mb-3">Thông tin khách hàng</h4>
						
                        <div class="row">
                            <div class="col-md-12">
                                <label for="kh_ten">Họ tên</label>
                                <input type="text" class="form-control" name="name" value="">
                            </div>
                           
                            <div class="col-md-12">
                                <label for="kh_diachi">Địa chỉ</label>
                                <input type="text" class="form-control" name="address" value="">
                            </div>
                            <div class="col-md-12">
                                <label for="kh_dienthoai">Điện thoại</label>
                                <input type="text" class="form-control" name="phone" value="">
                            </div>
                            <div class="col-md-12">
                                <label for="kh_email">Mã khuyến mại</label>
                                <input type="text" class="form-control" name="discount" value="">
                            </div>
                            <div class="col-md-12">
                                <label for="kh_email">Email</label>
                                <input type="text" class="form-control" name="email" value="">
                            </div>
                        </div>
					
                        <h4 class="mb-3">Hình thức thanh toán</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input" required=""
                                    value="1">
                                <label class="custom-control-label" for="httt-1">Tiền mặt</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required=""
                                    value="2">
                                <label class="custom-control-label" for="httt-2">Chuyển khoản</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="httt-3" name="httt_ma" type="radio" class="custom-control-input" required=""
                                    value="3">
                                <label class="custom-control-label" for="httt-3">Ship COD</label>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button id="btn" class="btn btn-primary btn-lg btn-block" type="submit" value="check out">Đặt hàng</button>
                    </div>
              </div>
                </div>
            </form>

        </div>
        <!-- End block content -->
    </main>




<script type="text/javascript" src="bootstrap.js"></script>
<script type="text/javascript" src="js\bootstrap.min.js"></script>
<script type="text/javascript" src="js\jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$('#btn').on('click', function() {
		Swal.fire(
				  'Good job!',
				  'You have successfully paid',
				  'success'
				)
	})
</script>

</body>
</html>