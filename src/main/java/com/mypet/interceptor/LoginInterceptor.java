package com.mypet.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mypet.annotation.LoginAuthority;
import com.mypet.ssm.po.User;
import com.mypet.utils.GsonUtil;
import com.mypet.utils.MsgUtil;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if (handler instanceof HandlerMethod) {
			LoginAuthority authority = ((HandlerMethod) handler).getMethodAnnotation(LoginAuthority.class);
			if (authority != null) {
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute("user");
				boolean tag = true;
				if (user == null) {
					tag = false;
				} else {
					switch (authority.value()) {
					case REQUEST_USER:
						if (!"领养者".equals(user.getIdentity())) {
							tag = false;
						}
						break;
					case PUBLISH_USER:
						if (!"发布者".equals(user.getIdentity())) {
							tag = false;
						}
						break;
					}
				}
				if (!tag) {
					String ajaxHeader = request.getHeader("X-Requested-With");
					if (ajaxHeader != null && ajaxHeader.trim().length() != 0) {
						try {
							response.getWriter().write(GsonUtil.GSON.toJson(MsgUtil.getValidateErrorMsg("请先登录")));
						} catch (IOException e1) {
						}
					} else {
						response.sendRedirect(request.getContextPath() + "/index");
					}
				}
				return tag;
			}
		}
		return true;
	}
}
