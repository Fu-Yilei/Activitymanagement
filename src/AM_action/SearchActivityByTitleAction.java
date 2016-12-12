package AM_action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class SearchActivityByTitleAction implements Action {

	String title;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	public String execute() throws Exception {
		String a = title;
		System.out.println("a = "+a);
		Cookie title = new Cookie("ACTITLE",a);
		HttpServletResponse response = ServletActionContext.getResponse();  
		title.setMaxAge(60*60);
		response.addCookie(title);
		
		return SUCCESS;
	}

}