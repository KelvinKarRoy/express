package com.xing.whmetro.constants;

import java.io.Serializable;

public class JsonResultWithOffset extends JsonResult implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long offset; // 偏移量

	public JsonResultWithOffset()
	{
		super();
	}

	public JsonResultWithOffset(String code, String message, Object object, Long offset)
	{
		super(code, message, object);
		this.offset = offset;
	}

	public Long getOffset()
	{
		return offset;
	}

	public void setOffset(Long offset)
	{
		this.offset = offset;
	}

	@Override
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
		builder.append("JsonResultWithOffset [offset=");
		builder.append(offset);
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
