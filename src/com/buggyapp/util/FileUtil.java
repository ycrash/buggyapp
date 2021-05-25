package com.buggyapp.util;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;

/**
 * 
 * @author Ram Lakshmanan
 */
public class FileUtil {

	public static File createDirectory(String dir) {
		
		try {

			if (dir == null) {
				return null;
			}
	        // creates the save directory if it does not exists
	        File fileSaveDir = new File(dir);
	        File fileSaveAbsDir = fileSaveDir.getAbsoluteFile();
	        if (!fileSaveAbsDir.exists()) {
	        	fileSaveAbsDir.mkdirs();
	        }
	        
			return fileSaveAbsDir.getAbsoluteFile();
		} catch (Exception e) {
			
			System.out.println("Failed to create directory " + ExceptionUtil.getDetails(e));
		}
		
		return null;
	}	
	
	public static void write(String filePath, String reportString) {
		
		try {

			File file = new File(filePath);
			createDirectory(file.getParent());
			
			Files.write(Paths.get(filePath), reportString.getBytes());
		} catch (Exception e) {
			
			System.out.println("Failed to write to filePath: " + filePath + ", " + ExceptionUtil.getDetails(e));
		}
	}
	
	public static String read(String filePath) {
		
        StringBuilder contentBuilder = new StringBuilder();
 
        try (Stream<String> stream = Files.lines( Paths.get(filePath), StandardCharsets.UTF_8)) {
        	
            stream.forEach(s -> contentBuilder.append(s).append("\n"));
        } catch (IOException e) {
        	
            e.printStackTrace();
        }
 
        return contentBuilder.toString();
    }	
	

}
