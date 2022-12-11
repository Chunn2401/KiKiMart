<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KiKi Mart - Hóa đơn</title>
<link href="/user/img/favicon.ico" rel="icon">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">
<style type="text/css">
body, table, td, a {
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
}

table, td {
	mso-table-lspace: 0pt;
	mso-table-rspace: 0pt;
}

img {
	-ms-interpolation-mode: bicubic;
}

img {
	border: 0;
	height: auto;
	line-height: 100%;
	outline: none;
	text-decoration: none;
}

table {
	border-collapse: collapse !important;
}

body {
	height: 100% !important;
	margin: 0 !important;
	padding: 0 !important;
	width: 100% !important;
}

a[x-apple-data-detectors] {
	color: inherit !important;
	text-decoration: none !important;
	font-size: inherit !important;
	font-family: inherit !important;
	font-weight: inherit !important;
	line-height: inherit !important;
}

@media screen and (max-width: 480px) {
	.mobile-hide {
		display: none !important;
	}
	.mobile-center {
		text-align: center !important;
	}
}

div[style*="margin: 16px 0;"] {
	margin: 0 !important;
}
</style>
<body
	style="margin: 0 !important; padding: 0 !important; background-color: #eeeeee;"
	bgcolor="#eeeeee">
	<div
		style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;">
		For what reason would it be advisable for me to think about business
		content? That might be little bit risky to have crew member like them.
	</div>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="center" style="background-color: #eeeeee;"
				bgcolor="#eeeeee">
				<table align="center" border="0" cellpadding="0" cellspacing="0"
					width="100%" style="max-width: 600px;">
					<tr>
						<td align="center" valign="top"
							style="font-size: 0; padding: 35px;" bgcolor="#rgb(72, 151, 255)">
							<div
								style="display: inline-block; max-width: 50%; min-width: 100px; vertical-align: top; width: 100%;">
								<table align="left" border="0" cellpadding="0" cellspacing="0"
									width="100%" style="max-width: 300px;">
									<tr>
										<td align="left" valign="top"
											style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;"
											class="mobile-center">
											<h1
												style="font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;">
												KiKi Mart</h1>
										</td>
									</tr>
								</table>
							</div>
							<div
								style="display: inline-block; max-width: 50%; min-width: 100px; vertical-align: top; width: 100%;"
								class="mobile-hide">
								<table align="left" border="0" cellpadding="0" cellspacing="0"
									width="100%" style="max-width: 300px;">
									<tr>
										<td align="right" valign="top"
											style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;">
											<table cellspacing="0" cellpadding="0" border="0"
												align="right">
												<tr>
													
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td align="center"
							style="padding: 35px 35px 20px 35px; background-color: #ffffff;"
							bgcolor="#ffffff">
							<table align="center" border="0" cellpadding="0" cellspacing="0"
								width="100%" style="max-width: 600px;">
								<tr>
									<td align="center"
										style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 35px;">
										<img src="/upload/logoinvoice.JPG" width="90" height="90"
										style="display: block; border: 0px;" /><br>
										<h2
											style="font-size: 30px; font-weight: 800; line-height: 40px; color: #333333; margin: 0; padding-top: 10px;">
											Thank You For Your Order!</h2>
									</td>
								</tr>
								<tr>
									<td align="left"
										style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;">
										<p
											style="font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;">
											Cảm ơn đã đặt hàng tại <b style="color: rgb(72, 151, 255);">KiKi Mart</b>.
											Vui lòng kiểm tra thông tin đặt hàng của bạn. Mọi thắc mắc xin vui lòng
											liên hệ 199931112 để được hỗ trợ. Cảm ơn!
										</p>
									</td>
								</tr>
								<tr>
									<td align="left" style="padding-top: 20px;">
										<table cellspacing="0" cellpadding="0" border="0" width="100%">
											<tr>
												<td width="75%" align="left" bgcolor="#eeeeee"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;">
													Xác nhận đơn hàng </td>
												<td width="25%" align="right" bgcolor="#eeeeee"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;">
													#${name}</td>
											</tr>
											<c:forEach var="item" items="${order}">
												<tr>
													<td width="75%" align="left"
														style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
														${item.product.name} (${item.quality})</td>
													<td width="25%" align="right"
														style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
														<fmt:formatNumber type="number" pattern="###,###,###"
															value="${item.product.price * item.quality}" /> VNĐ
													</td>
												</tr>
											</c:forEach>

											<tr>
												<td width="75%" align="left"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
													Shipping</td>
												<td width="25%" align="right"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
													30.000 VNĐ</td>
											</tr>
											<tr>
												<td width="75%" align="left"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
													Thuế doanh thu</td>
												<td width="25%" align="right"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">
													0 VNĐ</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="left" style="padding-top: 20px;">
										<table cellspacing="0" cellpadding="0" border="0" width="100%">
											<tr>
												<td width="65%" align="left"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;">
													Tổng tiền</td>
												<td width="35%" align="right"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;">
													<fmt:formatNumber type="number" pattern="###,###,###"
														value="${total+30000}" /> VNĐ
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" height="100%" valign="top" width="100%"
							style="padding: 0 35px 35px 35px; background-color: #ffffff;"
							bgcolor="#ffffff">
							<table align="center" border="0" cellpadding="0" cellspacing="0"
								width="100%" style="max-width: 660px;">
								<tr>
									<td align="center" valign="top" style="font-size: 0;">
										<div
											style="display: inline-block; max-width: 50%; min-width: 240px; vertical-align: top; width: 100%;">
											<table align="left" border="0" cellpadding="0"
												cellspacing="0" width="100%" style="max-width: 300px;">
												<tr>
													<td align="left" valign="top"
														style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
														<p style="font-weight: 800;">Địa chỉ giao hàng</p>
														<p>${address}</p>
													</td>
												</tr>
											</table>
										</div>
										<div
											style="display: inline-block; max-width: 50%; min-width: 240px; vertical-align: top; width: 100%;">
											<table align="left" border="0" cellpadding="0"
												cellspacing="0" width="100%" style="max-width: 300px;">
												<tr>
													<td align="right" valign="top"
														style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
														<p style="font-weight: 800;">Dự kiến giao hàng</p>
														<p>trong vòng 5 ngày.</p>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center"
							style="padding: 35px; background-color: white;"
							bgcolor="#1b9ba3">
							<table align="center" border="0" cellpadding="0" cellspacing="0"
								width="100%" style="max-width: 600px;">
								<tr>
									<td align="center"
										style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;">
										<h2
											style="font-size: 24px; font-weight: 800; line-height: 30px; color: black; margin: 0;">
											Back to your information.</h2>
									</td>
								</tr>
								<tr>
									<td align="center" style="padding: 25px 0 15px 0;">
										<table border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td align="center" style="border-radius: 5px;"
													bgcolor="#66b3b7"><a href="/shop/profile/order"
													target="_blank"
													style="font-size: 18px; font-family: Open Sans, Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 5px; background-color: black; padding: 15px 30px; border: 1px solid black; display: block;">Shop
														Again <i class="fas fa-hand-point-left"></i>
												</a></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center"
							style="padding: 35px; background-color: #ffffff;"
							bgcolor="#ffffff">
							<table align="center" border="0" cellpadding="0" cellspacing="0"
								width="100%" style="max-width: 600px;">
								<!-- <tr>
                                    <td align="center"> <img src="logo-footer.png" width="37" height="37" style="display: block; border: 0px;" /> </td>
                                </tr> -->
								
			
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>

</html>