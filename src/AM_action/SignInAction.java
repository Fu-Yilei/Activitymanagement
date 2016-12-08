package AM_action;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;
import AM_service.RecommendService;

public class SignInAction implements Action {

	String Email;
	String Password;
	

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}


	public String execute() throws Exception {
		DatabaseService ds = new DatabaseService();
		int tmp = ds.CheckUser(Email,Password);
		System.out.println("tmp = "+tmp);
		if (tmp != -1){
			if (tmp == 0){
				RecommendService rcs = new RecommendService();
				System.out.println("-----In FindProperAc-----");
				rcs.FindProperAc(Email);
				System.out.println("-----Out FindProperAc-----");
			}
			Cookie email = new Cookie("Email",Email);
			HttpServletResponse response = ServletActionContext.getResponse();  
			email.setMaxAge(60*60);
			response.addCookie(email);
			if (tmp == 0)
				return "normal";
			else if (tmp == 1)
				return "holder";
			else
				return ERROR;
		}
		return ERROR;
	}

}
