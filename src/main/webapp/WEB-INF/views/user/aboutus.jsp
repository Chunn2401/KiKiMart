<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib uri="http://java.sun.com/jstl/core_rt"
prefix="c"%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
      rel="stylesheet"
    />

    <!-- Font Awesome -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="/user/lib/animate/animate.min.css" rel="stylesheet" />
    <link
      href="/user/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/user/css/style.css" rel="stylesheet" />
    <style>
      html {
        scroll-behavior: smooth;
      }
    </style>
  </head>
  <body>
    <%@include file="navbar.jsp"%>

  

    <div class="bg-light">
      <div class="container py-5">
        <div class="row h-100 align-items-center py-5">
          <div class="col-lg-6">
            <h1 class="display-4">About us page</h1>
            <p class="lead text-muted mb-0">
              Là một trang web có thể cho người nông dân có thể tự do đăng bán nông sản của mình. Với 1 tiêu chí
			  "Mỗi người nông dân 1 cửa hàng" nhằm giúp cho lượng tiêu thụ nông sản trong nước tăng cao.
            </p>
           
          </div>
          <div class="col-lg-6 d-none d-lg-block">
            <img
              src="user/img/rausach.jpg"
              alt=""
              class="img-fluid"
            />
          </div>
        </div>
      </div>
    </div>

    <div class="bg-white py-5">
      <div class="container py-5">
        <div class="row align-items-center mb-5">
          <div class="col-lg-6 order-2 order-lg-1">
            <i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
            <h2 class="font-weight-light">Người dân có nhu cầu mua bản nông sản hãy truy cập vào trang web của chúng tôi</h2>
            <p class="font-italic text-muted mb-4">
				
            </p>
            <a href="/index" class="btn btn-dark px-5 rounded-pill shadow-sm"
              >Tại đây</a
            >
          </div>
          <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2">
            <img
              src="https://bootstrapious.com/i/snippets/sn-about/img-1.jpg"
              alt=""
              class="img-fluid mb-4 mb-lg-0"
            />
          </div>
        </div>
        
      </div>
    </div>

    <div class="bg-light py-5">
      <div class="container py-5">
        <div class="row mb-4">
          <div class="col-lg-5">
            <h2 class="display-4 font-weight-light">Our team</h2>
            <p class="font-italic text-muted">
              PROTEAM (Nhóm 6)
            </p>
          </div>
        </div>

        <div class="row text-center">
          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4">
              <img
                src="/upload/1.jpg"
                alt=""
                width="100"
                class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"
              />
              <h5 class="mb-0">Vương Nguyên Trung</h5>
              <span class="small text-uppercase text-muted">Leader</span>
              <ul class="social mb-0 list-inline mt-3">
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-facebook-f"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-twitter"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-instagram"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-linkedin"></i
                  ></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- End-->

          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4">
              <img
                src="/upload/2.jpg"
                alt=""
                width="100"
                class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"
              />
              <h5 class="mb-0">Trần Tiến Dũng</h5>
              <span class="small text-uppercase text-muted"></span>
              <ul class="social mb-0 list-inline mt-3">
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-facebook-f"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-twitter"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-instagram"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-linkedin"></i
                  ></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- End-->

          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4">
              <img
                src="/upload/3.png"
                alt=""
                width="100"
                class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"
              />
              <h5 class="mb-0">Nguyễn Dịp Thế Tri</h5>
              <span class="small text-uppercase text-muted"></span>
              <ul class="social mb-0 list-inline mt-3">
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-facebook-f"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-twitter"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-instagram"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-linkedin"></i
                  ></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- End-->

          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4">
              <img
                src="/upload/4.jpg"
                alt=""
                width="100"
                class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"
              />
              <h5 class="mb-0">Đinh Quang Tuấn</h5>
              <span class="small text-uppercase text-muted"></span>
              <ul class="social mb-0 list-inline mt-3">
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-facebook-f"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-twitter"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-instagram"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-linkedin"></i
                  ></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- End-->
		   <!-- Team item-->
		   <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4">
              <img
                src="/upload/5.jpg"
                alt=""
                width="100"
                class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"
              />
              <h5 class="mb-0">Giáp Văn Hải</h5>
              <span class="small text-uppercase text-muted"></span>
              <ul class="social mb-0 list-inline mt-3">
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-facebook-f"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-twitter"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-instagram"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-linkedin"></i
                  ></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- End-->
		   <!-- Team item-->
		   <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4">
              <img
                src="/upload/6.jpg"
                alt=""
                width="100"
                class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm"
              />
              <h5 class="mb-0">Nguyễn Huỳnh Đông Triều</h5>
              <span class="small text-uppercase text-muted"></span>
              <ul class="social mb-0 list-inline mt-3">
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-facebook-f"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-twitter"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-instagram"></i
                  ></a>
                </li>
                <li class="list-inline-item">
                  <a href="#" class="social-link"
                    ><i class="fa fa-linkedin"></i
                  ></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- End-->
        </div>
      </div>
    </div>

    

    <%@include file="footer.jsp"%>

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"
      ><i class="fa fa-angle-double-up"></i
    ></a>
  </body>
  <!-- JavaScript Libraries -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
  <script src="/user/lib/easing/easing.min.js"></script>
  <script src="/user/lib/owlcarousel/owl.carousel.min.js"></script>

  <!-- Contact Javascript File -->
  <script src="/user/mail/jqBootstrapValidation.min.js"></script>
  <script src="/user/mail/contact.js"></script>

  <!-- Template Javascript -->
  <script src="/user/js/main.js"></script>
</html>
