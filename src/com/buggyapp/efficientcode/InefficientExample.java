package com.buggyapp.efficientcode;

import java.util.ArrayList;
import java.util.List;

public class InefficientExample {

	private List<User> users = new ArrayList<>();
	
	public void addUser(User user) {
		
		users.add(user);
	}	
}
