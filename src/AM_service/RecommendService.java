package AM_service;

import java.util.List;

import AM_entity.User;

public class RecommendService {

	public void FindProperAc(String email) {
		DatabaseService ds = new DatabaseService();
		String LikeArray = ds.CalcAndWriteLike(email);
		List<User> users = ds.getAllUsers();
		
		
		
	}

}
