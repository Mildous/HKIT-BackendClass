package com.oy.springStudy.guestBook.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oy.springStudy.guestBook.model.dao.GuestBookDAO;
import com.oy.springStudy.guestBook.model.dto.GuestBookDTO;

@Controller
@RequestMapping("/guestBook")
public class GuestBookController {
	
	@Inject
	GuestBookDAO guestBookDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<GuestBookDTO> list = guestBookDao.getSelectAll();
		String title = "방명록 목록";
		model.addAttribute("title", title);
		model.addAttribute("guestBook", list);
		return "guestBook/list";
	}
	
	@RequestMapping("/view")
	public String view(Model model, @ModelAttribute GuestBookDTO param) {
		GuestBookDTO dto = guestBookDao.getSelectOne(param);
		String title = "방명록 상세보기";
		model.addAttribute("title", title);
		model.addAttribute("dto", dto);
		return "guestBook/view";
	}
	
	@RequestMapping("/regi")
	public String regi(Model model) {
		String title = "방명록 등록";
		model.addAttribute("title", title);
		return "guestBook/regi";
	}
	
	@RequestMapping("/edit")
	public String edit(Model model, @ModelAttribute GuestBookDTO param) {
		GuestBookDTO dto = guestBookDao.getSelectOne(param);
		
		String title = "방명록 수정";
		model.addAttribute("title", title);
		model.addAttribute("dto", dto);
		return "guestBook/edit";
	}
	
	@RequestMapping("/drop")
	public String drop(Model model, @ModelAttribute GuestBookDTO param) {
		GuestBookDTO dto = guestBookDao.getSelectOne(param);
		
		String title = "방명록 삭제";
		model.addAttribute("title", title);
		model.addAttribute("dto", dto);
		return "guestBook/drop";
	}
	
	
	// =============== process ================
	@RequestMapping("/regiProc")
	public String regiProc(Model model, @ModelAttribute GuestBookDTO param) {
		int result = guestBookDao.setInsert(param);
		if(result > 0) {
			return "redirect:/guestBook/list";
		} else {
			return "redirect:/guestBook/regi";
		}
	}
	
	@RequestMapping("/editProc")
	public String editProc(Model model, @ModelAttribute GuestBookDTO param) {
		int result = guestBookDao.setUpdate(param);
		if(result > 0) {
			return "redirect:/guestBook/view?no=" + param.getNo();
		} else {
			return "redirect:/guestBook/edit?no=" + param.getNo();
		}
	}
	
	@RequestMapping("/dropProc")
	public String dropProc(Model model, @ModelAttribute GuestBookDTO param) {
		int result = guestBookDao.setDelete(param);
		if(result > 0) {
			return "redirect:/guestBook/list";
		} else {
			return "redirect:/guestBook/drop?no=" + param.getNo();
		}
	}
	
	
}