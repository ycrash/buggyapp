package com.buggyapp.efficientcode;

import java.util.ArrayList;
import java.util.List;

public class EfficientExample {

	private List<User> users;
	
	public void addUser(User user) {
		
		if (users == null) {
			// Lazily initializing ArrayList<> to save memory
			users = new ArrayList<>();
		}
		
		users.add(user);
	}	
}
