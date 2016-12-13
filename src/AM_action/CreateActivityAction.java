package AM_action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.Action;
import AM_entity.Activity;
import AM_service.DatabaseService;
import java.util.Random;
import javax.imageio.ImageIO;
import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;


public class CreateActivityAction implements Action {
	File file;
	String fileFileName;
	String fileContentType;
    String AlertStr;
	String title;
	Date date;
	String time;
	String site;
	String Details;
	String holder;
	String tag[];

	 private static final String PICTRUE_FORMATE_JPG = "jpg";


	public String getAlertStr() {
		return AlertStr;
	}

	public void setAlertStr(String alertStr) {
		AlertStr = alertStr;
	}

	public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }
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

	public void pressText(String targetImg, String SrcImg, String pressText,  String fontName, int fontStyle, int fontSize, Color color, int x, int y, float alpha) {

    	try {
            File file = new File(targetImg);
            File srcFile = new File(SrcImg);
            Image image = ImageIO.read(srcFile);
            int width = image.getWidth(null);
            int height = image.getHeight(null);
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = bufferedImage.createGraphics();
            g.drawImage(image, 0, 0, width, height, null);
            g.setFont(new Font(fontName, fontStyle, fontSize));
            g.setColor(color);
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
            
            int width_1 = fontSize * getLength(pressText);
            int height_1 = fontSize;
            int widthDiff = width - width_1;
            int heightDiff = height - height_1;
            if(x < 0){
                x = widthDiff / 2;
            }else if(x > widthDiff){
                x = widthDiff;
            }
            if(y < 0){
                y = heightDiff / 2;
            }else if(y > heightDiff){
                y = heightDiff;
            }
            
            g.drawString(pressText, x, y + height_1);
            g.dispose();
            ImageIO.write(bufferedImage, PICTRUE_FORMATE_JPG, file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	public int getLength(String text) {
        int textLength = text.length();
        int length = textLength;
        for (int i = 0; i < textLength; i++) {
            if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
                length++;
            }
        }
        return (length % 2 == 0) ? length / 2 : length / 2 + 1;
    }
	public String execute() throws Exception {
		Time time_time;
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        java.util.Date d = null;
        try {
            d = format.parse(time);
        } catch (Exception e) {
        	setAlertStr("Wrong time format!");
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
		if(tag != null) {
		for (int i = 0;i < tag.length;i++)
			tagtmp += tag[i];
		}
		else {
			setAlertStr("至少选择一个活动类型！");
			return ERROR;
		}
		DatabaseService ds = new DatabaseService();
		Activity a = new Activity(title,date,time_time,site,Details,holder,tagtmp);
		ds.AddActivity(a,holder);
		
		
		DatabaseService fl = new DatabaseService();
		DatabaseService bl = new DatabaseService();
		if(file != null) {
			
			if(getFileContentType().substring(6,10).equalsIgnoreCase("jpeg")) {
				String root = ServletActionContext.getServletContext().getRealPath("/images/PosterOutput");
				root = root.replaceAll("\\\\","/");
		        InputStream is = new FileInputStream(file);
		        OutputStream os = new FileOutputStream(new File(root, fl.SearchforID(title)+".jpg"));
		        System.out.println("fileFileName: " + fileFileName);
		        
		        bl.SavePicturePath(bl.SearchforID(title), "images/PosterOutput/" + bl.SearchforID(title) + ".jpg",title,date);
		        byte[] buffer = new byte[500];
		        int length = 0;
		        while(-1 != (length = is.read(buffer, 0, buffer.length))) {
		            os.write(buffer);
		        }
		        os.close();
		        is.close();
			}
			else {
				setAlertStr("Sorry, the picture's format is not appropriate.");
				return ERROR;
			}
		}
		else {
			System.out.println("???????????????????????");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String DT = df.format(date);
			
			String ModelPath = ServletActionContext.getServletContext().getRealPath("/images/PosterModel/");
			ModelPath = ModelPath.replaceAll("\\\\","/");
	    	String TgtPath = ServletActionContext.getServletContext().getRealPath("/images/PosterOutput");
			TgtPath = TgtPath.replaceAll("\\\\","/");
	    	System.out.println(ModelPath);
	    	System.out.println(TgtPath);
	    	String [] AC;
	    	AC = Details.split("\n");
	    	String PosterModels[] = new String[5];
	    	for(int i = 0; i < 5; i++) {
	    		PosterModels[i] = new String();
	    		PosterModels[i] = ModelPath + "/P" + Integer.toString(i + 1) + ".jpg";
	    		System.out.println(PosterModels[i]);
	    	}
	    	
	    	Random r = new Random();
	    	int Choice = r.nextInt(5);
	    	String RandomPoster = PosterModels[Choice];
	    	String OutputPoster = TgtPath + "/" + fl.SearchforID(title) + ".jpg";
	    	//fl.SavePicturePath(fl.SearchforID(title), OutputPoster);
	    	pressText(OutputPoster, RandomPoster, title, "FangSong", Font.BOLD, 100, Color.BLACK, 20, 100, .8f);
	    	pressText(OutputPoster, OutputPoster, DT, "FangSong", Font.BOLD, 100, Color.BLACK, 500, 380, .8f);
	    	pressText(OutputPoster, OutputPoster, site, "FangSong", Font.BOLD, 100, Color.BLACK, 20, 650, .8f);
	    	for(int i = 0; i < AC.length; i++) {
	    		pressText(OutputPoster, OutputPoster, AC[i], "FangSong", Font.BOLD, 50, Color.WHITE, 20, 900+60*i, .8f);
	    	}
	    	pressText(OutputPoster, OutputPoster, holder, "FangSong", Font.BOLD, 80, Color.WHITE, 20, 1600, .8f);
	    	
	    	System.out.println("1111111111111111111111111111111111111");
	    	bl.SavePicturePath(bl.SearchforID(title), "images/PosterOutput/" + bl.SearchforID(title) + ".jpg",title,date);
		}
		return SUCCESS;
	}

}
