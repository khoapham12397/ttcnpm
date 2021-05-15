package khoa.code.dao;
import khoa.code.model.MyConnect;
import khoa.code.model.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
public class ProductDAO {
	private static Connection connect;
	public static ArrayList<Product> products;
	static {
		try {
			connect=MyConnect.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		//	System.out.print("khong ket noi duoc");
			e.printStackTrace();
		}
	}
	
	public static boolean insertProduct(Product p) {
		String sql="insert into Product(prod_name,prod_count,prod_price,prod_brand,prod_dis,pathImg,prod_nsx) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setString(1, p.getName());
			pst.setInt(2, p.getCount());
			pst.setDouble(3, p.getCost());
			pst.setInt(4, p.getBrand());
			pst.setInt(5, p.getDiscount());
			pst.setString(6, p.getPathImg());
			pst.setDate(7, p.getCreateDate());
			//tai day nen nho la ta ton tai mot cai product duoc luu nhu la 1 san pham duoc update hay add
			pst.execute();
			return true;
			//cho nay khong co truy van
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	//no thuc hien truy xuat vao database thi co the mat nhieu time
	public static boolean deleteProduct(int id) {
		String sql ="delete from Product where prod_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, id);
			pst.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static ArrayList<Product> getNewProducts(){
		String sql="select  prod_id,prod_name,prod_price,prod_brand,prod_count,prod_dis,pathImg,prod_nsx from Product where DATEDIFF(DAY,prod_nsx,CURRENT_TIMESTAMP)<=45";
		Statement st=null;
		ArrayList<Product> ps=null;
		try {
			st = connect.createStatement();
			ResultSet rs= st.executeQuery(sql);
			ps=getResult(rs);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ps;
	}
	//them cac thong tin co ban vao ???
	public static ArrayList<Product> getResult(ResultSet rs){
		ArrayList<Product> list=new ArrayList<>();
		try {
			while(rs.next()) {
				int id=rs.getInt(1);
				String name = rs.getString(2);
				double cost= (double)rs.getFloat(3);
				int brand = rs.getInt(4);
				int count=rs.getInt(5);
				int discount=rs.getInt(6);
				String pathImg=rs.getString(7);
				//no noi so 8
				Date nsx=rs.getDate(8);
				list.add(new Product(id,name,cost,brand,count,discount,pathImg,nsx));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<Product> getProductsBrand(int brand){
		try {
			connect=MyConnect.getConnection();
			String sql="select prod_id,prod_name,prod_price,prod_brand,prod_count,prod_dis,pathImg,prod_nsx from Product where prod_brand=?";
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, brand);
			ResultSet rs= pst.executeQuery();
			return getResult(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<Product> getProdsFlav(int flav){
		ArrayList<Product> prs=null;
		String sql="select prod_id,prod_name,prod_price,prod_brand,prod_count,prod_dis,pathImg,prod_nsx from Product where prod_flav=?";
		
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, flav);
			ResultSet rs= pst.executeQuery();
			prs=getResult(rs);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		//tu do ta de dang tinh toan ra duoc nhung dieu can tinh ok
		
		return prs;
	}
	public static ArrayList<Product> getBestSells(){
		if(connect==null)
			try {
				connect=MyConnect.getConnection();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		ArrayList<Product> bests=new ArrayList<Product>();
		ArrayList<Product> res=null;
		String sql="select prod_id,sum(item_count) as count from OrderItem group by(prod_id) order by count";
		try {
			Statement st=connect.createStatement();
			ResultSet rs= st.executeQuery(sql);
			while(rs.next()) {
				int prodId= rs.getInt(1);
				int count =rs.getInt(2);
				Product p=findProduct(prodId);
				bests.add(p);
			}
			res=new ArrayList<>();
			for(int i=bests.size()-1;i>=bests.size()-5;i--) {
				res.add(bests.get(i));
			}
			return res;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public static ArrayList<Product> getProductsPrice(int down,int up){
		try {
			connect=MyConnect.getConnection();
			String sql="select prod_id,prod_name,prod_price,prod_brand,prod_count,prod_dis,pathImg,prod_nsx from Product where prod_price >= ? and prod_price <= ?";
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, down);
			pst.setInt(2, up);
			ResultSet rs= pst.executeQuery();
			return getResult(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//do so ngay di qua roi nen bi nhu vay thoi easy
	
	public static ArrayList<Product> getProductsDis(int down,int up){
		try {
			connect=MyConnect.getConnection();
			String sql="select prod_id,prod_name,prod_price,prod_brand,prod_count,prod_dis,pathImg from Product where prod_dis >= ? and prod_dis <= ?";
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, down);
			pst.setInt(2, up);
			ResultSet rs= pst.executeQuery();
			return getResult(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<Product> getProductList(){
		
		try {
			
			connect=MyConnect.getConnection();
			Statement st=connect.createStatement();
			String sql="select prod_id,prod_name,prod_price,prod_brand,prod_count,prod_dis,pathImg,prod_nsx from Product";
			ResultSet rs= st.executeQuery(sql);
			products=getResult(rs);
			return products;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		
		return null;
	}
	public static Product findProduct(int id) {
		String sql= "select  prod_id,prod_name,prod_price,prod_brand,prod_count,prod_dis,pathImg,prod_nsx from Product where prod_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs= pst.executeQuery();
			if(rs.next()) {
				int id1=rs.getInt(1);
				String name = rs.getString(2);
				double cost= (double)rs.getFloat(3);
				int brand = rs.getInt(4);
				int count=rs.getInt(5);
				int discount=rs.getInt(6);
				String pathImg=rs.getString(7);
				Date nsx=rs.getDate(8);
				return new Product(id1,name,cost,brand,count,discount,pathImg,nsx);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<String> getBrands() {
		ArrayList<String> brands=new ArrayList<>();
		try {
			Statement st= connect.createStatement();
			String sql="select * from Brand";
			ResultSet rs= st.executeQuery(sql);
			while(rs.next()) {
			 	int id= rs.getInt(1);
			 	String name=rs.getString(2);
			 	brands.add(name);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return brands;
	}
	public static int updataProduct(int id , Product p) {
		String sql="update Product set prod_name=?, prod_count=?,prod_price=?,prod_brand=?,prod_dis=?,prod_nsx=? where prod_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setString(1, p.getName());
			pst.setInt(2, p.getCount());
			pst.setFloat(3,(float)p.getCost());
			pst.setInt(4,p.getBrand());
			pst.setInt(5, p.getDiscount());
			
			pst.setDate(6, p.getCreateDate());
			pst.setInt(7, id);
			pst.executeUpdate();
		    if(p.getPathImg()!=null) {
		    	sql="update Product set pathImg=? where prod_id=?";
		    	pst=connect.prepareStatement(sql);
		    	pst.setString(1, p.getPathImg());
		    	pst.setInt(2, id);
		     	pst.executeUpdate();
		    }
		    return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
