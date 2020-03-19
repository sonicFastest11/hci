
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<div class="navbar-brand">
			<ul class="navbar-nav ml-auto">
				<c:if test="${not empty userLogName}">
					<li class="nav-item "><a class="nav-link text-white a-item" href="#">My
							courses</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link text-white a-item" 
					href="#">Faculty of IT</a></li>
				<li class="nav-item"><a class="nav-link text-white a-item"
					href="#">Admission</a></li>
				<li class="nav-item"><a class="nav-link text-white a-item"
					href="#">Academic programs</a></li>
				<li class="nav-item"><a class="nav-link text-white a-item"
					href="#">Student</a></li>
			</ul>
		</div>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<c:if test="${empty userLogName}">
					<li class="nav-item"><a class="nav-link text-white a-item " href="login">Login</a>
					</li>
				</c:if>
				<c:if test="${not empty userLogName}">
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span class="nav-item text-white">${userLogName}</span>
							<img src="/student/img/login.png" class="img-profile" > 
					</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
							</a> <a class="dropdown-item" href="#"> <i
								class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Change Password
							</a>
							<c:if test="${userRole eq '1'}">
							<a class="dropdown-item" href="admin"> <i
								class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Admin Page
							</a>
							</c:if>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="logout"
								onclick="return confirm('Are you sure you want to logout?');"><i
								class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Logout </a>
						</div></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<header class="bg-primary py-5 mb-5">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">Business Name or
						Tagline</h1>
					<p class="lead mb-5 text-white-50">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Non possimus ab labore provident
						mollitia. Id assumenda voluptate earum corporis facere quibusdam
						quisquam iste ipsa cumque unde nisi, totam quas ipsam.</p>
				</div>
			</div>
		</div>
	</header>