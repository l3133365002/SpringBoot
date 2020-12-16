package org.cskj.demo2.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.cskj.demo2.bean.Category;

@Mapper
public interface CategoryMapper {

	List<Category> queryAll();
	
	int addCategory(Category cate);
	
	int deleteCategory(int id);
	
	Category queryCategoryById(int id);
	
	int updateCategory(Category cate);
}
