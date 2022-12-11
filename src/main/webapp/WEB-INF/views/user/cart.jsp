<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KiKiMart - Giỏ hàng</title>
<link href="/user/img/favicon.ico" rel="icon">
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
						class="breadcrumb-item active">Giỏ hàng</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Cart Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5">
				<table
					class="table table-light table-borderless table-hover text-center mb-0">
					<thead class="thead-dark">
						<tr>
							<th>Sản phẩm</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Tổng</th>
							<th>Xóa</th>
						</tr>
					</thead>
					<tbody class="align-middle">

						<c:forEach var="item" items="${cart.items}">
							<form action="/cart/update/${item.id}" method="post">
								<input type="hidden" name="id" value="${item.id}">
							<tr>
								<td class="align-middle"><img src="/upload/${item.image}"
									alt="" style="width: 50px;"> <a
									href="/shop/detail/${item.id}">${item.name}</a></td>
								<td class="align-middle"><fmt:formatNumber type="number"
										pattern="###,###,###" value="${item.price}" /> VNĐ</td>
								<td class="align-middle">
									<div class="input-group quantity mx-auto" style="width: 100px;">
										<div class="input-group-btn">
											<button class="btn btn-sm btn-primary btn-minus">
												<i class="fa fa-minus"></i>
											</button>
										</div>
										<input type="text" name="quality"
											class="form-control form-control-sm bg-secondary border-0 text-center"
											value="${item.quality}">
										<div class="input-group-btn">
											<button class="btn btn-sm btn-primary btn-plus">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</td>
								<td class="align-middle"><fmt:formatNumber type="number"
										pattern="###,###,###" value="${item.price * item.quality}" />
									VNĐ</td>
								<td class="align-middle"><a href="/cart/remove/${item.id}"
									class="btn btn-sm btn-danger"> <i class="fa fa-times"></i>
								</a></td>
							</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
				<form class="mb-30" action="">
					<div class="input-group">
						<input type="text" class="form-control border-0 p-4"
							placeholder="Mã Giảm Giá">
						<div class="input-group-append">
							<button class="btn btn-primary">Áp Dụng</button>
						</div>
					</div>
				</form>
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Hóa đơn</span>
				</h5>
				<div class="bg-light p-30 mb-5">
					<div class="border-bottom pb-2">
						<div class="d-flex justify-content-between mb-3">
							<h6>Tạm tính</h6>
							<h6>
								<fmt:formatNumber type="number" pattern="###,###,###"
									value="${total}" /> VNĐ
							</h6>
						</div>
<!-- 						<div class="d-flex justify-content-between mb-3">
							<h6 class="font-weight-medium">Tiền ship</h6>
							<h6 class="font-weight-medium">30.000 VNĐ</h6>
						</div> -->
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Giảm giá</h6>
							<h6 class="font-weight-medium">0 VNĐ</h6>
						</div>
					</div>
					<div class="pt-2">
						<div class="d-flex justify-content-between mt-2">
							<h5>Tổng cộng</h5>
							<h5><fmt:formatNumber type="number" pattern="###,###,###"
									value="${total}" /> VNĐ</h5>
						</div>
						<a href="/shop/checkout"
							class="btn btn-block btn-primary font-weight-bold my-3 py-3">Tiến
							Hành Đặt Hàng</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart End -->


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
	<script type="text/javascript">
		function check2(u) {
			if (u == true) {
				$("#exampleModal").modal("show");
			}
		}
	</script>
</body>
</html>