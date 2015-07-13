package com.website.web.system;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.website.service.system.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource(name = "IUserService")
	private IUserService iUserService;

	/*
	 * @RequestMapping(value = "/add", method = RequestMethod.POST)
	 * public @ResponseBody User add(HttpServletRequest request,
	 * HttpServletResponse response) throws Exception {
	 * 
	 * User employee = new User();
	 * 
	 * String userName = request.getParameter("userName"); String userPwd =
	 * request.getParameter("userPwd"); String userEmail =
	 * request.getParameter("userEmail");
	 * 
	 * employee.setUserEmail(userEmail); employee.setUserName(userName);
	 * employee.setUserPwd(userPwd);
	 * 
	 * return employee; }
	 */
		
	/**
	 * ºÏ≤È’À∫≈ «∑Ò¥Ê‘⁄
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/checkAccount")
	@ResponseBody
	public Map<String, Object> checkStaffId(@RequestParam Integer account) {
		Map<String, Object> modelMap = new HashMap<String, Object>(1);
		int count = 0;
		count = iUserService.getCountByAccount(account);
		modelMap.put("count", count);
		return modelMap;
	}
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView welcome(ModelAndView model) {

		
		
		System.out.println("hello");
		
		model.addObject("title", "Welcome - Spring Security Hello World");
		model.addObject("message", "This is welcome page!");
		model.setViewName("hello");
		return model;

	}
	
}
