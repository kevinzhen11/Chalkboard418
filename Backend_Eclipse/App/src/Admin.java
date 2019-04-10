
public class Admin extends Login implements Permissions {

	public Admin (String name, char password) {
		
		super(name, password);
		
	}
	
	String permission;
	
	public void setPermission(String permission) {
		
		this.permission = permission;
		
	}


	@Override
	public Object getPermissions() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
