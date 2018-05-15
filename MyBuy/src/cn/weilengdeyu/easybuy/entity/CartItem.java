package cn.weilengdeyu.easybuy.entity;

import java.io.Serializable;

//CartItem代表某个商品，并代表某个商品出现多少次
public class CartItem implements Serializable{
  private Product product;
  private int quantity;
  private double price;//10包方便面的价格
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}
