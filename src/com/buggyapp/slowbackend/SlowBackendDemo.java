package com.buggyapp.slowbackend;

public class SlowBackendDemo {

    /** default number for fibonacci **/
    private final int FIB_NUMBER = 1000;

    public static void main(String[] args) {
        SlowBackendDemo slowBackendDemo = new SlowBackendDemo();
        slowBackendDemo.start();
    }

    public void start() {
        System.out.println("processing fibonacci number for " + FIB_NUMBER);
        System.out.println(fibonacci(FIB_NUMBER));
    }

    /**
     * this is a naive implementation for fibonacci number
     * The complexity is very high (OX2^n)
     * This execution will eat a lot of CPU as there is no memoization technique is applied
     * The overall execution time is very high. If there are many requests made to this method,
     * then the backend will be very slow as a lot of CPU is required.
     *
     * This can be a common problem for a bad code
     *
     * @param n
     * @return
     */
    public long fibonacci(int n) {
        if (n <= 1) return n;
        return fibonacci(n - 1) + fibonacci(n - 2);
    }

}
