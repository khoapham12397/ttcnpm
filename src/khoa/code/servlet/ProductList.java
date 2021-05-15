package khoa.code.servlet;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import khoa.code.dao.ProductDAO;
import khoa.code.model.Product;


@WebServlet({"/productList", "/"})
public class ProductList extends HttpServlet {
    
    public ProductList() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Product> products=null;
		ArrayList<Product> bestSells=null;
		ArrayList<Product> newProducts=null;
		
		bestSells=ProductDAO.getBestSells();
	
		if(request.getParameterMap().containsKey("type")) {
			String type=request.getParameter("type");
			if(type.equals("keyword")) {
				String key=request.getParameter("keyword");
				
				ArrayList<Product> prods=new ArrayList<>();
				products=new ArrayList<>();
				prods=ProductDAO.getProductList();
				for(int i=0;i<prods.size();i++) {
					String name=prods.get(i).getName().toLowerCase();
					if(name.indexOf(key.toLowerCase())!=-1) {
						products.add(prods.get(i));
					}
				}
			}
			if(type.equals("brand")) {
				
				int br=Integer.valueOf(request.getParameter("brand_code"));
				products= ProductDAO.getProductsBrand(br);
			}
			if(type.equals("price")) {
				int down=Integer.valueOf(request.getParameter("down"));
				int up=Integer.valueOf(request.getParameter("up"));
				products=ProductDAO.getProductsPrice(down, up);
			}
			if(type.equals("discount")) {
				int down=Integer.valueOf(request.getParameter("down"));
				int up=Integer.valueOf(request.getParameter("up"));
				products=ProductDAO.getProductsDis(down, up);
			}
			if(type.equals("flav")) {
				int flav=Integer.valueOf(request.getParameter("flav"));
				products=ProductDAO.getProdsFlav(flav);
			}
		}else {
			products=ProductDAO.getProductList();
			newProducts=ProductDAO.getNewProducts();
		}
		ArrayList<String> brands=ProductDAO.getBrands();
		
		request.setAttribute("products", products);
		request.setAttribute("brands", brands);
		if(newProducts!=null) request.setAttribute("newProducts", newProducts);
		request.setAttribute("bestSells", bestSells);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/index.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
}
