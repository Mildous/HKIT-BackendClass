package com.oy.springStudy._index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("insa", "안녕하세요~");
		return "_home/index";
	}

}
