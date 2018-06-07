package com.mypet.exception;

import com.mypet.model.Msg;
import com.mypet.utils.MsgUtil;

public class ValidateException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	private Msg<String> msg;

	public ValidateException(Msg<String> msg) {
		this.msg = msg;
	}

	public ValidateException(String msg) {
		this.msg = MsgUtil.getValidateErrorMsg(msg);
	}

	public String getContent() {
		return this.msg.getContent();
	}

	public void setContent(String content) {
		this.msg.setContent(content);
	}

	public Msg<String> getMsg() {
		return msg;
	}
}
