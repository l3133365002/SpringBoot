package org.cskj.demo2.service.impl;

import java.util.List;
import org.cskj.demo2.bean.Category;
import org.cskj.demo2.mapper.CategoryMapper;
import org.cskj.demo2.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper categorymapper;
	
	@Override
	public List<Category> queryAll() {
		return categorymapper.queryAll();
	}

	@Override
	public int addCategory(Category cate) {
		return categorymapper.addCategory(cate);
	}

	@Override
	public int deleteCategory(int id) {
		return categorymapper.deleteCategory(id);
	}

	@Override
	public Category queryCategoryById(int id) {
		return categorymapper.queryCategoryById(id);
	}

	@Override
	public int updateCategory(Category cate) {
		return categorymapper.updateCategory(cate);
	}

}
