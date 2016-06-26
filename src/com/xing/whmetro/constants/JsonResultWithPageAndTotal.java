package com.xing.whmetro.constants;

import java.io.Serializable;

public class JsonResultWithPageAndTotal extends JsonResult implements Serializable
{
	private static final long serialVersionUID = 1L;

	private int page; // 当前页码
	private int total; // 总页码

	public JsonResultWithPageAndTotal()
	{
		super();
	}

	public JsonResultWithPageAndTotal(String code, String message, Object object, int page, int total)
	{
		super(code, message, object);
		this.page = page;
		this.total = total;
	}

	public int getPage()
	{
		return page;
	}

	public void setPage(int page)
	{
		this.page = page;
	}

	public int getTotal()
	{
		return total;
	}

	public void setTotal(int total)
	{
		this.total = total;
	}

	@Override
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
		builder.append("JsonResultWithPageAndTotal [page=");
		builder.append(page);
		builder.append(", total=");
		builder.append(total);
		builder.append(", getCode()=");
		builder.append(getCode());
		builder.append(", getMessage()=");
		builder.append(getMessage());
		builder.append(", getObject()=");
		builder.append(getObject());
		builder.append(", getClass()=");
		builder.append(getClass());
		builder.append(", hashCode()=");
		builder.append(hashCode());
		builder.append(", toString()=");
		builder.append(super.toString());
		builder.append("]");
		return builder.toString();
	}
}
