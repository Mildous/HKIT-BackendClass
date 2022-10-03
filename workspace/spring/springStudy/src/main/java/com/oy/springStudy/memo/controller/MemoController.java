package com.oy.springStudy.memo.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oy.springStudy.memo.model.dao.MemoDAO;
import com.oy.springStudy.memo.model.dto.MemoDTO;
import com.oy.springStudy.memo.service.MemoService;

@Controller
@RequestMapping("/memo")
public class MemoController {
	
	@Inject
	MemoDAO memoDao;
	
	@Inject
	MemoService memoService;
	
	int imsiProcGubun = 0;	//imsiProcGubun = 0: dao, 1: service
	
	@RequestMapping("/list")
	public String list(Model model) {
		String title = "메모목록";
		List<MemoDTO> list;
		
		if(imsiProcGubun == 0) {
			list = memoDao.getSelectAll();
		} else {
			list = memoService.getSelectAll();
		}
		model.addAttribute("title", title);
		model.addAttribute("memo", list);
		return "memo/list";
	}
	
	@RequestMapping("/view")
	public String view(Model model, @ModelAttribute MemoDTO arguDto) {
		MemoDTO returnDto;
		if(imsiProcGubun == 0) {
			returnDto = memoDao.getSelectOne(arguDto);
		} else {
			returnDto = memoService.getSelectOne(arguDto);
		}
		String title = "메모정보";
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		return "memo/view";
	}
	
	@RequestMapping("/regi")
	public String regi(Model model) {
		String title = "메모등록";
		model.addAttribute("title", title);
		return "memo/regi";
	}
	
	@RequestMapping("/edit")
	public String edit(Model model, @ModelAttribute MemoDTO arguDto) {
		MemoDTO returnDto = memoDao.getSelectOne(arguDto);
		
		String title = "메모수정";
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		return "memo/edit";
	}
	
	@RequestMapping("/drop")
	public String drop(Model model, @ModelAttribute MemoDTO arguDto) {
		MemoDTO returnDto = memoDao.getSelectOne(arguDto);
		
		String title = "메모삭제";
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		return "memo/drop";
	}
	
	//==========================================
	
	@RequestMapping("/regiProc")
	public String regiProc(Model model, @ModelAttribute MemoDTO arguDto) {
		int result = memoDao.setInsert(arguDto);
		if(result > 0) {
			return "redirect:/memo/list";
		} else {
			return "redirect:/memo/regi";
		}
	}
	
	@RequestMapping("/editProc")
	public String editProc(Model model, @ModelAttribute MemoDTO arguDto) {
		int result = memoDao.setUpdate(arguDto);
		if(result > 0) {
			return "redirect:/memo/view?no=" + arguDto.getNo();
		} else {
			return "redirect:/memo/edit?no=" + arguDto.getNo();
		}
	}
	
	@RequestMapping("/dropProc")
	public String dropProc(Model model, @ModelAttribute MemoDTO arguDto) {
		int result = memoDao.setDelete(arguDto);
		if(result > 0) {
			return "redirect:/memo/list";
		} else {
			return "redirect:/memo/drop?no=" + arguDto.getNo();
		}
	}

}
