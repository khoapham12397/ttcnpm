package khoa.code.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khoa.code.dao.OrderDAO;
import khoa.code.model.*;

/**
 * Servlet implementation class OrderProduct
 */
@WebServlet("/OrderProduct")
public class OrderProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		ShoppingCart cartInfo=(ShoppingCart)session.getAttribute("cartInfo");
		cartInfo.calTotalCost();
		//xem xet da dang nhap chua
		CustomerInfo cus=null;
		cus=(CustomerInfo) session.getAttribute("customer");
		if(cus==null) {
			response.sendRedirect("login");
		}else {
			OrderDAO.saveOrder(cartInfo, cus.getCustomerId());
			//khi do ta da set roi thi ok thoi dung la nhu vay ;
			request.setAttribute("cartInfo", cartInfo);
			session.setAttribute("cartInfo", null);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/success.jsp");
			dispatcher.forward(request, response);
		}
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
