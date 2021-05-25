package com.buggyapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.testng.Assert;
import org.testng.annotations.Test;

import com.buggyapp.BaseTest;


public class LaunchBuggyAppServletTest extends BaseTest {
	
	/**
	 * Steps:
	 * 1. User clicked "OutofMemoryError" button.
	 * 2. Invoke API
	 * 
	 * Expected Result:
	 * 1. API should return success message in response.
	 * @throws ServletException 
	 * @throws IOException 
	 * 
	 * */

	@Test
	public void goGood() throws Exception {

		MockHttpServletRequest request = new MockHttpServletRequest();
		MockHttpServletResponse response = new MockHttpServletResponse();
		
		// 1. Build Request
		request.setParameter(LaunchBuggyAppServlet.BUGGY_APP_TYPE, "PROBLEM_OOM");
		
		// 2. Invoke API
		new LaunchBuggyAppServlet().doProcess(request, response);
		
		//3. Assert Response
		Assert.assertTrue(response.getContentAsString().contains("Shortly OutOfMemoryError will be reported on the server"));
		
	}
	
	/**
	 * Steps:
	 * 1. User clicked "OutofMemoryError" button.
	 * 2. In request pass argument as Null.
	 * 2. Invoke API
	 * 
	 * Expected Result:
	 * 1. API should return failed message in response.
	 * @throws ServletException 
	 * @throws IOException 
	 * 
	 * */

	@Test
	public void invalidProblemType() throws Exception {

		MockHttpServletRequest request = new MockHttpServletRequest();
		MockHttpServletResponse response = new MockHttpServletResponse();
		
		// 1. Build Request
		request.setParameter(LaunchBuggyAppServlet.BUGGY_APP_TYPE, "");
		
		// 2. Invoke API
		new LaunchBuggyAppServlet().doProcess(request, response);
		
		//3. Assert Response
		Assert.assertTrue(response.getContentAsString().contains("Argument is not valid"));
	}

}
