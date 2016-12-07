package AM_entity;

public class User {

	private String email;
	private String password;
	private int usertype;
	private String like;
	public User(){};
	public User(String e,String p,int u,String l){
		email = e;
		password = p;
		usertype = u;
		like = l;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	
	
}
