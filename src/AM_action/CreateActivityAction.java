package AM_action;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import com.opensymphony.xwork2.Action;
import AM_entity.Activity;
import AM_service.DatabaseService;

public class CreateActivityAction implements Action {

	private static final long serialVersionUID = 1L;
	
	String title;
	Date date;
	String time;
	String site;
	String details;
    File file;
    String fileFileName;
    String fileContentType;
    
    
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


	public String getdetails() {
		return details;
	}


	public void setdetails(String details) {
		this.details = details;
	}

    public File getFile()
    {
        return file;
    }

    public void setFile(File file)
    {
        this.file = file;
    }

    public String getFileFileName()
    {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName)
    {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType()
    {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType)
    {
        this.fileContentType = fileContentType;
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
		DatabaseService ds = new DatabaseService();
		Activity a = new Activity(title,date,time_time,site,details,holder);
		ds.AddActivity(a);
		
		
		String root = ServletActionContext.getServletContext().getRealPath("/upload");
        InputStream is = new FileInputStream(file);
        OutputStream os = new FileOutputStream(new File(root, fileFileName));
        System.out.println("fileFileName: " + fileFileName);
        System.out.println("file: " + file.getName());
        System.out.println("file: " + file.getPath());
        byte[] buffer = new byte[500];
        int length = 0;
        while(-1 != (length = is.read(buffer, 0, buffer.length)))
        {
            os.write(buffer);
        }
        os.close();
        is.close();
        
		
		return SUCCESS;
	}

}
