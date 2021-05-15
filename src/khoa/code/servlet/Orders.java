package khoa.code.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khoa.code.dao.OrderDAO;
import khoa.code.model.CustomerInfo;
import khoa.code.model.Order;


@WebServlet("/orders")
public class Orders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Orders() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		CustomerInfo cus= (CustomerInfo) session.getAttribute("customer");
		if(cus==null) {
			response.sendRedirect("login");
		}else {
			//no co the loi dung de xoa toan bo database luon do => khong nen lam ntn ok
			//suy xet den tinh private security
			
			int type;
			if(request.getParameterMap().containsKey("type")) {
				type=Integer.valueOf(request.getParameter("type"));
			}else type=0;
			System.out.println("CustomerID : "+ cus.getCustomerId());
			
			ArrayList<Order> orders= OrderDAO.getOrders(type,cus.getCustomerId());
			Collections.reverse(orders);
			
			
			request.setAttribute("orders", orders);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/orderList.jsp");
			dispatcher.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
