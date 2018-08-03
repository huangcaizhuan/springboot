package com.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableCaching//开启缓存功能
@ComponentScan(basePackages = "com.boot.*")//很重要，写不对一直404
public class StartApplication {
	public static void main(String[] args) throws Exception {
        SpringApplication.run(StartApplication.class, args);
    }
}
