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
											method="post" id="formAluno">

											<input type="hidden" name="acao" id="acao" value="">

											<div class="row">
												<div class="col-md-5 pr-1">
													<div class="form-group">
														<label>ID</label> <input type="text" class="form-control"
															disabled="" readonly="readonly"
															value="${modelAluno.idAluno }">
													</div>
												</div>
												<div class="col-md-3 px-1">
													<div class="form-group">
														<label>Nome</label> <input type="text"
															class="form-control" placeholder="name" name="nome"
															id="nome" value="${modelAluno.nome }">
													</div>
												</div>
												<div class="col-md-4 pl-1">
													<div class="form-group">
														<label for="telefone">Telefone</label> <input type="text"
															class="form-control" placeholder="telefone"
															name="telefone" id="telefone"
															value="${modelAluno.telefone }">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6 pr-1">
													<div class="form-group">
														<label>CPF</label> <input type="text" class="form-control"
															placeholder="cpf" name="cpf" id="cpf"
															value="${modelAluno.cpf }">
													</div>
												</div>
												<div class="col-md-6 pl-1">
													<div class="form-group">
														<label>Cep</label> <input type="text" class="form-control"
															placeholder="cep" name="cep" id="cep"
															onblur="pesquisaCep();" value=${modelAluno.cep }>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6 pr-1">
													<div class="form-group">
														<label>Logradouro</label> <input type="text"
															class="form-control" placeholder="logradouro"
															name="logradouro" id="logradouro"
															value=${modelAluno.logradouro }>
													</div>
												</div>
												<div class="col-md-6 pl-1">
													<div class="form-group">
														<label>Número</label> <input type="text"
															class="form-control" placeholder="numero" name="numero"
															id="numero" value="${modelAluno.numero }">
													</div>
												</div>
											</div>


											<div class="row">
												<div class="col-md-4 pr-1">
													<div class="form-group">
														<label>Bairro</label> <input type="text"
															class="form-control" placeholder="bairro" name="bairro"
															id="bairro" value="${modelAluno.bairro }">
													</div>
												</div>
												<div class="col-md-4 px-1">
													<div class="form-group">
														<label>Cidade</label> <input type="text"
															class="form-control" placeholder="cidade" name="cidade"
															id="cidade" value="${modelAluno.cidade }">
													</div>
												</div>
												<div class="col-md-4 pl-1">
													<div class="form-group">
														<label>UF</label> <input type="text" class="form-control"
															placeholder="uf" name="uf" id="uf"
															value="${modelAluno.uf }">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="update ml-auto mr-auto">
													<button type="submit" class="btn btn-primary btn-round"
														onclick="mostrarAlerta()">Cadastrar</button>
													<button type="button" data-toggle="modal"
														data-target="#exampleModal"
														class="btn btn-secondary btn-round">Pesquisar</button>
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
					<br />

					<div class="card mb-4">
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h4 class="m-0 font-weight-bold text-primary">Tabela de
								Alunos</h4>
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
                                    <c:forEach items='${modelAluno }' var='alunos'>
                                       <tr>                                     
                                          <td><c:out value="${alunos.id }"></c:out></td>
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

	<!-- Modal -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-body">

					<form class="navbar-search">

						<input type="hidden" name="idAluno" value="" /> <input
							type="hidden" name="acao" id="acao" value="">

						<div class="input-group">

							<input type="text" id="cpf" name="cpf"
								class="form-control bg-light border-1 small"
								placeholder="Pesquisar por CPF" aria-label="Search"
								aria-describedby="basic-addon2" style="border-color: #3f51b5;">

							<div class="input-group-append">
								<button onclick="buscarCpf();" class="btn btn-primary"
									type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>

						</div>


					</form>


				</div>

				<table class="table align-items-center table-flush"
					id="tabelaResultados">
					<thead class="thead-light">
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>CPF</th>
							<th>Ação</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

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

		function buscarCpf() {

			var cpf = document.getElementById("cpf").value;

			if (cpf != null && cpf != '' && cpf.trim() != '') {

				var urlAction = document.getElementById("formAluno").action;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "cpf=" + idAluno + "&acao=buscarCpf",
					success : function(response) {

						alert(response);
					}

				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ao pesquisar Aluno ' + xhr.responseText);
				});
			}
		}}
	</script>
</body>

</html>