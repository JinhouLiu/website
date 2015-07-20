package com.website.entity.system;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Demo {
public static  void   main(String[]  args)
{
	
	int i = 0;
	while (i < 10) {
		String password = "liuziyang";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
 
		System.out.println(hashedPassword);
		i++;
	}

}	
	
}
