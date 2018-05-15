package cn.weilengdeyu.easybuy.entity;

import java.io.Serializable;

/**
 * 商品 信息表
 * @author happy
 *
 */
public class Product implements Serializable{
	private Long id;//ID
	
	private String name;//商品名
	
	private String description;//描述
	
	private Float price;//单价
	
	private Long stock;//数量
	
	private Long categoryId;//一级分类
	
	private Long childCategoryId;//二级分类
	
	private String fileName;//图片名称
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public Long getChildCategoryId() {
		return childCategoryId;
	}
	public void setChildCategoryId(Long childCategoryId) {
		this.childCategoryId = childCategoryId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
