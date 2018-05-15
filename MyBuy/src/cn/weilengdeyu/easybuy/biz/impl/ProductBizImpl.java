package cn.weilengdeyu.easybuy.biz.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.weilengdeyu.easybuy.biz.ProductBiz;
import cn.weilengdeyu.easybuy.entity.Product;
import cn.weilengdeyu.easybuy.entity.ProductCategory;

public class ProductBizImpl implements ProductBiz{
	@Override
	public List<ProductCategory> getProductCategories(String parentId) {
		List<ProductCategory> list = new ArrayList<ProductCategory>();
		try {
			list= procateDao.getProductCategories(Long.parseLong(parentId));
		} catch (NumberFormatException e) {
          e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//01.书写查询所有商品信息的方法(第一页数据)
	@Override
	public List<Product> getAllProducts(int currentPage, int pageSize) {
		return proDao.getAllProducts(currentPage, pageSize);
	}
	@Override
	public int getRowsCount() {
		return proDao.getRowsCount();
	}
	@Override
	public Product getProductById(int id) {
		return proDao.getProductById(id);
		
	}

}
