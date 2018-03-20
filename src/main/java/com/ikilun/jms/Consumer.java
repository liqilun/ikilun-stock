package com.ikilun.jms;

import org.springframework.jms.annotation.JmsListener;

//@Component
public class Consumer {
    @JmsListener(destination = "ikiQueue")
    public void receiveQueue(String text) {
        System.out.println(text);
    }
}
