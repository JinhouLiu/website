package com.website.web.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.website.entity.system.User;
import com.website.service.system.IUserService;
import com.website.utils.Page;

@Controller
public class UserController {
	@Resource(name = "IUserService")
	private IUserService iUserService;

	/**
	 * 检查账户是否存在
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/checkAccount")
	@ResponseBody
	public Map<String, Object> checkStaffId(@RequestParam String username) {
		Map<String, Object> modelMap = new HashMap<String, Object>(1);
		int count = 0;
		count = iUserService.getCountByAccount(username);
		modelMap.put("count", count);
		return modelMap;
	}
	
	@RequestMapping(value = "/listUser", method = RequestMethod.GET)
	public ModelAndView listUser(Model model, Page page,HttpServletRequest request) {

		List<User> users = iUserService.listUser(page);
		page.setRows(iUserService.findRows());
		model.addAttribute("Page", page);
		HttpSession session=request.getSession();
		session.setAttribute("currentPage",page.getCurrentPage());
		return new ModelAndView("tuser", "users", users);
	}

	
	//删除用户id
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET)
	public String  deleteUser(@PathVariable Integer id, HttpServletRequest request,Model model) {
		iUserService.delete(id);		
		HttpSession session=request.getSession();
		return "redirect:/listUser.action?currentPage="+session.getAttribute("currentPage");
	}	
}
