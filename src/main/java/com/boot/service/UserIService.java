package com.boot.service;

import com.boot.model.User;

/**
 * 业务层接口
 * @author Administrator
 *
 */
public interface UserIService {
	
	void insert(User user);
	void delete(int id);
	void edit(User user);
	User find(int id);
}
