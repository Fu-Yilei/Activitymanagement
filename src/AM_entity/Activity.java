package AM_entity;

import java.sql.Date;
import java.sql.Time;

public class Activity {
	private String title;
	private Date date;
	private Time time;
	private String site;
	private String Details;
	private String holder;
	
	public Activity(){};
	public Activity(String t,Date d,Time tt,String s,String sp,String h){
		title = t;
		date = d;
		time = tt;
		site = s;
		Details = sp;
		holder = h;
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
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
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
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
	}
	
	
	
}
