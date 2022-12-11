<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KiKi Mart - Quên mật khẩu</title>
<link href="/user/img/favicon.ico" rel="icon">
<link href="/manager/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/manager/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-success">
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<img src="/user/img/rausach.jpg" class="col-lg-6 d-none d-lg-block" alt="">
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-2">Quên Mật Khẩu?</h1>
										<p class="mb-4">Đừng lo lắng. Chỉ cần bạn nhập email ở
											dưới chúng tôi sẽ gửi mật khẩu cho bạn!</p>
									</div>
									<form:form action="/forgot-password" method="post"
										modelAttribute="forgotPassword" class="user">
										<div class="form-group">
											<form:input path="email"
												cssClass="form-control form-control-user"
												cssErrorClass="form-control form-control-user is-invalid"
												id="exampleInputEmail" aria-describedby="emailHelp"
												placeholder="Nhập địa chỉ email..." />
											<form:errors path="email"
												cssClass="invalid-feedback text-center" element="div" />
										</div>
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Đổi mật
											khẩu</button>
									</form:form>
									<hr>
									<div class="text-center">
										<a class="small" href="/register">Tạo tài khoản!</a>
									</div>
									<div class="text-center">
										<a class="small" href="/login">Đã có tài khoản? Đăng nhập!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
</body>
<!-- Bootstrap core JavaScript-->
<script src="/manager/vendor/jquery/jquery.min.js"></script>
<script src="/manager/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/manager/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/manager/js/sb-admin-2.min.js"></script>
</html>