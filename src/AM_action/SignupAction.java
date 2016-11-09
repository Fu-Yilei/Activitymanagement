package AM_action;

import AM_entity.User;
import AM_service.DatabaseService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class SignupAction implements Action {

	
	String Email;
	String Password;
	String Usertype;
	
	

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

	public String getUsertype() {
		return Usertype;
	}

	public void setUsertype(String usertype) {
		Usertype = usertype;
	}

	public String execute() throws Exception {
		
		int tmp;
		if (Usertype.equals("normal"))
			tmp = 0;
		else if (Usertype.equals("holder"))
			tmp = 1;
		else
			return ERROR;
		
		User u = new User(Email,Password,tmp);
		DatabaseService ds = new DatabaseService();
		boolean t = ds.NewAccount(u);
	//	System.out.println(t);
		if (t){
			Cookie email = new Cookie("Email",Email);
			HttpServletResponse response = ServletActionContext.getResponse();  
			email.setMaxAge(60*60);
			response.addCookie(email);
			if (tmp == 0){
				System.out.println("normal");
				return "normal";
			}
			else{
				System.out.println("holder");
				return "holder";
			}
		}
		else{
			System.out.println("error");
			return ERROR;
		}
	}

}
