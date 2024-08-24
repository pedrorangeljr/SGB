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
						<h1 class="h3 mb-0 text-gray-800">Lista de Alunos</h1>

						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="./">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Lista de Alunos</li>
						</ol>
					</div>

					<!--Row-->
					<div class="row mb-3">

						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h4 class="m-0 font-weight-bold text-primary"></h4>
						</div>
						<div class="table-responsive p-3">
							<table class="table align-items-center table-flush"
								id="tabelaAlunos">

								<thead class="thead-light">
									<tr>
										<th>ID</th>
										<th>Nome</th>
										<th>Telefone</th>
										<th>CPF</th>
										<th>EDITAR</th>
										<th>EXCLUIR</th>
									</tr>
								</thead>
								<tbody>
                                    <c:forEach items="${modelAluno }" var="alunos">
                                       <tr>                                     
                                          <td><c:out value="${alunos.idAluno }"></c:out></td>
                                          <td><c:out value="${alunos.nome }"></c:out></td>
                                          <td><c:out value="${alunos.telefone }"></c:out></td>
                                          <td><c:out value="${alunos.cpf }"></c:out></td>
                                          <td><a href=""class="btn btn-warning btn-round">Editar</a></td>
                                          <td><a href=""class="btn btn-danger btn-round">Excluir</a></td>
                                       </tr>
                                    
                                    </c:forEach>
								</tbody>
							</table>
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