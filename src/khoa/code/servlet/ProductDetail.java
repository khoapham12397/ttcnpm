package khoa.code.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import khoa.code.dao.ProductDAO;
import khoa.code.model.Product;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/productDetail")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductDetail() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		Product p=ProductDAO.findProduct(id);
		request.setAttribute("product", p);
		//lay 5 gia tri dau || random
		Random rd=new Random();
		int len=ProductDAO.products.size();
		int t=0;
		int[] a=new int[5];
		ArrayList<Product> mProducts=new ArrayList<>();
		for(int i=0;i<5;i++) a[t]=-1;
		boolean fl;
		while(t<5) {
			int x= rd.nextInt(len);
			fl=true;
			for(int i=0;i<5;i++) {
				if(a[i]==x) {fl=false;break;} 
			}
			if(fl) {a[t]=x;t++; mProducts.add(ProductDAO.products.get(x));}
		}
		request.setAttribute("mProducts", mProducts);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/single.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
