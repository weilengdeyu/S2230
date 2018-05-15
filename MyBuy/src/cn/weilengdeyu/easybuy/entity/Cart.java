package cn.weilengdeyu.easybuy.entity;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

//代表购物车
public class Cart implements Serializable{
   //用于保存购物车中所有商品
	//购物车商品集合
	private Map<String,CartItem> map=new LinkedHashMap<String, CartItem>();
	private double price;
	//书写一个向购物车中添加商品你信息的方法
	public void Add(Product pro){
		//获取一个Item对象
		
		CartItem item=map.get(pro.getId().toString());
		
		if (item!=null) { //购物车中已经具有该商品信息了
			item.setQuantity(item.getQuantity()+1);
			item.getQuantity();
			
		}else {
			item=new CartItem();
			item.setProduct(pro);
			item.setQuantity(1);
			map.put(pro.getId().toString(),item);
		}
	}
	public double getPrice() {
		double totalPrice=0;
	    for (Map.Entry<String,CartItem> item : map.entrySet()) {
			CartItem cItem=item.getValue();
			totalPrice+=cItem.getPrice();
		}
		return totalPrice;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Map<String, CartItem> getMap() {
		return map;
	}
	public void setMap(Map<String, CartItem> map) {
		this.map = map;
	}
	
	
}
