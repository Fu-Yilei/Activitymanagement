package AM_action;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;
import AM_entity.Activity;

public class SearchActivityByTitleAction implements Action {

	String title;
	ArrayList<Activity> aclist=new ArrayList<Activity>();
	
	public ArrayList<Activity> getAclist() {
		return aclist;
	}

	public void setAclist(ArrayList<Activity> aclist) {
		this.aclist = aclist;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	public String execute() throws Exception {
		DatabaseService ds = new DatabaseService();
		int[] idlist=new int[100];
		idlist=ds.SearchActivityByTitle(title);
		if (idlist[0]>=0){
			System.out.println(idlist[1]);
			String a = title;
			a = URLEncoder.encode(a,"utf-8");
			System.out.println("a = "+a);
			Cookie title = new Cookie("ACTITLE",a);
			HttpServletResponse response = ServletActionContext.getResponse();  
			title.setMaxAge(60*60);
			response.addCookie(title);
			
			return SUCCESS;
			
		}
		
		else{
		return ERROR;
		}
	}

}
