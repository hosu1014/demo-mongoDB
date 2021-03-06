package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	
	@RequestMapping("/hello.do")
	public String sayHello() {
		
		return "hello";
	}
	
	@RequestMapping("/{jspName}/vue.do")
	public String viewVue1(@PathVariable String jspName ) {
		return "vue/".concat(jspName);
	}
}
