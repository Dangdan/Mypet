package com.mypet.model;
/**
 * 界面消息
 * @author Dan
 *
 * @param <T>
 */
public class Msg<T> {
	public static final int SUCCESS = 0;
	public static final int VALIDATE_EXCEPTION = 1;
	public static final int UNKNOW_EXCEPTION = 2;
	public int type;
	public T content;

	public Msg() {
	}

	public Msg(int type, T content) {
		super();
		this.type = type;
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public T getContent() {
		return content;
	}

	public void setContent(T content) {
		this.content = content;
	}

}
