package com.buggyapp.netwrorkslowness;

import java.io.IOException;
import java.io.InputStream;

/*
 * This simulates a delay in the network while reading from the
 * input stream. This network delay can be monitored using 
 * lsof or other similar commands
 */
public class ThrottledInputStream extends InputStream {

	private final InputStream in;
    private final int bytesPerSecond;

    public ThrottledInputStream(InputStream in, int bytesPerSecond) {
        this.in = in;
        this.bytesPerSecond = bytesPerSecond;
    }

    @Override
    public int read() throws IOException {
        throttle(1);
        return in.read();
    }

    @Override
    public int read(byte[] b, int off, int len) throws IOException {
        int maxChunkSize = Math.min(len, 1024); // Read in chunks up to 1KB
        int bytesRead = in.read(b, off, maxChunkSize);
        if (bytesRead > 0) {
            throttle(bytesRead);
        }
        return bytesRead;
    }

    /*
     * simulating a delay in the network while reading the bytes from the input stream
     * 
     */
    private void throttle(int bytesRead) {
        if (bytesPerSecond > 0) {
            long delay = (bytesRead * 1000L) / bytesPerSecond; // milliseconds
            try {
                Thread.sleep(delay);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    @Override
    public void close() throws IOException {
        in.close();
    }
}