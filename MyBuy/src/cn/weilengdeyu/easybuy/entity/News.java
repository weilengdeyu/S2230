package cn.weilengdeyu.easybuy.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 新闻实体
 * @author happy
 *
 */
public class News implements Serializable {
	private Long id;//ID
	private String title;//标题
	private String content;//内容
	private Date createTime;//创建时间
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
