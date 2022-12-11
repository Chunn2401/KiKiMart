<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="/user/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/user/lib/animate/animate.min.css" rel="stylesheet">
<link href="/user/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/user/css/style.css" rel="stylesheet">
</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="/index">Trang chủ</a> <span
						class="breadcrumb-item active">Thanh toán</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Checkout Start -->
	<form:form action="/shop/checkout" method="post"
		modelAttribute="addressForm">
		<div class="container-fluid">
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Địa Chỉ Giao Hàng</span>
					</h5>
					<div class="bg-light p-30 mb-5">

						<div class="row">
							<div class="col-md-6 form-group">
								<label>Họ</label>
								<form:input path="firstname" cssClass="form-control"
									cssErrorClass="form-control is-invalid" placeholder="Họ" />
								<form:errors path="firstname" cssClass="invalid-feedback"></form:errors>
							</div>
							<div class="col-md-6 form-group">
								<label>Tên</label>
								<form:input path="lastname" cssClass="form-control"
									cssErrorClass="form-control is-invalid" placeholder="Tên" />
								<form:errors path="lastname" cssClass="invalid-feedback"></form:errors>
							</div>
							<div class="col-md-6 form-group">
								<label>E-mail</label>
								<form:input path="email" cssClass="form-control"
									cssErrorClass="form-control is-invalid"
									placeholder="Nhập Email vd: example@gmail.com *" />
								<form:errors path="email" cssClass="invalid-feedback"></form:errors>
							</div>
							<div class="col-md-6 form-group">
								<label>Số điện thoại</label>
								<form:input path="phone" cssClass="form-control"
									cssErrorClass="form-control is-invalid"
									placeholder="Nhập số điện thoại *" />
								<form:errors path="phone" cssClass="invalid-feedback"></form:errors>
							</div>
							<div class="col-md-6 form-group">
								<label>Tỉnh/Thành Phố</label>
								<form:input path="provincial" cssClass="form-control"
									cssErrorClass="form-control is-invalid"
									placeholder="Nhập Tỉnh/Thành phố *" />
								<form:errors path="provincial" cssClass="invalid-feedback"></form:errors>
							</div>
							<div class="col-md-6 form-group">
								<label>Địa chỉ</label>
								<form:input path="address" cssClass="form-control"
									cssErrorClass="form-control is-invalid"
									placeholder="Nhập địa chỉ *" />
								<form:errors path="address" cssClass="invalid-feedback"></form:errors>
							</div>
						</div>

					</div>
				</div>
				<div class="col-lg-4">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Hóa Đơn Chi Tiết</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="border-bottom">
							<h6 class="mb-3">Sản Phẩm</h6>
							<c:forEach var="item" items="${cart.items}">
								<div class="d-flex justify-content-between">
									<p>${item.name} (${item.quality})</p>
									<p>
										<fmt:formatNumber type="number" pattern="###,###,###"
											value="${item.price}" />
										VNĐ
									</p>
								</div>
							</c:forEach>
						</div>
						<div class="border-bottom pt-3 pb-2">
							<div class="d-flex justify-content-between mb-3">
								<h6>Tạm tính</h6>
								<h6>
									<fmt:formatNumber type="number" pattern="###,###,###"
										value="${total}" />
									VNĐ
								</h6>
							</div>
							<div class="d-flex justify-content-between mb-3">
								<h6 class="font-weight-medium">Khuyến mãi</h6>
								<h6 class="font-weight-medium">0 VNĐ</h6>
							</div>
							<div class="d-flex justify-content-between">
								<h6 class="font-weight-medium">Phí Ship</h6>
								<h6 class="font-weight-medium">30.000 VNĐ</h6>
							</div>
						</div>
						<div class="pt-2">
							<div class="d-flex justify-content-between mt-2">
								<h5>Tổng</h5>
								<h5>
									<fmt:formatNumber type="number" pattern="###,###,###"
										value="${total+30000}" />
									VNĐ
								</h5>
							</div>
						</div>
					</div>
					<div class="mb-5">
						<h5 class="section-title position-relative text-uppercase mb-3">
							<span class="bg-secondary pr-3">Thanh toán</span>
						</h5>
						<div class="bg-light p-30">
							<div class="form-group">
								<div class="custom-control custom-radio">
									<!-- <input type="radio" class="custom-control-input" name="payment"
										id="directcheck" value="0"> -->
									<form:radiobutton path="payment" value="0"
										class="custom-control-input" id="directcheck"/>
									<label class="custom-control-label" for="directcheck">Thanh toán khi nhận hàng</label>

								</div>
							</div>
					
							<!-- <button type="submit" formaction="/shop/checkout"
							class="btn btn-block btn-primary font-weight-bold py-3"
							formmethod="post">Đặt Hàng</button> -->
							<button type="submit"
								class="btn btn-block btn-primary font-weight-bold py-3">Đặt
								Hàng</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<!-- Checkout End -->


	<%@include file="footer.jsp"%>

	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="/user/lib/easing/easing.min.js"></script>
	<script src="/user/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="/user/mail/jqBootstrapValidation.min.js"></script>
	<script src="/user/mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="/user/js/main.js"></script>
</body>
</html>