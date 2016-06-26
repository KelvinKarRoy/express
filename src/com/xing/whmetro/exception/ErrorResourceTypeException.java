package com.xing.whmetro.exception;

/**
 * 非图片异常
 * 
 * @author Shawn
 *
 */
public class ErrorResourceTypeException extends RuntimeException
{
	private static final long serialVersionUID = 4875141928739446984L;

	public ErrorResourceTypeException()
	{
		super();
	}

	public ErrorResourceTypeException(String message)
	{
		super(message);
	}

	public ErrorResourceTypeException(Throwable cause)
	{
		super(cause);
	}
	
	public ErrorResourceTypeException(String message, Throwable cause)
	{
		super(message, cause);
	}

	@Override
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
		builder.append("IsNotPictureException [message=");
		builder.append(getMessage());
		builder.append("]");
		return builder.toString();
	}
}
