package com.chenyr.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chenyr.entity.InnerTribune;
import com.chenyr.entity.OutterTribune;
import com.chenyr.service.IInnerTribuneService;
import com.chenyr.service.IOutterTribuneService;

@Controller
public class OutterController {
	@Autowired
	private IOutterTribuneService outterTribuneService;
	@Autowired
	private IInnerTribuneService innerTribuneService;
	@RequestMapping("tribune.do")
	public String getTribuneList(@RequestParam("tid")Integer tid,ModelMap modelMap){
		modelMap.addAttribute("tid",tid);
		List<OutterTribune> outterTribunes=outterTribuneService.getOutterTribuneList(tid);
		modelMap.addAttribute("outterTribunes",outterTribunes);
		return "tribune";
	}
	@RequestMapping("addicomments.do")
	@ResponseBody
	public HashMap<String, Integer> addIutComments(@RequestParam("oid")Integer oid,
			@RequestParam("iuname")String iuname,@RequestParam("iuip")String iuip,
			@RequestParam("iuagent")String iuagent,@RequestParam("createdTimeInner")String createdTimeInner,
			@RequestParam("icomment")String icomment){
		HashMap<String, Integer> r=new HashMap<String, Integer>();
		InnerTribune innerTribune=new InnerTribune();
		innerTribune.setOid(oid);
		innerTribune.setIuname(iuname);
		innerTribune.setIuip(iuip);
		innerTribune.setIuagent(iuagent);
		innerTribune.setCreatedTimeInner(createdTimeInner);
		innerTribune.setIcomment(icomment);
		Integer rows=innerTribuneService.addiComments(innerTribune);
		if(rows==1){
			r.put("state", 1);
		}else{
			r.put("state", 0);
		}
		return r;
	}
	
	@RequestMapping("addocomments.do")
	@ResponseBody
	public HashMap<String, Integer> addOutComments(@RequestParam("tid")Integer tid,
			@RequestParam("uname")String uname,@RequestParam("uip")String uip,
			@RequestParam("uagent")String uagent,@RequestParam("createdTime")String createdTime,
			@RequestParam("comment")String comment){
		HashMap<String, Integer> r=new HashMap<String, Integer>();
		OutterTribune outterTribune=new OutterTribune();
		outterTribune.setTid(tid);
		outterTribune.setUname(uname);
		outterTribune.setUip(uip);
		outterTribune.setUagent(uagent);
		outterTribune.setCreatedTime(createdTime);
		outterTribune.setComment(comment);
		Integer rows=outterTribuneService.addoComments(outterTribune);
		if(rows==1){
			r.put("state", 1);
		}else{
			r.put("state", 0);
		}
		return r;
	}
	
	
}
