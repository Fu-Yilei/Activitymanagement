package AM_action;
import com.opensymphony.xwork2.ActionSupport;
import AM_entity.Activity;
import AM_service.DatabaseService;
public class DetailsAction extends ActionSupport{
	String title;
	Activity ac;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Activity getAc() {
		return ac;
	}
	public void setAc(Activity ac) {
		this.ac = ac;
	}
	
	
	public String execute(){
		try{
			DatabaseService ds = new DatabaseService();
			setAc(ds.getAcByTiltle(getTitle()));
			return SUCCESS;
		} catch (Exception e) {
			System.out.println(e.getMessage());

			return ERROR;
		}
	}
	
}