package khoa.code.servlet;

import khoa.code.model.CustomerInfo;
import khoa.code.dao.CustomerDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerDAO cusDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        cusDAO=new CustomerDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/register.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String pass=request.getParameter("password");
		String phone=request.getParameter("phone");
		String add=request.getParameter("address");
		String email=request.getParameter("email");
		//gia su nhu dien vao day du 
		CustomerInfo cus=new CustomerInfo(0,name,pass,phone,add,email);
		//chua co validate data
		cusDAO.saveCus(cus);
		response.sendRedirect("productList");
		
	}

}
