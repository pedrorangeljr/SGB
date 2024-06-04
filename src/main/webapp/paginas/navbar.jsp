<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav
	class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
	<button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>
	<ul class="navbar-nav ml-auto">

		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a>
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">

				<form class="navbar-search"
					action="<%=request.getContextPath()%>/ServletAluno" method="post" id="formUser">

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
                 <table class="table align-items-center table-flush" id="tabelaResultados">
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
			</div>
			
			</li>
           
		<div class="topbar-divider d-none d-sm-block"></div>
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <img class="img-profile rounded-circle"
				src="<%=request.getContextPath()%>/assets/img/boy.png"
				style="max-width: 60px"> <span
				class="ml-2 d-none d-lg-inline text-white small"><%=session.getAttribute("usuario")%></span>
		</a>
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#"> <i
					class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
				</a> <a class="dropdown-item" href="#"> <i
					class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
				</a> <a class="dropdown-item" href="#"> <i
					class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity
					Log
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item"
					href="<%=request.getContextPath()%>ServletLogin?acao=logout"
					data-toggle="modal" data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
			</div></li>
	</ul>
</nav>
<script type="text/javascript">
	function buscarCpf() {

		var cpf = document.getElementById('cpf').value;

		if (cpf != null && cpf != '' && cpf.trim() != '') {

			var urlAction = document.getElementById("formUser").action;
			

			$.ajax({

				method : "get",
				url : urlAction,
				data : "cpf=" + cpf + "&acao=buscarCpf",
				success : function(response) {

					var json = JSON.parse(response);
					
					$('#tabelaResultados > tbody > tr').remove();
					
					for(var p = 0; p < json.length; p++) {
						
						$('#tabelaResultados > tbody').append('<tr> <td>'+json[p].idAluno+'</td> <td>'+json[p].nome+'</td> <td>'+json[p].cpf+'</td> <td><button type="button" onclick="verEditar('+json[p].idAluno+');" class="btn btn-sm btn-warning">Editar</button </td></tr>');
					}
				}

			}).fail(
					function(xhr, status, errorThrown) {
						alert('Erro ao buscar cpf: '
								+ xhr.responseText);
					});

		}
	}
	
	function verEditar(idAluno) {
		
		var urlAction = document.getElementById("formUser").action;

		window.location.href = urlAction + '?acao=buscarEdidar&idAluno=' + idAluno;
	}
</script>



