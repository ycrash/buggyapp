package com.buggyapp.diskspace;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.FileStore;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;

public class DiskSpaceService {
	private static final Integer ONE_MB = 1024 * 1024;

	/**
	 * Fills the specified disk space on the given drive with a test file, using a
	 * specified percentage of available space.
	 *
	 * @param drive          The drive on which to fill the disk space.
	 * @param percentageFill The percentage of available space to fill.
	 */
	public static void fillDiskSpace(String drive, Integer percentageFill) {
		String filePath = drive + "/tier1testfile";
		// Create a File object with the specified file path
		deleteFile(drive);
		// Check available space on the drive
		long availableSpaceInBytes = getAvailableSpace(drive);
		long fileSizeInBytes = (long) ((availableSpaceInBytes * percentageFill) / 100);
		byte[] data = generateRandomData(ONE_MB);

		System.out.println("availableSpaceInBytes " + availableSpaceInBytes + " fileSizeInBytes " + fileSizeInBytes);

		Integer noOfInterations = (int) fileSizeInBytes / ONE_MB;
		for (Integer iteration = 0; iteration < noOfInterations + 1; iteration++) {
			try (FileOutputStream fos = new FileOutputStream(filePath, true)) {
				fos.write(data);

			} catch (IOException e) {
				System.out.println("Error " + e.getMessage());

				e.printStackTrace();
			}
		}
		System.out.println("File created successfully occupying " + percentageFill + "%");
	}

	public static void deleteFile(String drive) {
		String filePath = drive + "/tier1testfile";
		Path path = Paths.get(filePath);
		try {
			// Delete the file
			Files.delete(path);
			System.out.println("File deleted successfully.");
		} catch (IOException e) {
			System.out.println("File not available "+filePath);
		}
	}

	private static byte[] generateRandomData(int size) {
		byte[] data = new byte[size];
		new Random().nextBytes(data);
		return data;
	}

	/**
	 * Retrieves the available space on the specified drive.
	 *
	 * @param drive The drive for which to retrieve available space.
	 * @return The available space on the drive in bytes, or -1 if an error occurs.
	 */
	private static long getAvailableSpace(String drive) {
		try {
			FileStore fileStore = Files.getFileStore(FileSystems.getDefault().getPath(drive));
			return fileStore.getUsableSpace();
		} catch (IOException e) {
			System.out.println("Error getting available space: " + e.getMessage());
			return -1;
		}
	}

}
