package cn.weilengdeyu.easybuy.entity;

import java.io.Serializable;

/**
 * 订单详情
 * @author happy
 *
 */
public class OrderDetail implements Serializable {
	private Long id;          //订单详情ID
	private int orderId;      //订单ID
	private Product product;  //商品
	private long quantity;    //商品数量 
	private Float cost;       //单品金额
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	public Float getCost() {
		return cost;
	}
	public void setCost(Float cost) {
		this.cost = cost;
	}

	
}
