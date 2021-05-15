package khoa.code.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import khoa.code.model.ShoppingCart;

/**
 * Servlet implementation class CartInfo
 */
@WebServlet("/cartInfo")
public class CartInfo extends HttpServlet {
	
    public CartInfo() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ShoppingCart cartInfo=(ShoppingCart)request.getSession().getAttribute("cartInfo");
			if(cartInfo!=null) {
				RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/cart.jsp");
				dispatcher.forward(request, response);
			}
		}catch(Exception e) {
			
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
