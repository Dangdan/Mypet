package com.mypet.utils;

import com.mypet.model.Msg;

public class MsgUtil {
	public static <T> Msg<T> getSuccessMsg(T obj) {
		return new Msg<>(Msg.SUCCESS, obj);
	}

	public static Msg<String> getValidateErrorMsg(String obj) {
		return new Msg<>(Msg.VALIDATE_EXCEPTION, obj);
	}

	public static Msg<String> getUnknowErrorMsg() {
		return new Msg<>(Msg.UNKNOW_EXCEPTION, "未知错误");
	}
}
