package AM_service;

import javax.servlet.http.HttpServlet;

public class AutoRunService extends HttpServlet {
	public void init(){
		Runnable ra = new Runnable(){
			public void run(){
			
				DelOvertime d = new DelOvertime();
				d.Do();
				
			}
		};
		Runnable rb = new Runnable(){
			public void run(){
				CheckAndSend c = new CheckAndSend();
				c.Do();
			}
		};
		
		Thread th0 = new Thread(ra);
		Thread th1 = new Thread(rb);
		th0.start();
		th1.start();
		System.out.println("?????");
	}
}
