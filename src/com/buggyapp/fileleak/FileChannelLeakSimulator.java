package com.buggyapp.fileleak;

import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.List;

public class FileChannelLeakSimulator {

    public static void main(String[] args) throws Exception {
    	FileChannelLeakSimulator fileChannelLeakSimulator = new FileChannelLeakSimulator();
    	fileChannelLeakSimulator.start();
    }
    
    /*
     * The following code creates 1 million file channel without closing them
     * this will simulate the file resource leak.
     */
    public void start() throws Exception {
        List<FileChannel> openChannels = new ArrayList<>();

        for (int i = 0; i < 1000000; i++) {
            RandomAccessFile raf = new RandomAccessFile("leaktest_" + i + ".tmp", "rw");
            FileChannel channel = raf.getChannel();
            openChannels.add(channel); // Not closing the channel!

            if (i % 100 == 0) {
                System.out.println("Opened " + i + " channels");
                Thread.sleep(40);
            }
        }
        System.out.println("Finished creating channels");
    }
}
