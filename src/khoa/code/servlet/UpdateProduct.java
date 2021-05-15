package khoa.code.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import khoa.code.dao.ProductDAO;
import khoa.code.model.Admin;
import khoa.code.model.Product;


@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public UpdateProduct() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Admin ad=(Admin)session.getAttribute("admin");
		if(ad==null) {
			request.setAttribute("typeLogin", "adminLogin");
			RequestDispatcher dispatcher=request.getRequestDispatcher("login");
			dispatcher.forward(request, response);
			
		}else {
			
			if(!request.getParameterMap().containsKey("id")) {
				ArrayList<Product> products=ProductDAO.getProductList();
				//truoc khi thuc hien yeu cau redirect thi ntn ????
				
				if(request.getParameterMap().containsKey("key")) {
					ArrayList<Product> ps=new ArrayList<>();
					String key=request.getParameter("key");
					for(Product p : products) {
						if(p.getName().toLowerCase().indexOf(key.toLowerCase())!=-1) {
							ps.add(p);
						}
					}
					request.setAttribute("products", ps);
				}else {
				request.setAttribute("products",products);
				}
				RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/products_admin.jsp");
				dispatcher.forward(request, response);
			}else {
				int id=Integer.valueOf(request.getParameter("id"));
				if(request.getParameterMap().containsKey("type")) {
					String type= request.getParameter("type");
					if(type.equals("delete")&& id!=-1) {
						ProductDAO.deleteProduct(id);
						response.sendRedirect("updateProduct");
					}
					
				}else {
				Product product=null;
				if(id==-1) {
				
					product=new Product();
					product.setId(-1);
				}else {
					product=ProductDAO.findProduct(id);
					
				}
				session.setAttribute("product_updating", product);
				request.setAttribute("product", product);
				RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/product.jsp");
				dispatcher.forward(request, response);
				}
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameterMap().containsKey("id")){
			int id=Integer.valueOf(request.getParameter("id"));
			String name=request.getParameter("name");
			Float cost=Float.valueOf(request.getParameter("cost"));
			int count =Integer.valueOf(request.getParameter("count"));
			int brand=Integer.valueOf(request.getParameter("brand"));
			int dis=Integer.valueOf(request.getParameter("discount"));
			Date nsx=Date.valueOf(request.getParameter("nsx"));
			
			String pathImg=null;
			
			if(request.getParameterMap().containsKey("pathImg")) {
				pathImg=request.getParameter("pathImg");
				System.out.println("pathImg exist");
			}
			
			
			Product p=new Product(id,name,(double)cost,brand,count,dis,pathImg,nsx);
			if(id!=-1) ProductDAO.updataProduct(id, p);
			else ProductDAO.insertProduct(p);
			HttpSession session=request.getSession();
			session.removeAttribute("product_updating");
			session.removeAttribute("imgPath");
			response.sendRedirect("updateProduct");
		}
	}
	//no da co the ton tai chua 
}
