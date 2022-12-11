<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KiKi Mart - Đăng ký</title>
<link href="/user/img/favicon.ico" rel="icon">
<!-- Custom fonts for this template-->
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

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<img src="/user/img/rausach.jpg" class="col-lg-5 d-none d-lg-block" alt="">

					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Đăng Ký</h1>
							</div>
							<form:form action="/register/check" modelAttribute="userRegister"
								method="post" class="user">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:input path="fullname"
											cssClass="form-control form-control-user"
											cssErrorClass="form-control form-control-user is-invalid"
											id="exampleFirstName" placeholder="Họ tên" />
										<!-- <div class="invalid-feedback text-center">
                                            Vui lòng nhập họ tên!
                                        </div> -->
										<form:errors path="fullname"
											cssClass="invalid-feedback text-center" />
									</div>
									<div class="col-sm-6">
										<form:input path="code"
											cssClass="form-control form-control-user"
											cssErrorClass="form-control form-control-user is-invalid"
											id="exampleLastName" placeholder="Mã xác thực" />
										<!-- <div class="invalid-feedback text-center">
                                            Vui lòng nhập mã xác thực!
                                        </div> -->
										<form:errors path="code"
											cssClass="invalid-feedback text-center" />
									</div>
								</div>
								<div class="form-group">
									<!-- <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button"
                                            id="exampleInputEmail">Button</button>
                                    </div> -->
									<div class="input-group is-invalid mb-3">
										<form:input path="email"
											cssClass="form-control form-control-user"
											cssErrorClass="form-control form-control-user is-invalid"
											placeholder="Nhập địa chỉ email"
											aria-label="Recipient's username"
											aria-describedby="button-addon2" />
										<div class="input-group-append">
											<button type="button" data-toggle="modal"
												data-target="#exampleModal"
												class="btn btn-outline-secondary btn-user"
												id="button-addon2">Gửi</button>
										</div>
									</div>
									<form:errors path="email"
										cssClass="invalid-feedback text-center" />
								</div>

								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true"
									style="border-radius: 0;">
									<div class="modal-dialog" style="border-radius: 0;">
										<div class="modal-content" style="border-radius: 0;">
											<div class="modal-header">
												<h5 class="modal-title text-danger" id="exampleModalLabel">Thông
													báo</h5>
												<!-- <button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button> -->
											</div>
											<div class="modal-body">Đường dẫn làm mới mật khẩu đã
												được gửi qua email của bạn. Vui lòng check email!</div>
											<div class="modal-footer">
												<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal" style="border-radius: 0;">Đóng</button> -->
												<button type="submit" formaction="/register/mailSender"
													class="btn btn-primary" style="border-radius: 0;">Xác
													nhận</button>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:password path="password"
											value="${userRegister.password}"
											cssClass="form-control form-control-user"
											cssErrorClass="form-control form-control-user is-invalid"
											id="exampleInputPassword" placeholder="Mật khẩu" />
										<form:errors path="password"
											cssClass="invalid-feedback text-center" />
									</div>
									<div class="col-sm-6">
										<form:password path="confirm" value="${userRegister.confirm}"
											cssClass="form-control form-control-user"
											cssErrorClass="form-control form-control-user is-invalid"
											id="exampleRepeatPassword" placeholder="Xác nhận mật khẩu" />
										<form:errors path="confirm"
											cssClass="invalid-feedback text-center" />
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-user btn-block">
									Đăng ký</button>
								<hr>
								<a href="" class="btn btn-google btn-user btn-block"> <i
									class="fab fa-google fa-fw"></i> Đăng ký với Google
								</a>
								<a href="" class="btn btn-facebook btn-user btn-block"> <i
									class="fab fa-facebook-f fa-fw"></i> Đăng ký với Facebook
								</a>
							</form:form>
							<hr>
							<div class="text-center">
								<a class="small" href="/forgot-password">Quên mật khẩu?</a>
							</div>
							<div class="text-center">
								<a class="small" href="/login">Bạn đã có tài khoản? Đăng
									nhập!</a>
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