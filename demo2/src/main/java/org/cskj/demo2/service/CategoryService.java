package org.cskj.demo2.service;

import java.util.List;
import org.cskj.demo2.bean.Category;

public interface CategoryService {

	List<Category> queryAll();
	
	int addCategory(Category cate);
	
	int deleteCategory(int id);
	
	Category queryCategoryById(int id);
	
	int updateCategory(Category cate);
}
