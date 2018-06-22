package com.boot.startupRunner;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.boot.impl.manage.ManagerServiceImpl;
import com.boot.model.manage.Manager;
import com.boot.tools.util.security.MD5;


/**
 * 该类可以在springboot启动是, 进行操作
 * @Order: 启动时执行的顺序, 小的优先执行
 */

@Component
@Order(value=2)
public class BootStartupRunner implements CommandLineRunner{
	
	@Autowired
	private ManagerServiceImpl  managerService;

	@Override
	public void run(String... arg0) throws Exception {
		System.out.println("执行初始化....................");
		
		//获取超级管理员
		Manager manger = managerService.getById(new BigDecimal("100"));
		if(manger == null) {
			manger = new Manager();
			manger.setName("超级管理员");
			manger.setUserName("system");
			manger.setPassword(MD5.digest("a123456"));
			manger.setId(new BigDecimal("100"));
			managerService.save(manger);
		}
		
		System.out.println("执行完成....................");
	}

}
