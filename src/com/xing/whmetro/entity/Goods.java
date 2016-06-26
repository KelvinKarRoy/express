package com.xing.whmetro.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 日报
 * 
 * @author KelvinKarRoy
 * 
 */
public class Goods implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id; // 自增id
	private Date createTime; // 日报创建时间
	private String message;//备注消息
	private String location;//存储位置
	private String name;//货物名称
	private String code;//二维码
	
	public Goods()
	{
		super();
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", createTime=" + createTime + ", message="
				+ message + ", location=" + location + ", name=" + name
				+ ", code=" + code + "]";
	}

	public Goods(Long id, Date createTime, String message, String location,
			String name, String code) {
		super();
		this.id = id;
		this.createTime = createTime;
		this.message = message;
		this.location = location;
		this.name = name;
		this.code = code;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	
	
	
}
