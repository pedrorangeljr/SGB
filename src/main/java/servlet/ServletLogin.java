package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoLogin;
import model.ModelLogin;

@WebServlet(urlPatterns = { "/paginas/ServletLogin", "/ServletLogin" })
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoLogin daoLogin = new DaoLogin();

	public ServletLogin() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {

			request.getSession().invalidate();

			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			
		} else {

			doPost(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			String url = request.getParameter("url");

			if (email != null && !email.isEmpty() && senha != null && !senha.isEmpty()) {

				ModelLogin login = new ModelLogin();

				login.setEmail(email);
				login.setSenha(senha);

				if (daoLogin.validarLogin(login)) {

					request.getSession().setAttribute("usuario", login.getEmail());

					if (url == null || url.equals("null")) {

						url = "paginas/home.jsp";
					}

					RequestDispatcher dispatcher = request.getRequestDispatcher(url);
					dispatcher.forward(request, response);

				} else {

					RequestDispatcher dispatcher = request.getRequestDispatcher("./index.jsp");
					request.setAttribute("msg", "Informe login e/ou senha errado");
					dispatcher.forward(request, response);
				}

			} else {

				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "Informe login e/ou senha errado");
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
