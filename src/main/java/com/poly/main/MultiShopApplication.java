package com.poly.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MultiShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(MultiShopApplication.class, args);
	}

}
