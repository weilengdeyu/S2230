package cn.weilengdeyu.easybuy.biz;

import java.util.List;

import cn.weilengdeyu.easybuy.dao.ProductCategoryDao;
import cn.weilengdeyu.easybuy.dao.ProductDao;
import cn.weilengdeyu.easybuy.dao.impl.ProductCategoryDaoImpl;
import cn.weilengdeyu.easybuy.dao.impl.ProductDaoImpl;
import cn.weilengdeyu.easybuy.entity.Product;
import cn.weilengdeyu.easybuy.entity.ProductCategory;


public interface ProductBiz {
	ProductCategoryDao procateDao=new ProductCategoryDaoImpl();
	ProductDao proDao=new ProductDaoImpl();
	List<ProductCategory> getProductCategories(String parentId);//根据父ID查询所有子商品分类
	
	//01.书写查询所有商品信息的方法(第一页数据)
	public List<Product> getAllProducts(int currentPage, int pageSize);
	//02.写一个获取商品表中总记录数的方法
    public int getRowsCount();
    //03.写一个根据商品编号获取商品详细信息方法
    public Product getProductById(int id);
}
