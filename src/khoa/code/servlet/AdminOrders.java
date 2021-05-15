package khoa.code.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khoa.code.dao.OrderDAO;
import khoa.code.model.Admin;
import khoa.code.model.Order;

/**
 * Servlet implementation class AdminOrders
 */
@WebServlet("/adminOrders")
public class AdminOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrders() {
        super();
      
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Admin admin=(Admin)session.getAttribute("admin");
		if(admin==null) {
			request.setAttribute("typeLogin", "adminLogin");
			RequestDispatcher dispatcher=request.getRequestDispatcher("login");
			dispatcher.forward(request, response);
		}else {
			int adminId=admin.getId();
			//khi do no se biet duoc nhung don hang nao cua no
			ArrayList<Order> orders= OrderDAO.getOrdersAdmin(adminId);
			Collections.reverse(orders);
			request.setAttribute("orders", orders);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/adminOrder.jsp");
			dispatcher.forward(request, response);
		}
		//no bi vang di mat
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.valueOf(request.getParameter("orderId"));
	    //ta khong xoa 1 cai order nao ma chi set status =4;
		if(request.getParameterMap().containsKey("delete")) {
				OrderDAO.deleteOrder(id);
			}else if(request.getParameterMap().containsKey("pagkage")) {
				OrderDAO.updateStatus(id, 2);
			}else if(request.getParameterMap().containsKey("finish")) {
				OrderDAO.updateStatus(id, 3);
		}
		//o day can them tac vu: 
		response.sendRedirect("adminOrders");
	}

}
