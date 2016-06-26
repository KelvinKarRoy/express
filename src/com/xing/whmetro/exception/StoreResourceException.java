package com.xing.whmetro.exception;


/**
 * 存储图片异常
 * 
 * @author Shawn
 */
public class StoreResourceException extends RuntimeException
{

	private static final long serialVersionUID = 4875141928739446984L;

	public StoreResourceException()
	{
		super();
	}

	public StoreResourceException(String message)
	{
		super(message);
	}

	public StoreResourceException(Throwable cause)
	{
		super(cause);
	}

	public StoreResourceException(String message, Throwable cause)
	{
		super(message, cause);
	}

	@Override
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
		builder.append("StorePictureException [message=");
		builder.append(getMessage());
		builder.append("]");
		return builder.toString();
	}
}
