package org.cskj.demo2.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.cskj.demo2.bean.Category;
import org.cskj.demo2.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class CategoruController {

	@Autowired
	private CategoryService categoryservice;
	
	@RequestMapping("/list")
	public ModelAndView queryAll(Model m,String currentPage) {
		currentPage = currentPage == null ? "1" : currentPage;
		PageHelper.offsetPage((Integer.parseInt(currentPage) - 1) * 3, 3);
		List<Category> list= categoryservice.queryAll();
		PageInfo<Category> pageInfo = new PageInfo<Category>(list);
		ModelAndView mv = new ModelAndView("/category/list");
		mv.addObject("pageInfo", pageInfo);
		return mv;
	}
	
	@RequestMapping("/toadd")
	public String toadd() {
		return "/category/add";
	}
	
	@RequestMapping("/add")
	public void addCategory(HttpServletResponse response,Category cate) throws IOException {
		System.out.println(cate);
		int i = categoryservice.addCategory(cate);
		response.getWriter().print(i>0);
	}
	
	@RequestMapping("delete")
	public void deleteCategory(int id,HttpServletResponse response) throws IOException {
		int i = categoryservice.deleteCategory(id);
		response.getWriter().print(i>0);
	}
	
	@RequestMapping("/toupdate")
	public String toupdate() {
		return "/category/update";
	}
	
	@RequestMapping("queryCategoryById")
	@ResponseBody
	public void queryCategoryById(int id,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		Category cate = categoryservice.queryCategoryById(id);
		String string = JSON.toJSONString(cate);
		response.getWriter().print(string);
	}
	
	@RequestMapping("update")
	@ResponseBody
	public void updateCategory(Category cate,HttpServletResponse response) throws IOException {
		System.out.println(cate);
		int i = categoryservice.updateCategory(cate);
		System.out.println(i);
		response.getWriter().print(i>0);
	}
}
