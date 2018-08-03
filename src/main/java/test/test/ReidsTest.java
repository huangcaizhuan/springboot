package test;


import org.springframework.beans.factory.annotation.Autowired;

import com.boot.myRedis.RedisUtil;

public class ReidsTest {
	
	@Autowired
	private static RedisUtil redis;

	public static void main(String[] args) {
		redis.set("name", "kity");
		redis.set("age", 25);
		
		System.out.println(redis.get("name"));
	}
}
