package com.mypet.service;

import java.io.IOException;
import java.io.OutputStream;

import org.springframework.stereotype.Service;

import com.mypet.exception.ValidateException;
import com.mypet.utils.VerifyCodeUtil;
import com.mypet.utils.VerifyCodeUtil.VerifyCode;

@Service
public class VerifyCodeService {
	public String getVerifyCode(OutputStream out) {
		VerifyCode verifyCode = VerifyCodeUtil.getVerifyCode();
		try {
			VerifyCodeUtil.write(verifyCode.getImage(), out);
			return verifyCode.getText();
		} catch (IOException e) {
			throw new ValidateException("无法显示验证码，请重试");
		}
	}

	public void checkVerifyCode(String expectVerifyCode, String verifyCode) {
		if (expectVerifyCode == null || !expectVerifyCode.equals(verifyCode)) {
			throw new ValidateException("验证码错误");
		}
	}
}
