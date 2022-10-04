package com.oy.springStudy.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oy.springStudy._common.MultipartUpload;
import com.oy.springStudy.product.model.dao.ProductDAO;
import com.oy.springStudy.product.model.dto.ProductDTO;
import com.oy.springStudy.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Inject
	//ProductDAO productDao;
	ProductService productDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<ProductDTO> list = productDao.getSelectAll();
		String title = "상품 목록";
		model.addAttribute("title", title);
		model.addAttribute("product", list);
		return "product/list";
	}
	
	@RequestMapping("/view")
	public String view(Model model, @ModelAttribute ProductDTO param) {
		ProductDTO dto = productDao.getSelectOne(param);
		String title = "상품 상세보기";
		model.addAttribute("title", title);
		model.addAttribute("dto", dto);
		return "product/view";
	}
	
	@RequestMapping("/regi")
	public String regi(Model model) {
		String title = "상품 등록";
		model.addAttribute("title", title);
		return "product/regi";
	}
	
	@RequestMapping("/regiAttach")
	public String regiAttach(Model model) {
		
		String title = "상품등록(Attach)";
		model.addAttribute("title", title);
		return "product/regiAttach";
	}
	
	@RequestMapping("/edit")
	public String edit(Model model, @ModelAttribute ProductDTO param) {
		ProductDTO dto = productDao.getSelectOne(param);
		
		String title = "상품 수정";
		model.addAttribute("title", title);
		model.addAttribute("dto", dto);
		return "product/edit";
	}
	
	@RequestMapping("/drop")
	public String drop(Model model, @ModelAttribute ProductDTO param) {
		ProductDTO dto = productDao.getSelectOne(param);
		
		String title = "상품 삭제";
		model.addAttribute("title", title);
		model.addAttribute("dto", dto);
		return "product/drop";
	}
	
	
	// =============== process ================
	@RequestMapping("/regiProc")
	public String regiProc(Model model, @ModelAttribute ProductDTO param) {
		int result = productDao.setInsert(param);
		if(result > 0) {
			return "redirect:/product/list";
		} else {
			return "redirect:/product/regi";
		}
	}
	
	@RequestMapping("/regiAttachProc")
	public String regiAttachProc(Model model, @ModelAttribute ProductDTO param, HttpServletRequest req, @RequestParam("file") List<MultipartFile> multiFileList) {
		
		MultipartUpload mu = new MultipartUpload();
		List<String> list = mu.attachProc(multiFileList, "/springStudy/product");
		
		String attachInfo = "";
		for(int i=0; i<list.size(); i++) {
			attachInfo += "|" + list.get(i);
		}
		attachInfo = attachInfo.substring(1);
		param.setAttachInfo(attachInfo);
		
		int result = productDao.setInsert(param);
		if(result > 0) {
			return "redirect:/product/list";
		} else {
			return "redirect:/product/regiAttach";
		}
	}
	
	@RequestMapping("/editProc")
	public String editProc(Model model, @ModelAttribute ProductDTO param) {
		int result = productDao.setUpdate(param);
		if(result > 0) {
			return "redirect:/product/view?productNo=" + param.getProductNo();
		} else {
			return "redirect:/product/edit?productNo=" + param.getProductNo();
		}
	}
	
	@RequestMapping("/dropProc")
	public String dropProc(Model model, @ModelAttribute ProductDTO param) {
		int result = productDao.setDelete(param);
		if(result > 0) {
			return "redirect:/product/list";
		} else {
			return "redirect:/product/drop?productNo=" + param.getProductNo();
		}
	}
	
}