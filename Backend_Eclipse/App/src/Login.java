
abstract public class Login {
	
	private final String name;
	private final char password;
	
	public Login (String name, char password) {
		this.name = name;
		this.password = password;
	}
	
	public String getName(){
		return name;
	}
	
	public char getPassword(){
		return password;
	}

}
