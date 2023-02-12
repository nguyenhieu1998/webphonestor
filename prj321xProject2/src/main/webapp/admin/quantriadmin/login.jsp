<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<meta charset="utf-8">
<head>
    <title>Đăng nhập quản trị | Quản trị Admin</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="admin/quantriadmin/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="admin/quantriadmin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="admin/quantriadmin/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="admin/quantriadmin/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="admin/quantriadmin/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="admin/quantriadmin/css/util.css">
    <link rel="stylesheet" type="text/css" href="admin/quantriadmin/css/main.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>

<body>
<jsp:useBean id="user1" class="model.Account" scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="user1" />
<%
	
	String err = (String)session.getAttribute("error");
	if(err == null){
		err = "";
	}
	
%>
<%
	String username="", password="";
	Cookie[] cookies = request.getCookies();
		if(cookies == null){
			out.println("");
		} else {
			for(Cookie retCookie : cookies){
				if(retCookie.getName().equals("user")){
					username = retCookie.getValue();
				} else if(retCookie.getName().equals("password")){
					password = retCookie.getValue();
				}
			} 
		}

%>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="admin/quantriadmin/images/team.jpg" alt="IMG">
                </div>
                <!--=====TIÊU ĐỀ======-->
				<h2><jsp:getProperty property="message" name="user1" /></h2>
                <form action="/prj321xProject1/LoginController" method="post" class="login100-form validate-form" id="frm123">
                    <span class="login100-form-title">
                        <b>ĐĂNG NHẬP HỆ THỐNG POS</b>
                        
                       
                        <p><%= err %></p>
                    </span>
                   <!--=====FORM INPUT TÀI KHOẢN VÀ PASSWORD======-->
                        <div class="wrap-input100 validate-input">
                        
                            <input class="input100" type="text" placeholder="username" name="usr"
                                id="username" value="<%= username %>" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class='bx bx-user'></i>
                            </span>
                        </div>
                        <div class="wrap-input100 validate-input">
                            <input autocomplete="off" class="input100" type="password" placeholder="password"
                                name="pwd" id="password-field" value="<%= password %>" />
                            <span toggle="#password-field" class="bx fa-fw bx-hide field-icon click-eye"></span>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class='bx bx-key'></i>
                            </span>
                        </div>
						<!-- Remember acc -->
						<div class="rememberme">
							<input type="checkbox" name="remember" >
							<label> Remember Me</label>
						</div>
                        <!--=====ĐĂNG NHẬP======-->
                        <div class="container-login100-form-btn">
                        	
                            <input type="submit" value="Đăng nhập" id="submit" />
                        </div>
                        <!--=====LINK TÌM MẬT KHẨU======-->
                        <div class="text-right p-t-12">
                            <a class="txt2" href="/prj321xProject1/admin/QUANLYNHANVIEN%20VER.2/forgot.jsp">
                                Bạn quên mật khẩu?
                            </a>
                        </div>
                    <!--=====FOOTER======-->
                    <div class="text-center p-t-70 txt2">
                         <i class="far fa-copyright" aria-hidden="true"></i>
                        <script type="text/javascript">document.write(new Date().getFullYear());</script> <a
                            class="txt2" href="https://www.facebook.com/truongvo.vd1503/"> </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--Javascript-->
    <script src="admin/quantriadmin/js/main.js"></script>
    <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
    <script src="admin/quantriadmin/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="admin/quantriadmin/vendor/bootstrap/js/popper.js"></script>
    <script src="admin/quantriadmin/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="admin/quantriadmin/vendor/select2/select2.min.js"></script>
    <script type="text/javascript">
        //show - hide máº­t kháº©u
        function myFunction() {
            var x = document.getElementById("myInput");
            if (x.type === "password") {
                x.type = "text"
            } else {
                x.type = "password";
            }
        }
        $(".click-eye").click(function () {
            $(this).toggleClass("bx-show bx-hide");
            var input = $($(this).attr("toggle"));
            if (input.attr("type") == "password") {
                input.attr("type", "text");
            } else {
                input.attr("type", "password");
            }
        });
    </script>
</body>

</html>