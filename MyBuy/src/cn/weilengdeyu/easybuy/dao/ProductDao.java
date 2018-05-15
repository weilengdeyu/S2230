package cn.weilengdeyu.easybuy.dao;

import java.util.List;

import cn.weilengdeyu.easybuy.entity.Cart;
import cn.weilengdeyu.easybuy.entity.Product;

public interface ProductDao {
    //01.书写查询所有商品信息的方法(第一页数据)
	public List<Product> getAllProducts(int currentPage, int pageSize);
	//02.写一个获取商品表中总记录数的方法
    public int getRowsCount();
    //021.获取某个分类下商品的总记录数
    public int getRowsCountById(int id);
    //03.写一个根据商品编号获取商品详细信息方法
    public Product getProductById(int id);
    //04.写一个根据分类编号获取该分类下所有商品集合的方法
    public List<Product> getProductsByCateId(int id,int currentPage, int pageSize);
    //05.书写一个购买商品的方法
    public void buyPro(String proid,Cart cart);
    
}
