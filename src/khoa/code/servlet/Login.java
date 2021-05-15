package khoa.code.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khoa.code.dao.AdminDAO;
import khoa.code.dao.CustomerDAO;
import khoa.code.dao.UserDAO;
import khoa.code.model.Admin;
import khoa.code.model.CustomerInfo;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private CustomerDAO cusDAO;
   
    public Login() {
        super();
      //  cusDAO=new CustomerDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/login.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     String type=request.getParameter("typeLogin");
	     HttpSession session =request.getSession();
	     if(type!=null) {
	     if(type.equals("loginAdmin")) {
	    	 String name=request.getParameter("name");
	    	 String pass=request.getParameter("password");
	    	 Admin ad=AdminDAO.findAdmin(name, pass);
	    	 if(ad!=null) {
	    		 session.setAttribute("admin", ad);
	    		 response.sendRedirect("productList");
	    	 }
	    	 
	     }}else {
		 String phone= request.getParameter("phone");
	     String pass=request.getParameter("password");
	     CustomerInfo cus=null;
	     cus=CustomerDAO.findCus(phone, pass);
	     if(cus!=null) {
	    	 
	    	 session.setAttribute("customer",cus);
	    	 response.sendRedirect("productList");
	    	
	     }else {
	    	 RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/login.jsp");
	    	 dispatcher.forward(request, response);
	     }
	     }
	}

}
