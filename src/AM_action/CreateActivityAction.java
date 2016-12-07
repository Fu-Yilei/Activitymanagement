package AM_action;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import AM_entity.Activity;
import AM_service.DatabaseService;

public class CreateActivityAction implements Action {

	String title;
	Date date;
	String time;
	String site;
	String Details;
	String holder;
	String tag[];
	
	
	public String[] getTag() {
		return tag;
	}


	public void setTag(String[] tag) {
		this.tag = tag;
	}


	public String getHolder() {
		return holder;
	}


	public void setHolder(String holder) {
		this.holder = holder;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	

	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public String getSite() {
		return site;
	}


	public void setSite(String site) {
		this.site = site;
	}


	public String getDetails() {
		return Details;
	}


	public void setDetails(String Details) {
		this.Details = Details;
	}


	public String execute() throws Exception {
		Time time_time;
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        java.util.Date d = null;
        try {
            d = format.parse(time);
        } catch (Exception e) {
        	return ERROR;
        }
        time_time = new java.sql.Time(d.getTime());
        System.out.println(date.toString());
		System.out.println(time);
		String holder = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies){
			if (c.getName().equals("Email")){
				holder = c.getValue();
				break;
			}
		}
		String tagtmp = "";
		for (int i = 0;i < tag.length;i++)
			tagtmp += tag[i];
		DatabaseService ds = new DatabaseService();
		Activity a = new Activity(title,date,time_time,site,Details,holder,tagtmp);
		ds.AddActivity(a,holder);
		
		return SUCCESS;
	}

}
