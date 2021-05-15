package khoa.code.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khoa.code.dao.OrderDAO;


@WebServlet("/removeOrder")
public class RemoveOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RemoveOrder() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		if(session.getAttribute("customer")==null) response.sendRedirect("login");
		else {
		if(request.getParameterMap().containsKey("orderId")) {
			int orderId=Integer.valueOf(request.getParameter("orderId"));
			if(!request.getParameterMap().containsKey("itemId")) {
				OrderDAO.deleteOrder(orderId);
			}else {
			if(request.getParameterMap().containsKey("itemId") && request.getParameterMap().containsKey("val")){
				int itemId=Integer.valueOf(request.getParameter("itemId"));
				float val=Float.valueOf(request.getParameter("val"));
				OrderDAO.delOrderItem(itemId);
				OrderDAO.setOrderTotalCost(orderId, val);
				}
			}
			response.sendRedirect("orders?type=1");
			}	
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
