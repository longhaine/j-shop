package CONTROLLER;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import DAO.AccountsD;
import DAO.BrandsD;
import DAO.CategoriesD;
import DAO.ProductsD;

/**
 * Servlet implementation class Info
 */
@WebServlet("/your-info")
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Info() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			LoadBanner(request, response);
			request.getRequestDispatcher("WEB-INF/info.jsp").forward(request, response);
		}
		else
		{
			Cookie path = new Cookie("path",request.getServletPath().substring(1));
			path.setMaxAge(5*60);
			response.addCookie(path);
			response.sendRedirect("http://localhost:8080/WebShop/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		HttpSession session = request.getSession();
		JSONObject user = (JSONObject) session.getAttribute("user");
		String messageString ="";
		if(name.length() >= 1 && address.length() >=1 && phone.length() >= 1 && user!=null)
		{
			String email = user.getString("email");
			AccountsD accountsdao = new AccountsD();
			JSONObject messageObject = accountsdao.Update(email, name, address, phone);
			messageString = messageObject.getString("message");
			request.setAttribute("message", messageString);
			user.put("name", name);
			user.put("address", address);
			user.put("phone", phone);
			session.setAttribute("user", user);
 			doGet(request, response);
		}
		else
		{
			messageString = "invalid";
			request.setAttribute("message", messageString);
			doGet(request, response);
		}
	}
	protected void LoadBanner(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CategoriesD categoriesdao = new CategoriesD();
		BrandsD brandsdao = new BrandsD();
		ProductsD productsdao = new ProductsD();
		JSONArray categories = categoriesdao.getCategories();
		request.setAttribute("categories",categories); // specifics
		JSONArray brands = brandsdao.getBrands();
		request.setAttribute("brands", brands);
	}

}
