<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>SB Admin 2 - Dashboard</title>

	<!-- Custom fonts for this template-->
	<link href="/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template-->
	<link href="/admin/css/sb-admin-2.css" rel="stylesheet">
	<link href="/admin/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>User Identify</th>
											<th>Email</th>
											<th>Full Name</th>
											<th>DOB</th>
											<th>Address</th>
											<th>Role</th>
											<th>Active</th>
											<th>Action</th>
											<th>Action</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${listUsers}">
											<tr>
												<td>${user.id}</td>
												<td>${user.userIdentify}</td>
												<td>${user.email}</td>
												<td>${user.firstName} ${user.lastName} </td>
												<td>${user.dob}</td>
												<td>${user.address}</td>
												<td>${user.role}</td>
												<td>${user.active}</td>
												<td><a href="editUser/${user.id}">Edit</a></td>
												<td><a href="lockUser/${user.id}"
														onclick="return confirm('Are you sure you want to lock this item?');">Lock</a>
												<td><a href="deleteUser/${user.id}"
														onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
			<jsp:include page="/templates/admin/footer.jsp" />
		</div>
	</div>
	<!-- </div> -->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="/templates/admin/logout.jsp" />

	<!-- Bootstrap core JavaScript-->


	<!-- Bootstrap core JavaScript-->
	<script src="/admin/vendor/jquery/jquery.min.js"></script>
	<script src="/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/admin/js/demo/datatables-demo.js"></script>
	t>
</body>

</html>