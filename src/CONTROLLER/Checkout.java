package CONTROLLER;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/check-out")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		JSONArray productList = (JSONArray) session.getAttribute("productList");
		String email = (String) session.getAttribute("email");
		if(productList != null && email != null) {
			request.getRequestDispatcher("WEB-INF/history.jsp").forward(request, response);
		}
		else if(productList !=null)
		{
			request.getRequestDispatcher("WEB-INF/history2.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("http://localhost:8080/WebShop/");
		}
		
	}

}
