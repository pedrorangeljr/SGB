<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>
<title>Cadastro de Alunos</title>

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
						<h1 class="h3 mb-0 text-gray-800">Sistema Genrenciador de
							Biblioteca</h1>

						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="./">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
						</ol>
					</div>

					<!--Row-->
					<div class="content">
						<div class="row">
							<div class="col-md-12">
								<div class="card card-user">
									<div class="card-header">
										<h5 class="card-title">Cadastro de Alunos</h5>
									</div>
									<div class="card-body">
										<form action="<%=request.getContextPath()%>/ServletAluno"
											method="post">
											<div class="row">
												<div class="col-md-5 pr-1">
													<div class="form-group">
														<label>ID</label> <input type="text" class="form-control"
															disabled="" readonly="readonly" value="${aluno.id }">
													</div>
												</div>
												<div class="col-md-3 px-1">
													<div class="form-group">
														<label>Nome</label> <input type="text"
															class="form-control" placeholder="name" name="nome"
															id="nome" value="${aluno.nome }">
													</div>
												</div>
												<div class="col-md-4 pl-1">
													<div class="form-group">
														<label for="telefone">Telefone</label> <input type="text"
															class="form-control" placeholder="telefone"
															name="telefone" id="telefone" value="${aluno.telefone }">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6 pr-1">
													<div class="form-group">
														<label>CPF</label> <input type="text" class="form-control"
															placeholder="cpf" name="cpf" id="cpf" value="${aluno.cpf }">
													</div>
												</div>
												<div class="col-md-6 pl-1">
													<div class="form-group">
														<label>Cep</label> <input type="text" class="form-control"
															placeholder="cep" name="cep" id="cep"
															onblur="pesquisaCep();" value=${aluno.cep }>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6 pr-1">
													<div class="form-group">
														<label>Logradouro</label> <input type="text"
															class="form-control" placeholder="logradouro"
															name="logradouro" id="logradouro" value=${aluno.logradouro }>
													</div>
												</div>
												<div class="col-md-6 pl-1">
													<div class="form-group">
														<label>Número</label> <input type="text"
															class="form-control" placeholder="numero"
															name="numero" id="numero" value="${aluno.numero }">
													</div>
												</div>
											</div>


											<div class="row">
												<div class="col-md-4 pr-1">
													<div class="form-group">
														<label>Bairro</label> <input type="text"
															class="form-control" placeholder="bairro" name="bairro"
															id="bairro" value="${aluno.bairro }">
													</div>
												</div>
												<div class="col-md-4 px-1">
													<div class="form-group">
														<label>Cidade</label> <input type="text"
															class="form-control" placeholder="cidade" name="cidade"
															id="cidade" value="${aluno.cidade }">
													</div>
												</div>
												<div class="col-md-4 pl-1">
													<div class="form-group">
														<label>UF</label> <input type="text" class="form-control"
															placeholder="uf" name="uf" id="uf" value="${aluno.uf }">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="update ml-auto mr-auto">
													<button type="submit" class="btn btn-primary btn-round"
														onclick="mostrarAlerta()">Cadastrar</button>
													<button type="button" class="btn btn-warning btn-round">Editar</button>
													<button type="button" class="btn btn-danger btn-round">Excluir</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
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

	<script type="text/javascript">
	
		function mostrarAlerta() {
			alert("Salvo com sucesso!");
		}

		function pesquisaCep() {

			var cep = $("#cep").val();

			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {

							//Atualiza os campos com os valores da consulta.
							$("cep").val(dados.cep);
							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#localidade").val(dados.localidade);
							$("#uf").val(dados.uf);

						} //end if.
						else {

							//CEP pesquisado não foi encontrado.
							limpa_formulário_cep();
							alert("CEP não encontrado.");
						}

					});

		}
	</script>
</body>

</html>