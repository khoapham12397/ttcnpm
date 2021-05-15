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

import khoa.code.dao.ProductDAO;
import khoa.code.model.*;

@WebServlet("/BuyProduct")
public class BuyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public BuyProduct() {
        super();
    }

	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idProduct=Integer.parseInt(request.getParameter("idProduct"));
		int sl=-1;
		if(request.getParameterMap().containsKey("soluong")) {
			sl=Integer.parseInt(request.getParameter("soluong"));
			if(sl<0) sl=-2;
		}
		
		
		Product product=ProductDAO.findProduct(idProduct);
		if(product!=null) {
			CartLineInfo cartLine;
			HttpSession session=request.getSession();
			ShoppingCart cartInfo=(ShoppingCart)session.getAttribute("cartInfo");
			if(cartInfo==null) {
				cartInfo=new ShoppingCart();
				session.setAttribute("cartInfo", cartInfo);
			}
			int ind=cartInfo.findIndexProduct(idProduct);
			if(ind!=-1) {
				cartLine=cartInfo.getList().get(ind);
				if(sl==-1) {
					cartLine.setCount(cartLine.getCount()+1);}
				else cartLine.setCount(sl);
			}
			else {
				cartLine=new CartLineInfo(product,1);
				cartInfo.addCartLine(cartLine);
			}
			RequestDispatcher dispatcher =request.getRequestDispatcher("cartInfo");
			dispatcher.forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
