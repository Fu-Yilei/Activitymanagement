package AM_action;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;


import com.opensymphony.xwork2.Action;

import AM_entity.Activity;
import AM_service.DatabaseService;

public class UpdateACAction implements Action {

	String title;
	Date date;
	String time;
	String site;
	String Details;
	String tag[];
	int activityID;
	
	
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


	public String[] getTag() {
		return tag;
	}


	public void setTag(String[] tag) {
		this.tag = tag;
	}


	public void setDetails(String Details) {
		this.Details = Details;
	}


	public int getActivityID() {
		return activityID;
	}


	public void setActivityID(int activityID) {
		this.activityID = activityID;
	}


	public String execute() throws Exception {
		String tagtmp = "";
		System.out.println("86:upac:tags is ");
		for (int i = 0;i < tag.length;i++){
			System.out.println(tag[i]);
		}
		for (int i = 0;i < tag.length;i++)
			tagtmp += tag[i];
		Time time_time;
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        java.util.Date d = null;
        try {
            d = format.parse(time);
        } catch (Exception e) {
        	return ERROR;
        }
        time_time = new java.sql.Time(d.getTime());

		String holder = "";
		
		DatabaseService ds = new DatabaseService();
		Activity a = new Activity(title,date,time_time,site,Details,holder,tagtmp);
		ds.UpdateActivity(activityID,a);
		
		return SUCCESS;
	}

}
