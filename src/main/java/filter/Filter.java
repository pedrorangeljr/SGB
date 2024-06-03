package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import conexao.SingleConnection;


@WebFilter(urlPatterns = {"/paginas/*"})
public class Filter extends HttpFilter implements javax.servlet.Filter {
     
	private static final long serialVersionUID = 1L;
	private static Connection connection;
   
    public Filter() {
        super();
        
    }

	
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		try {
			
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlParaAutenticar = req.getServletPath();
			
			if(usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/paginas/ServletLogin")) {
				
				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor realize o login!");
				redireciona.forward(request, response);
				return;
				
			}else {
				
				chain.doFilter(request, response);
			}
			
		} catch (Exception e) {
			
			try {
				
				connection.rollback();
				
			} catch (SQLException e1) {
				
				e1.printStackTrace();
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("paginas/erro.jsp");
				request.setAttribute("msg", e1.getMessage());
				dispatcher.forward(request, response);
			}
			
			e.printStackTrace();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("paginas/erro.jsp");
			request.setAttribute("msg", e.getMessage());
			dispatcher.forward(request, response);
		}
	
		
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
		connection = SingleConnection.getConnection();
	}

}
