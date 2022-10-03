package com.oy.springStudy._test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping("/test01")	// http://localhost:8091/springStudy/test01
	public String test01() {
		return "_test/test01/exam01";	// /WEB-INF/views/_test/test01/exam01.jsp
	}
	
	
	@RequestMapping("/test01Proc")
	public String test01Proc(
			Model model, 
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="jumin", defaultValue="") String jumin
		) {
		//System.out.println(name + ", " + jumin);
		model.addAttribute("name", name);
		model.addAttribute("jumin", jumin);
		return "_test/test01/exam01Result";
	}

	/* =========================================================== */
	
	
	@RequestMapping("/test02")
	public String test02() {
		return "_test/test02/exam01";
	}
	
	@RequestMapping("/test02Proc")
	public String test02Proc(
			Model model, 
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="gender", defaultValue="") String gender,
			@RequestParam(value="jumin", defaultValue="") String jumin
		) {
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("jumin", jumin);
		model.addAttribute("title", "테스트02 Result");
		return "_test/test02/exam01Result";
	}

	/* =========================================================== */
	
	@RequestMapping("/test03")
	public String test03(Model model) {
		model.addAttribute("title", "테스트03");
		return "_test/test03/exam01";
	}
	
	@RequestMapping("/test03Proc")
	public String test03Proc(
			Model model, 
			HttpServletRequest req
		) {
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String jumin = req.getParameter("jumin");
		int age = Integer.parseInt(req.getParameter("age"));
		
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("gender", gender);
		map.put("jumin", jumin);
		map.put("age", age);
		map.put("title", "테스트03 Result");
		
		model.addAttribute("map", map);
		return "_test/test03/exam01Result";
	}
	
	/* =========================================================== */
	
	@RequestMapping("/test04")
	public String test04(Model model) {
		model.addAttribute("title", "테스트04");
		return "_test/test04/exam01";
	}
	
	@RequestMapping("/test04Proc")
	public String test04Proc(
			Model model, 
			@ModelAttribute Test04DTO dto
		) {
		
		String name = dto.getName();
		String gender = dto.getGender();
		String jumin = dto.getJumin();
		int age = dto.getAge();
		
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("gender", gender);
		map.put("jumin", jumin);
		map.put("age", age);
		map.put("title", "테스트04 Result");
		
		model.addAttribute("map", map);
		return "_test/test04/exam01Result";
	}

	/* =========================================================== */
	
	@RequestMapping("/test05")
	public String test05(Model model) {
		model.addAttribute("title", "테스트05");
		return "_test/test05/exam01";
	}
	
	@RequestMapping("/test05Proc")
	public String test05Proc(
			Model model, 
			@ModelAttribute Test05DTO dto
		) {
		
		String name = dto.getName();
		int kor = dto.getKor();
		int eng = dto.getEng();
		int mat = dto.getMat();
		int sci = dto.getSci();
		int his = dto.getHis();
		
		int tot = kor + eng + mat + sci + his;
		double avg = tot / 5.0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("kor", kor);
		map.put("eng", eng);
		map.put("mat", mat);
		map.put("sci", sci);
		map.put("his", his);
		map.put("tot", tot);
		map.put("avg", avg);
		map.put("title", "테스트05 Result");
		
		model.addAttribute("map", map);
		return "_test/test05/exam01Result";
	}
	
	/* =========================================================== */
	
	@RequestMapping("/test06")
	public String test06(Model model) {
		model.addAttribute("title", "테스트06");
		return "_test/test06/exam01";
	}
	
	@RequestMapping("/test06Proc")
	public String test06Proc(
			Model model, 
			@ModelAttribute Test06DTO dto
		) {
		
		String productCate = dto.getProductCate();
		String productName = dto.getProductName();
		int productPrice = dto.getProductPrice();
		int salesPercent = dto.getSalesPercent();
		String vendor = dto.getVendor();
		
		dto.setSalesPrice(dto.getProductPrice() - (dto.getProductPrice() * dto.getSalesPercent()) / 100);

		model.addAttribute("title", "테스트06 Result");
		model.addAttribute("dto", dto);
		return "_test/test06/exam01Result";
	}
	
	/* =========================================================== */
	
	
	@RequestMapping("/test07")
	public String test07(Model model) {
		model.addAttribute("title", "테스트07");
		return "_test/test07/exam01";
	}
	
	@RequestMapping("/test07Proc")
	public ModelAndView test07Proc(
			Model model, 
			@ModelAttribute Test07DTO dto
		) {
		
		dto.setSalesPrice(dto.getProductPrice() - (dto.getProductPrice() * dto.getSalesPercent()) / 100);
		
		String title = "테스트07 Result";
		
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("dto", dto);
		
		//model.addAttribute("map", map);
		
		return new ModelAndView("_test/test07/exam01Result", "map", map);
	}
	
	/* =========================================================== */
	
	@RequestMapping("/test08")
	public String test08(Model model) {
		model.addAttribute("title", "테스트08");
		return "_test/test08/exam01";
	}
	
	@RequestMapping("/test08Proc")
	public String test08Proc(
			Model model, 
			String id,
			String passwd
		) {
		
		String dbid = "hong";
		String dbpw = "1234";
		
		String result = "";
		if(id.equals(dbid) && passwd.equals(dbpw)) {
			result = "로그인 성공";
		} else {
			result = "로그인 실패";
		}
		
		String title = "테스트08 Result";
		
		model.addAttribute("title", title);
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		
		return "_test/test08/exam01Result";
	}
	
	/* =========================================================== */
	

	@RequestMapping("/test09")
	public String test09(Model model) {
		model.addAttribute("title", "테스트09");
		return "_test/test09/exam01";
	}
	
	@RequestMapping("/test09Proc")
	public @ResponseBody Map<String, String> test09Proc(
			Model model, 
			String id,
			String name,
			String email
		) {
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		return map;
	}
	
	/* =========================================================== */
	
	@RequestMapping("/test10")
	public String test10(Model model) {
		String attachPath = "C:/Users/HKIT/COY/attach";
		String uploadPath = attachPath + "/imsi";
		
		ArrayList<String> list = new ArrayList<>();
		
		java.io.File f1 = new java.io.File(uploadPath);
		java.io.File[] array = f1.listFiles();
		for(int i=0; i<array.length; i++) {
			String imsi = "";
			if(array[i].isFile()) {
				imsi = "파일^" + array[i].getPath();
			} else {
				imsi = "폴더^" + array[i].getPath();
			}
			list.add(imsi);
		}
		
		model.addAttribute("title", "테스트10");
		model.addAttribute("list", list);
		return "_test/test10/exam01";
	}
	
	@RequestMapping("/test10Proc")
	public String test10Proc(Model model, HttpServletRequest req) {
		String fileInfo = req.getParameter("fileInfo");
		
		java.io.File f1 = new java.io.File(fileInfo);
		if(f1.exists()) {
			f1.delete();
		} else {
			System.out.println("존재하지 않습니다..");
		}
		
		return "redirect:/test10";
	}
}
