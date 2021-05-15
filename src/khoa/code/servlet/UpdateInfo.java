package khoa.code.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khoa.code.dao.CustomerDAO;
import khoa.code.model.CustomerInfo;

/**
 * Servlet implementation class UpdateInfo
 */
@WebServlet("/updateInfo")
public class UpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("customer")!=null) {
		
			RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/contact.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPhone= request.getParameter("oldPhone");
		String oldPass=request.getParameter("oldPass");
		//o day can check lai xem no co dung khong ??? va chuyen doi thong tin dang nhap trong session lai 
		//o day chua thuc hien check lai da thuc hien chuyen huong roi 
		CustomerInfo cus=(CustomerInfo) request.getSession().getAttribute("customer");
		//can khao sat: 
		if(oldPhone.equals(cus.getCustomerPhone()) && oldPass.equals(cus.getPassword())) {
		
			String name=request.getParameter("name");
			String pass=request.getParameter("password");
			String phone=request.getParameter("phone");
			String add=request.getParameter("address");
			String email=request.getParameter("email");
			CustomerInfo cus1=new CustomerInfo(0,name,pass,phone,add,email);
			cus1.setCustomerId(cus.getCustomerId());
			if(CustomerDAO.updateCus(cus.getCustomerId(), cus1)==0) {
				System.out.println("update fails");
			}else {
				request.getSession().setAttribute("customer", cus1);
			}
			response.sendRedirect("productList");
		}	

	}
}
