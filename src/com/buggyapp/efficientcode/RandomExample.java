package com.buggyapp.efficientcode;

import java.util.ArrayList;
import java.util.List;

/*import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;*/


public class RandomExample {
	
	//private static final Logger s_logger = LogManager.getLogger(RandomExample.class);

	public static void addUser(User user) {
		
		new User();
		
		List<User> users = new ArrayList<>();		
		users.clear();
		
		int value = 0;
		for (int counter = 1; counter <= 11; ++counter) {
			
			++value;
			users.add(user);
		}
		
		System.out.println(value);
		//s_logger.info(value);
	}
	
	public static void main(String args[]) {

		addUser(null);
	}
}
