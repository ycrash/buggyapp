package com.buggyapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.buggyapp.LaunchPad;
import com.buggyapp.cpuspike.CPUSpikerThread;
import com.buggyapp.util.ExceptionUtil;
import com.buggyapp.util.StringUtil;
import com.google.gson.Gson;

public class LaunchBuggyAppServlet extends HttpServlet {
	
	private static final Logger s_logger = LogManager.getLogger(LaunchBuggyAppServlet.class);

	public static final String BUGGY_APP_TYPE = "buggyAppType";
	public static final String SUCCESS_MSG = "Your problem has been processed";
	public static final String FAILED_MSG = "Sorry! Failed to launch bugggy App.";
	public static final String TITLE = "title";
	public static final String DESCRIPTION = "description";
	public static final String FLAG = "flag";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	
	try {
			doProcess(request, response);
		} catch (Exception e) {
			s_logger.error("Failed to launch buggyapp: " + ExceptionUtil.getDetails(e));
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		try {
			doProcess(request, response);
		} catch (Exception e) {
			s_logger.error("Failed to launch buggyapp: " + ExceptionUtil.getDetails(e));
		}
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		
		try {

			String buggyAppTypeParam = request.getParameter(BUGGY_APP_TYPE);
			String flag = request.getParameter(FLAG);
			Boolean booleanFlag = Boolean.parseBoolean(flag);
			
			if(!isInputValid(buggyAppTypeParam, response)) {
				
				return;
			}
			
			//String[] strArray = {buggyAppTypeParam, flag};
			
			// we will endup spawning new thread for each request. Eventually this has to be converted 
			// in to Executor.
			new BuggyAppThread(request, buggyAppTypeParam, booleanFlag).start();
			
			Map<String, String> map = new HashMap<>();
			map.clear();
			switch (buggyAppTypeParam) {
			
			case "bug1":
			case "PROBLEM_OOM":
				if(booleanFlag) {
					map.put(TITLE, "OutOfMemoryError simulation program launched");
					map.put(DESCRIPTION, "Shortly 'OutOfMemoryError' will be reported on the server");
				} else {
					map.put(TITLE, "OutOfMemoryError simulation program terminated");
					map.put(DESCRIPTION, "OutOfMemoryError simulation program terminated on the server.");
				}
				break;
			
			case "bug1.2":
			case "PROBLEM_MEMORY":
				if(booleanFlag) {
					map.put(TITLE, "Memory leak simulation program launched");
					map.put(DESCRIPTION, "Application started to leak memory. OutOfMemoryError will be reported eventually on the server.");
				} else {
					map.put(TITLE, "Memory leak simulation program terminated");
					map.put(DESCRIPTION, "Memory leak simulation program terminated on the server.");
				}
				break;
				
			case "bug3":
			case "PROBLEM_CPU":
				if(booleanFlag) {
					map.put(TITLE, "CPU spike simulation program launched");
					map.put(DESCRIPTION, "Server's CPU will start to spike up.");
				} else {
					map.put(TITLE, "CPU spike simulation program terminated");
					map.put(DESCRIPTION, "Server's CPU will stop to spike up.");
				}
				break;
				
			case "bug4":
			case "PROBLEM_THREADLEAK":
				if(booleanFlag) {
					map.put(TITLE, "Thread Leak simulation program launched");
					map.put(DESCRIPTION, "Soon 'java.lang.OutOfMemoryError: unable to create new native thread' will be reported on the server.");
				} else {
					map.put(TITLE, "Thread Leak simulation program terminated");
					map.put(DESCRIPTION, "Thread Leak simulation program terminated on the server.");
				}
				break;
	
			case "bug5":
			case "PROBLEM_BLOCKED":
				if(booleanFlag) {
					map.put(TITLE, "Blocked Threads simulation program launched");
					map.put(DESCRIPTION, "9 threads are in BLOCKED state on the server.");
				} else {
					map.put(TITLE, "Blocked Threads simulation program terminated");
					map.put(DESCRIPTION, "Blocked Threads simulation program terminated on the server");
				}
				break;
	
			case "bug6":
			case "PROBLEM_DEADLOCK":
				if(booleanFlag) {
					map.put(TITLE, "Deadlock simulation program launched");
					map.put(DESCRIPTION, "Two threads have experienced deadlock on the server.");
				} else {
					map.put(TITLE, "Deadlock simulation program not supported");
					map.put(DESCRIPTION, "Unsuported!");
				}
				break;
	
			case "bug7":
			case "PROBLEM_STACKOVERFLOW":
				if(booleanFlag) {
					map.put(TITLE, "StackOverFlow simulation program launched");
					map.put(DESCRIPTION, "One thread has experienced 'StackOverflowError' on the server.");
				} else {
					map.put(TITLE, "StackOverFlow simulation program terminated");
					map.put(DESCRIPTION, "StackOverFlow simulation program terminated on the server.");
				}
				break;
				
			case "bug8":
			case "PROBLEM_IO":
				if(booleanFlag) {
					map.put(TITLE, "Heavy I/O simulation program launched");
					map.put(DESCRIPTION, "5 threads are repeatedly reading and writing multiple files on the server.");
				} else {
					map.put(TITLE, "Heavy I/O simulation program terminated");
					map.put(DESCRIPTION, "Heavy I/O simulation program terminated on the server.");
				}
				break;				
				
			}
			
			String jsonStr = gson.toJson(map);
			out.print(jsonStr);
			
		} catch(Exception e) {

			// Errors are thrown. So set error message in request.
			s_logger.error("Failed to launch buggyapp: "+ExceptionUtil.getDetails(e));
			out.print(FAILED_MSG);
		}
	}

	protected class BuggyAppThread extends Thread {
		
		HttpServletRequest request;
		String buggyAppTypeParam;
		Boolean booleanFlag;
		
		public BuggyAppThread(HttpServletRequest request, String buggyAppTypeParam, Boolean booleanFlag) {
			
			this.request = request;
			this.buggyAppTypeParam = buggyAppTypeParam;
			this.booleanFlag = booleanFlag;
		}
		
		@Override
		public void run() {
			
			try {
			
				s_logger.info("Buggy App thread started");
				
				if(booleanFlag) {
					//Invoke start method
					LaunchPad.start(buggyAppTypeParam);
				}else {
					//Invoke stop method
					LaunchPad.stop(buggyAppTypeParam);
				}
				
			} catch (Exception e) {
				
				s_logger.error("Failed to doProcess(): " + ExceptionUtil.getDetails(e));
			}			
		}
	}
	
	/**
	 * This method is used to validate inputs
	 * 
	 * */
	public static boolean isInputValid(String buggyAppTypeParam, HttpServletResponse response) throws IOException {

		String message = null;
		
		if (!StringUtil.isValid(buggyAppTypeParam)) {
			
			message = "Argument is not valid";
		}

		if (StringUtil.isValid(message)) {

			response.getWriter().print(message);
			//res.setStatus(Boolean.FALSE);
    		
    		return Boolean.FALSE;
		}
		
		return Boolean.TRUE;
	}
}
