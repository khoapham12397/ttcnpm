package khoa.code.model;

public class Admin {
	private String name;
	private int id;
	private String pass;
	public Admin() {
		
	}
	
	public Admin(int id,String name, String pass) {
		super();
		this.name = name;
		this.id = id;
		this.pass = pass;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
