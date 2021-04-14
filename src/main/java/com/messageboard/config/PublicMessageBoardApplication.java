package com.messageboard.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = { "com.messageboard" })
public class PublicMessageBoardApplication {

	public static void main(String[] args) {
		SpringApplication.run(PublicMessageBoardApplication.class, args);
	}
}
