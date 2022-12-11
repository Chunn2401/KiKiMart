<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KiKi Mart - Sản phẩm</title>
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

<body onload="check2(${check})">
	<%@include file="navbar.jsp"%>

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="/index">Trang chủ</a> <a
						class="breadcrumb-item text-dark" href="#">Shop</a> <span
						class="breadcrumb-item active">Shop Detail</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Detail Start -->
	<div class="container-fluid pb-5">

		<div class="row px-xl-5">
			<div class="col-lg-5 mb-30">
				<div id="product-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner bg-light">
						<div class="carousel-item active">
							<img class="w-100 h-100" src="/upload/${loadInfo.image}"
								alt="Image">
						</div>
						<c:forEach var="item" items="${loadMultiImage}">
							<div class="carousel-item">
								<img class="w-100 h-100" height="570px"
									src="/upload/${item.group.image}" alt="Image">
							</div>
						</c:forEach>
						<!-- <div class="carousel-item">
                                   <img class="w-100 h-100" src="img/product-2.jpg" alt="Image">
                              </div>
                              <div class="carousel-item">
                                   <img class="w-100 h-100" src="img/product-3.jpg" alt="Image">
                              </div>
                              <div class="carousel-item">
                                   <img class="w-100 h-100" src="img/product-4.jpg" alt="Image">
                              </div> -->
					</div>
					<a class="carousel-control-prev" href="#product-carousel"
						data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
					</a> <a class="carousel-control-next" href="#product-carousel"
						data-slide="next"> <i
						class="fa fa-2x fa-angle-right text-dark"></i>
					</a>
				</div>
			</div>

			<div class="col-lg-7 h-auto mb-30">
				<div class="h-100 bg-light p-30">
					<h3>${loadInfo.name}</h3>
					<div class="d-flex mb-3">
						<div class="text-primary mr-2">
							<small class="fas fa-star"></small> <small class="fas fa-star"></small>
							<small class="fas fa-star"></small> <small
								class="fas fa-star-half-alt"></small> <small class="far fa-star"></small>
						</div>
						<small class="pt-1">(99 Đánh giá)</small>
					</div>
					<h3 class="font-weight-semi-bold mb-4">
						<fmt:formatNumber type="number" pattern="###,###,###"
							value="${loadInfo.price}" />
						VNĐ
					</h3>
					<p class="mb-4">${loadInfo.manufacture.information}</p>
					<form action="/shop/detail/${sessionScope.cateId}"
						method="post">
					
						<div class="d-flex align-items-center mb-4 pt-2">
							<div class="input-group quantity mr-3" style="width: 130px;">
								<div class="input-group-btn">
									<button type="button" class="btn btn-primary btn-minus">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								<input type="text" name="quality"
									class="form-control bg-secondary border-0 text-center"
									value="${quality}">
								<div class="input-group-btn">
									<button type="button" class="btn btn-primary btn-plus">
										<i class="fa fa-plus"></i>
									</button>
								</div>
								
							</div>
							<button type="submit" class="btn btn-primary px-3">
								<i class="fa fa-shopping-cart mr-1"></i> Thêm vào giỏ
							</button>

							<a href="/shop/favorite/${loadInfo.id}" class="btn btn-danger px-3 ml-3 ${checkFavorite?'':'disabled'}"><i class="fas fa-heart"></i> Yêu Thích</a>

						</div>
					</form>


					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">${alert}</h5>
									<!-- <button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button> -->
								</div>
								<div class="modal-body">${content}</div>
								<div class="modal-footer">
									<!-- <button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button> -->
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">OK</button>
								</div>
							</div>
						</div>
					</div>



					<div class="d-flex pt-2">
						<strong class="text-dark mr-2">Share on:</strong>
						<div class="d-inline-flex">
							<a class="text-dark px-2" href=""> <i
								class="fab fa-facebook-f"></i>
							</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
							</a> <a class="text-dark px-2" href=""> <i
								class="fab fa-linkedin-in"></i>
							</a> <a class="text-dark px-2" href=""> <i
								class="fab fa-pinterest"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row px-xl-5">
			<div class="col">
				<div class="bg-light p-30">
					<div class="nav nav-tabs mb-4">
						<a class="nav-item nav-link text-dark active" data-toggle="tab"
							href="#tab-pane-1">Mô tả</a> <a
							class="nav-item nav-link text-dark" data-toggle="tab"
							href="#tab-pane-2">Thông tin</a> <a
							class="nav-item nav-link text-dark" data-toggle="tab"
							href="#tab-pane-3">Đánh giá (0)</a>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-pane-1">
							<h4 class="mb-3">Mô Tả Sản Phẩm</h4>
							<p>${loadInfo.review}</p>
						</div>
						<div class="tab-pane fade" id="tab-pane-2">
							<h4 class="mb-3">Thông Tin Chi Tiết</h4>
							<p>${loadInfo.describe}</p>
							<div class="row">
								<div class="col-md-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-0">Thương hiệu:
											${loadInfo.manufacture.name}</li>
										<li class="list-group-item px-0">Chất lượng:
											${loadInfo.material}</li>
										<li class="list-group-item px-0"></li>
									</ul>
								</div>
								<div class="col-md-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-0">Xuất xứ:
											${loadInfo.origin}</li>
										<li class="list-group-item px-0">Tình trạng: Còn hàng</li>
										<li class="list-group-item px-0"></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-pane-3">
							<div class="row">
								<div class="col-md-6">
									<h4 class="mb-4">1 review for "${loadInfo.name}"</h4>
									<div class="media mb-4">
										<img src="/user/img/user.jpg" alt="Image"
											class="img-fluid mr-3 mt-1" style="width: 45px;">
										<div class="media-body">
											<h6>
												John Doe<small> - <i>01 Jan 2045</i></small>
											</h6>
											<div class="text-primary mb-2">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
											</div>
											<p>Diam amet duo labore stet elitr ea clita ipsum, tempor
												labore accusam ipsum et no at. Kasd diam tempor rebum magna
												dolores sed sed eirmod ipsum.</p>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<h4 class="mb-4">Leave a review</h4>
									<small>Your email address will not be published.
										Required fields are marked *</small>
									<div class="d-flex my-3">
										<p class="mb-0 mr-2">Your Rating * :</p>
										<div class="text-primary">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i>
										</div>
									</div>

									<div class="form-group">
										<label for="message">Your Review *</label>
										<textarea id="message" cols="30" rows="5" class="form-control"></textarea>
									</div>
									<div class="form-group">
										<label for="name">Your Name *</label> <input type="text"
											class="form-control" id="name">
									</div>
									<div class="form-group">
										<label for="email">Your Email *</label> <input type="email"
											class="form-control" id="email">
									</div>
									<div class="form-group mb-0">
										<input type="submit" value="Leave Your Review"
											class="btn btn-primary px-3">
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->

	<!-- Products Start -->
	<div class="container-fluid py-5">
		<h2
			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">Khám Phá Thêm</span>
		</h2>
		<div class="row px-xl-5">
			<div class="col">
				<div class="owl-carousel related-carousel">
					<c:forEach var="item" items="${bonusProduct}">
						<div class="product-item bg-light">
							<div class="product-img position-relative overflow-hidden">
								<img class="img-fluid1 w-100" src="/upload/${item.image}" alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href="/shop/detail/${item.id}"><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href="/shop/detail/${item.id}"><i
										class="far fa-heart"></i></a> <a
										class="btn btn-outline-dark btn-square" href="/shop/detail/${item.id}"><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="/shop/detail/${item.id}">${item.name}</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>
										<fmt:formatNumber type="number" pattern="###,###,###"
											value="${item.price}" />
										VNĐ
									</h5>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Products End -->

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
	
	function check2(u){
        if(u == true){
            $("#exampleModal").modal("show");
        }
    }
	</script>
</body>

</html>