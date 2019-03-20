
public class TestBank extends Admin implements Permissions {
	
	
	public TestBank(String name, char password) {
		
		super(name, password);
		
	}
	
	
	private String question;
	private String answer;
	
	
	public void setQuestion(String question) {
		this.question = question;
	}
	
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getQuestion() {
		return question;
	}
	
	public String getAnswer() {
		return answer;
	}

	@Override
	public Object getPermissions() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
