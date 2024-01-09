package com.buggyapp.diskspace;

public class DiskSpaceDemo {

	public static void fillSpace(String drive, Integer percentageFill) {
		DiskSpaceService.fillDiskSpace(drive, percentageFill);
	}
	public static void delete(String drive) {
		DiskSpaceService.deleteFile(drive);
	}

}
