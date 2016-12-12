package AM_action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;

public class DetailsAction implements Action {

	int ID;
	String Email;
	
	
	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String execute() throws Exception {
		System.out.println("email = "+ Email);
		System.out.println("id = " + ID);
		if (Email != null && !Email.isEmpty() && !Email.equals("")){
			String tmp = "";
			DatabaseService ds = new DatabaseService();
			if (ds.whetherLike(Email,ID))
				tmp = "1";
			else
				tmp = "0";
			Cookie judge = new Cookie("Whether",tmp);
			HttpServletResponse response = ServletActionContext.getResponse();
			judge.setMaxAge(60*60);
			response.addCookie(judge);
		}
		String a = ID + "";
		System.out.println("a = "+a);
		Cookie id = new Cookie("ACID",a);
		HttpServletResponse response = ServletActionContext.getResponse();  
		id.setMaxAge(60*60);
		response.addCookie(id);
		
		return SUCCESS;
	}

}
