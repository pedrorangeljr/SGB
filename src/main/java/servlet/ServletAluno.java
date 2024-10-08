package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoAluno;
import model.ModelAluno;

@WebServlet(urlPatterns = { "/ServletAluno" })
public class ServletAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoAluno daoAluno = new DaoAluno();

	public ServletAluno() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String acao = request.getParameter("acao");

			if (acao.equalsIgnoreCase("listarAlunos")) {

				List<ModelAluno> aluno = daoAluno.consultaAluno();

				request.setAttribute("modelAluno", aluno);
				RequestDispatcher dispatcher = request.getRequestDispatcher("paginas/listaAlunos.jsp");
				dispatcher.forward(request, response);
			}

			else if (acao.equalsIgnoreCase("buscarEdidar")) {

				String idAluno = request.getParameter("idAluno");

				ModelAluno aluno = daoAluno.consultarAlunoId(idAluno);

				request.setAttribute("modelAluno", aluno);
				RequestDispatcher dispatcher = request.getRequestDispatcher("paginas/cadastroAlunos.jsp");
				dispatcher.forward(request, response);

			} else {

				RequestDispatcher dispatcher = request.getRequestDispatcher("paginas/cadastroAluno.jsp");
				dispatcher.forward(request, response);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String msg = "Cadastro realizado com sucesso";

			String idAluno = request.getParameter("idAluno");
			String nome = request.getParameter("nome");
			String telefone = request.getParameter("telefone");
			String cpf = request.getParameter("cpf");
			String cep = request.getParameter("cep");
			String logradouro = request.getParameter("logradouro");
			String numero = request.getParameter("numero");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String uf = request.getParameter("uf");

			ModelAluno aluno = new ModelAluno();

			aluno.setIdAluno(idAluno != null && !idAluno.isEmpty() ? Long.parseLong(idAluno) : null);
			aluno.setNome(nome);
			aluno.setTelefone(Integer.parseInt(telefone));
			aluno.setCpf(cpf);
			aluno.setCep(cep);
			aluno.setLogradouro(logradouro);
			aluno.setNumero(numero);
			aluno.setBairro(bairro);
			aluno.setCidade(cidade);
			aluno.setUf(uf);

			if (daoAluno.validarCpf(aluno.getCpf()) && aluno.getIdAluno() == null) {

				msg = "Já existe Aluno com mesmo CPF";

			} else {

				if (aluno.isNovo()) {

					msg = "Gravado com sucesso";
				} else {

					msg = "Atualizado com Sucesso!";
				}

				aluno = daoAluno.salvarAluno(aluno);
			}

			request.setAttribute("msg", msg);			
			RequestDispatcher dispatcher = request.getRequestDispatcher("paginas/cadastroAlunos.jsp");
			request.setAttribute("modelAluno", aluno);
			dispatcher.forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
