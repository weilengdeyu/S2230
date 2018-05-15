package cn.weilengdeyu.easybuy.entity;

import java.io.Serializable;

public class ProductCategory implements Serializable{
	private Long id;      //分类ID
	private String name;  //分类名称
	private Long parentId;//父级ID
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
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
}
