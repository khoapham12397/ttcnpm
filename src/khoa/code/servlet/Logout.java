package khoa.code.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type=Integer.valueOf(request.getParameter("type"));
		if(type==1) {
			if(request.getSession().getAttribute("admin")!=null) {
				request.getSession().removeAttribute("admin");
				response.getWriter().write("Logout Admin Successful!!!");
			}else response.getWriter().write("Failed");
		}
		if(type==0) {
			if(request.getSession().getAttribute("customer")!=null) {
				request.getSession().removeAttribute("customer");
				response.getWriter().write("Logout Customer Successful!!!");
			}else response.getWriter().write("Failed");
		}
		//o day viec xu ly no khong co su chia cat ra binh thuong thi dui ve 1 file html con bay gion thi gui ve text
		//khi do khong ton tai admin ben trong session nua ok
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
