<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div
			class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
			<div class="col-lg-4">
				<a href="/index" class="text-decoration-none"> <span
					class="h1 text-info bg-light px-2">KiKi Mart</span>
				</a>
			</div>
			<div class="col-lg-4 col-6 text-left">
				<form action="">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Tìm kiếm" />
						<div class="input-group-append">
							<button class="input-group-text bg-transparent text-info">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<div class="container-fluid bg-info mb-30">
		<div class="row px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn d-flex align-items-center justify-content-between bg-info w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; padding: 0 30px">
					<h6 class="text-light m-0">
						<i class="fa fa-bars mr-2"></i>Danh Mục
					</h6> <i class="fa fa-angle-down text-light"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
					id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999">
					<div class="navbar-nav w-100">

						<a href="#Sale" class="nav-item nav-link text-danger">Sản phẩm
							khuyến mãi</a> <a href="" class="nav-item nav-link">Rau củ quả</a> <a
							href="" class="nav-item nav-link">Thực phẩm chế biến</a> <a
							href="" class="nav-item nav-link">Thực phẩm khô</a> <a href=""
							class="nav-item nav-link">Thực phẩm bổ dưỡng</a>


					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-info navbar-dark py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none"> <span
						class="h1 text-light px-2">KiKi Mart</span>

					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="/index" class="nav-item nav-link">Trang chủ</a> <a
								href="/aboutus" class="nav-item nav-link">Giới thiệu</a> <a
								href="/contact" class="nav-item nav-link">Liên hệ với chúng tôi</a>
							<%-- <c:if test="${empty sessionScope.username}"> </c:if> --%>
							<%--
                <c:if test="${not empty sessionScope.username}"> </c:if> --%>

						</div>

						<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
							<a href="/shop/profile/favorite" class="btn px-0"> <i
								class="fas fa-heart text-light"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px">${sessionScope.countFavorite}
									${sessionScope.countFavorite==null?'0':''}</span>
							</a> <a href="/shop/cart" class="btn px-0 ml-3"> <i
								class="fas fa-shopping-cart text-light"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px">${sessionScope.countProduct}
									${sessionScope.countProduct==null?'0':''}</span>
							</a>
						</div>
					</div>
					<security:authorize access="!isAuthenticated()">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle text-light"
								data-toggle="dropdown">Thông tin tài khoản</a>
							<div class="dropdown-menu bg-light rounded-0 border-0 m-0">
								<a href="/login" class="dropdown-item">Đăng nhập</a> <a
									href="/register" class="dropdown-item">Đăng ký</a>
							</div>
						</div>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle text-light"
								data-toggle="dropdown">Thông tin tài khoản</a>
							<div class="dropdown-menu bg-light rounded-0 border-0 m-0">
								<a href="/shop/profile/order" class="dropdown-item">Thông
									tin</a> <a href="/logout" class="dropdown-item">Đăng xuất</a>
							</div>
						</div>
					</security:authorize>

					<security:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/admin/index" class="nav-item nav-link text-light">Quản
							lý shop</a>
					</security:authorize>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->
</body>
</html>
