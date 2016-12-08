package AM_service;

public class Test {

	public static void main(String[] args) {
		SendEmailService se = new SendEmailService();
		se.setAddress("fuyilei96@hit.edu.cn", "hello");
		se.send("something here");
	}

}
