<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Admin - User Table</title>
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="/manager/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/manager/css/sb-admin-2.min.css">
</head>
</head>
<body id="page-top">
	<div id="wrapper">

		<%@include file="slidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<%@include file="navbar.jsp"%>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Danh Sách Đơn Hàng Đang chờ</h1>
					<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Bảng danh sách</h6>
						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-lg-8 mb-3">
									<a href="/admin/order/wait" class="btn btn-primary"> <i
										class="fas fa-step-backward"></i> Trở lại
									</a>
								</div>							
							</div>
							<table class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>STT</th>
										<th>Người đặt</th>
										<th>Người nhận</th>
										<th>Địa chỉ</th>
										<th>Tên sản phẩm</th>
										<th>Số lượng</th>
									
										<th>Giá</th>
										<th>PT Thanh toán</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>STT</th>
										<th>Người đặt</th>
										<th>Người nhận</th>
										<th>Địa chỉ</th>
										<th>Tên sản phẩm</th>
										<th>Số lượng</th>
								
										<th>Giá</th>
										<th>PT Thanh toán</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="item" items="${orderDetail}">
										<tr>
											<td>${location = location + 1}</td>
											<td>${item.address.user.email}</td>
											<td>${item.address.firstname} ${item.address.lastname}</td>
											<td>${item.address.address}</td>
											<td>${item.product.name}</td>
											<td>${item.quality}</td>
											
											<td><fmt:formatNumber type="number"
													pattern="###,###,###" value="${item.product.price}" /></td>
											<td>${item.method?'Chuyển khoản':'Tiền mặt'}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
			<%@include file="footer.jsp"%>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

</body>
<script src="/manager/vendor/jquery/jquery.min.js"></script>
<script src="/manager/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/manager/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/manager/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/manager/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/manager/js/demo/chart-area-demo.js"></script>
<script src="/manager/js/demo/chart-pie-demo.js"></script>
</html>