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

<title>SB Admin 2 - Register</title>

<!-- Custom fonts for this template-->
<link href="/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/admin/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/student/css/business-frontpage.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form:form action="doRegister" method="post"
								modelAttribute="account">

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
								<button type="submit" class="btn btn-primary btn-user btn-block">
									Register Account</button>
								<hr>
								<a href="#" class="btn btn-google btn-user btn-block"> <i
									class="fab fa-google fa-fw"></i> Register with Google
								</a>
								<a href="#" class="btn btn-facebook btn-user btn-block"> <i
									class="fab fa-facebook-f fa-fw"></i> Register with Facebook
								</a>
							</form:form>
							<hr>
							<div class="text-center">
								<a class="small" href="#">Forgot Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="login">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/admin/vendor/jquery/jquery.min.js"></script>
	<script src="/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/admin/js/sb-admin-2.min.js"></script>

</body>

</html>
