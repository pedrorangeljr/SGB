<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body id="page-top">
	<div id="wrapper">

		<!-- Sidebar -->

		<jsp:include page="sidebar.jsp"></jsp:include>

		<!-- Sidebar -->

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<!-- TopBar -->

				<jsp:include page="navbar.jsp"></jsp:include>

				<!-- Topbar -->

				<!-- Container Fluid-->
				<div class="container-fluid" id="container-wrapper">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="./">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
						</ol>
					</div>

					<!--Row-->
					<div class="row mb-3">

						<div class="text-center">
							<img src="assets/img/error.svg" style="max-height: 100px;" class="mb-3">
							<h3 class="text-gray-800 font-weight-bold">Oopss!</h3>
							<p class="lead text-gray-800 mx-auto">404 Página não encontrada</p>
							<a href="index.html">&larr; voltar para Dashboard</a>
							<%= out.println(request.getAttribute("msg")) %>
						</div>

					</div>
					<!--Row-->
				</div>
				<!---Container Fluid-->
			</div>

			<!-- Footer -->

			<jsp:include page="footer.jsp"></jsp:include>
			<!-- Footer -->

		</div>

	</div>

	<!-- Scroll to top -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<jsp:include page="script.jsp"></jsp:include>
</body>

</html>