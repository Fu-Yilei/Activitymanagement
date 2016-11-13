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
	String speaker;
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


	public String getSpeaker() {
		return speaker;
	}


	public void setSpeaker(String speaker) {
		this.speaker = speaker;
	}


	public int getActivityID() {
		return activityID;
	}


	public void setActivityID(int activityID) {
		this.activityID = activityID;
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

		String holder = "";
		
		DatabaseService ds = new DatabaseService();
		Activity a = new Activity(title,date,time_time,site,speaker,holder);
		ds.UpdateActivity(activityID,a);
		
		return SUCCESS;
	}

}
