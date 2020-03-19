<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="/admin/css/sb-admin-2.css" rel="stylesheet">
<link href="/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/templates/admin/menu.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/templates/admin/header.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Users > Create User</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-upload fa-sm text-white-50"></i> Upload File</a>
					</div>
					<hr>
					<!-- <div class="container"> -->
					<div class="row">
						<div class="col-lg-6">

							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account</h1>
							</div>
							<form:form action="addUser" method="post" modelAttribute="user">
							
								<!-- Email -->
								<div class="form-group">
									<form:input type="text" path="email"
										class="form-control form-control-user"
										placeholder="Email Address (*)" />
									<form:errors path="email" cssClass="errors" />
									<span class="errors">${emailExist}</span>
								</div>

								<!-- Password -->
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:password class="form-control form-control-user"
											path="password" placeholder="Password (*)" />
										<form:errors path="password" cssClass="errors" />

									</div>

									<div class="col-sm-6">
										<form:password class="form-control form-control-user"
											path="confirmPassword" placeholder="Repeat Password (*)" />
									</div>

									<span class="errors">${notmatch}</span>

								</div>

								<!-- User Identify -->
								<div class="form-group">
									<form:input type="text" class="form-control form-control-user"
										path="userIdentify" placeholder="User Identify" />
								</div>
								
								<!-- First Name -->
								<div class="form-group">
									<form:input type="text" class="form-control form-control-user"
										path="firstName" placeholder="First Name" />
								</div>
								
								<!-- Last Name -->
								<div class="form-group">
									<form:input type="text" class="form-control form-control-user"
										path="lastName" placeholder="Last Name" />
								</div>
								
								<!-- Date of Birth -->
								<div class="form-group">
									<form:input type="date" class="form-control form-control-user"
										path="dob" placeholder="Date of Birth" />

								</div>
								
								<!-- Address -->
								<div class="form-group">
									<form:input type="text" class="form-control form-control-user"
										path="address" placeholder="Address" />
								</div>

								<button type="submit" class="btn btn-primary btn-user btn-block">
									Register Account</button>
							</form:form>
						</div>
						<div class="col-lg-6 d-none d-lg-block bg-register-image"></div>
					</div>

				</div>
			</div>
			<jsp:include page="/templates/admin/footer.jsp" />
		</div>
	</div>
	<!-- </div> -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="/templates/admin/logout.jsp" />

	<!-- Bootstrap core JavaScript-->


	<script src="/admin/vendor/jquery/jquery.min.js"></script>
	<script src="/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/admin/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/admin/js/demo/chart-area-demo.js"></script>
	<script src="/admin/js/demo/chart-pie-demo.js"></script>
</body>

</html>