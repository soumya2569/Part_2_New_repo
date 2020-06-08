package com.main.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class view {
	@GetMapping("/")
	public String page()
	{
		System.out.println("sad");
		return "index2";
	}
}
