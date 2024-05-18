package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoAluno;
import model.ModelAluno;


@WebServlet("/ServletAluno")
public class ServletAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DaoAluno daoAluno = new DaoAluno();
    
    public ServletAluno() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String msg = "Cadastro realizado com sucesso";
			
			String id = request.getParameter("id");
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
			
			aluno.setIdAluno(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			aluno.setNome(nome);
			aluno.setTelefone(Integer.parseInt(telefone));
			aluno.setCpf(cpf);
			aluno.setCep(cep);
			aluno.setLogradouro(logradouro);
			aluno.setNumero(numero);
			aluno.setBairro(bairro);
			aluno.setCidade(cidade);
			aluno.setUf(uf);
			
			if(daoAluno.validarCpf(aluno.getCpf()) && aluno.getIdAluno() == null) {
				
				msg = "Já existe Aluno com mesmo CPF";
				
			}else {
				
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
