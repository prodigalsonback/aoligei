package com.chenyr.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chenyr.entity.User;
import com.chenyr.service.IUserService;

@Controller
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("reg.do")
	public String reg(HttpSession session){
		if(session.getAttribute("usid")!=null){
			return "home";
		}
		return "reg";
	}
	
	@RequestMapping("login.do")
	public String login(HttpSession session){
		if(session.getAttribute("usid")!=null){
			return "home";
		}
		return "login";
	}
	
	@RequestMapping("homePage.do")
	public String goHomePage(){
		return "home";
	}
	
	@RequestMapping("handleReg.do")
	@ResponseBody
	public HashMap<String,Integer> handleReg(@RequestParam("username")String username,
			@RequestParam("password")String password,HttpSession session){
	    HashMap<String, Integer> r=new HashMap<String, Integer>();
	   /* if(!(username.matches("^[\\u4e00-\\u9fa5_a-zA-Z0-9_]{4,8}$"))){
	    	r.put("state",1);
	    	return r;
	    }
	    if(!(password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,12}$"))){
	    	r.put("state",2);
	    	return r;
	    }*/
	    User user=userService.findUserByUsername(username);
	    if(user!=null){
	    	r.put("state",1);
	    	return r;
	    }
	    User u=new User();
	    u.setUsename(username);
	    u.setPasword(password);
	    Integer rows=userService.reg(u);
	    if(rows==1){
	    	r.put("state",2);
	    	User uback=userService.findUserByUsername(username);
	    	session.setAttribute("usid",uback.getId());
	    	session.setAttribute("uname",username);
	    	uback=null;
	    	return r;
	    }else{
	    	r.put("state",3);
	    	return r;
	    }
	}
	
	@RequestMapping("handleLogin.do")
	@ResponseBody
	public HashMap<String,Integer> handleLogin(@RequestParam("username")String username,
			@RequestParam("password")String password,HttpSession session){
	    HashMap<String, Integer> r=new HashMap<String, Integer>();
	    User user=userService.findUserByUsername(username);
	    if(user==null){
	    	r.put("state",1);
	    	return r;
	    }
	    String str=DigestUtils.md5DigestAsHex(password.getBytes()).toUpperCase();
		String str2=str+"randomsalt";
		String md5Pass=DigestUtils.md5DigestAsHex(str2.getBytes()).toUpperCase();
		if(md5Pass.equals(user.getPasword())){
			r.put("state",2);
			session.setAttribute("usid", user.getId());
			session.setAttribute("uname", user.getUsename());
	    	return r;
		}else{
	    	r.put("state",3);
	    	return r;
	    }
	}
}
