package com.mypet.utils;

import com.google.gson.Gson;

public class GsonUtil {
	public static final Gson GSON = new Gson();

	public static String getSuccessJson() {
		return GSON.toJson(MsgUtil.getSuccessMsg("success"));
	}
}
