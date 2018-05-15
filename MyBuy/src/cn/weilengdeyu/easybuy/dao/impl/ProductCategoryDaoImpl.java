package cn.weilengdeyu.easybuy.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.weilengdeyu.easybuy.dao.BaseDao;
import cn.weilengdeyu.easybuy.dao.ProductCategoryDao;
import cn.weilengdeyu.easybuy.entity.ProductCategory;

public class ProductCategoryDaoImpl extends BaseDao implements ProductCategoryDao{


	/**
	 * 01.写一个根据父ID获取子商品分类的方法
	 * @param parentId 父分类编号
	 * @return  子商品或者父商品集合
	 * @throws SQLException
	 */
	@Override
	public List<ProductCategory> getProductCategories(Long parentId)
			throws SQLException {
		//1.定义一个集合容器
		List<ProductCategory> list = new ArrayList<ProductCategory>();
		//2.SQL定制
		String sql = "select * from  easybuy_product_category ";
		if (parentId != null){
			sql = sql + " where epc_parent_id = " + parentId;
		}
		sql = sql + " order by epc_parent_id,epc_id";
		rs=executeSelect(sql);
		
		while(rs.next()){
			ProductCategory productCategory = new ProductCategory();
			//分类编号
			productCategory.setId(rs.getLong("epc_id"));
			//分类名称
			productCategory.setName(rs.getString("epc_name"));
			//父分类编号
			productCategory.setParentId(rs.getLong("epc_parent_id"));
			list.add(productCategory);
		}
		return list;
	}

}
