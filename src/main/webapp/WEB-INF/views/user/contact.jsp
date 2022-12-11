<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>KiKi Mart - Contact</title>
<!-- Favicon -->
<link href="/user/img/favicon.ico" rel="icon" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet" />

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="/user/lib/animate/animate.min.css" rel="stylesheet" />
<link href="/user/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/user/css/style.css" rel="stylesheet" />
<link href="/user/css/Contact.css" rel="stylesheet" />

<style>
html {
	scroll-behavior: smooth;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container contact-form">
		<div class="contact-image">
			<img src="https://image.ibb.co/kUagtU/rocket_contact.png"
				alt="rocket_contact" />
		</div>
		<form method="post">
			<h3>Hãy để lại lời nhắn của bạn</h3>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<input type="text" name="txtName" class="form-control"
							placeholder="Điền tên của bạn *" value="" />
					</div>
					<div class="form-group">
						<input type="text" name="txtEmail" class="form-control"
							placeholder="Điền Email của bạn *" value="" />
					</div>
					<div class="form-group">
						<input type="text" name="txtPhone" class="form-control"
							placeholder="Điền sđt của bạn *" value="" />
					</div>
					<div class="form-group">
						<input type="submit" name="btnSubmit" class="btnContact" href="#"
							value="Gửi tin nhắn"/>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<textarea name="txtMsg" class="form-control"
							placeholder="Hãy để lại tin nhắn *" style="width: 100%; height: 150px"></textarea>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@include file="footer.jsp"%>

	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>
</body>
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
</html>
