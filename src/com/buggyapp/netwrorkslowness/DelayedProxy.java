package com.buggyapp.netwrorkslowness;

import java.io.*;
import java.net.*;

public class DelayedProxy {

    // Configuration
    private static final int PROXY_PORT = 9999;                // Proxy listens here
    private static final String TARGET_HOST = "httpbin.org";   // Target server
    private static final int TARGET_PORT = 80;                 // Target server port
    private static final int LATENCY_MS = 200;                 // Delay in ms

    public static void main(String[] args) throws IOException {
    }

    public static void start() throws Exception {
        ServerSocket proxyServer = new ServerSocket(PROXY_PORT);
        System.out.println("Proxy listening on port " + PROXY_PORT);

        while (true) {
            Socket clientSocket = proxyServer.accept();
            System.out.println("Client connected: " + clientSocket.getInetAddress());

            // Connect to real target server
            Socket targetSocket = new Socket(TARGET_HOST, TARGET_PORT);
            System.out.println("Connected to " + TARGET_HOST + ":" + TARGET_PORT);

            // Forward in both directions
            new Thread(() -> forwardWithDelay(clientSocket, targetSocket)).start();
            new Thread(() -> forwardWithDelay(targetSocket, clientSocket)).start();
        }

    }
    
    
    private static void forwardWithDelay(Socket inputSocket, Socket outputSocket) {
        try (
            InputStream in = inputSocket.getInputStream();
            OutputStream out = outputSocket.getOutputStream()
        ) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                // Introduce artificial delay
                Thread.sleep(LATENCY_MS);
                out.write(buffer, 0, bytesRead);
                out.flush();
            }
        } catch (IOException | InterruptedException e) {
            // Connection closed or error occurred
        } finally {
            try { inputSocket.close(); } catch (IOException ignored) {}
            try { outputSocket.close(); } catch (IOException ignored) {}
        }
    }
}
