package com.mypet.resolver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.exception.ValidateException;
import com.mypet.model.Msg;
import com.mypet.utils.GsonUtil;
import com.mypet.utils.MsgUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/***
 * 异常解析器**
 * 
 * @author gmr
 *
 */
@Component
@ResponseBody
public class ExceptionResolver implements HandlerExceptionResolver {

	private static final Logger LOGGER = LoggerFactory.getLogger(ExceptionResolver.class);

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception e) {
		ModelAndView modelAndView = new ModelAndView();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		if (e instanceof ValidateException) {
			ValidateException validateException = (ValidateException) e;
			writeMsg(response, GsonUtil.GSON.toJson(validateException.getMsg()));
		} else {
			writeMsg(response, GsonUtil.GSON.toJson(MsgUtil.getUnknowErrorMsg()));
			LOGGER.info(Msg.UNKNOW_EXCEPTION + "----未知错误", e);
			e.printStackTrace();

		}
		return modelAndView;
	}

	private void writeMsg(HttpServletResponse response, String message) {
		try {
			response.getWriter().write(message);
		} catch (IOException e1) {
		}
	}

}
