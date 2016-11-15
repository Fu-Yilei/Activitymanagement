package AM_action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class DetailsAction implements Action {

	int ID;
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String execute() throws Exception {
		String a = ID + "";
		System.out.println("a = "+a);
		Cookie id = new Cookie("ACID",a);
		HttpServletResponse response = ServletActionContext.getResponse();  
		id.setMaxAge(60*60);
		response.addCookie(id);
		
		return SUCCESS;
	}

}
