package com.boot.service;

import javax.annotation.Resource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.boot.mapper.UserMapper;
import com.boot.model.User;
/**
 * 业务层实现类
 * @author Administrator
 *
 */

@Service("userService")
@ComponentScan({"com.boot.mapper"})
public class UserService implements UserIService {

	@Resource 
	private UserMapper userMapper;
	
	@Override
	public void insert(User user) {
		userMapper.insert(user);
	}

	@Override
	public void delete(int id) {
		userMapper.delete(id);
		
	}

	@Override
	public void edit(User user) {
		userMapper.edit(user);		
	}

	@Override
	public User find(int id) {
		return userMapper.find(id);
	}

}
