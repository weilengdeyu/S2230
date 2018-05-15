package cn.weilengdeyu.easybuy.dao;

import java.sql.SQLException;
import java.util.List;

import cn.weilengdeyu.easybuy.entity.ProductCategory;


public interface ProductCategoryDao {
    
	/**
	 * 01.写一个根据父ID获取子商品分类的方法
	 * @param parentId 父分类编号
	 * @return     子商品或者父商品集合
	 * @throws SQLException
	 */
	 public List<ProductCategory> getProductCategories(Long parentId) throws SQLException;
}
