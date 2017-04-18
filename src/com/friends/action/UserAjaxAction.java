package com.friends.action;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.friends.dao.BaseAction;
import com.friends.model.User;

@Controller
@Scope("prototype")
public class UserAjaxAction extends BaseAction<User> implements ServletRequestAware{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1L;
	
	private String result;
	private HttpServletRequest request;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	/**
	 * @Title: userLogin 
	 * @Description: TODO(用户登录) 
	 * @param @return
	 * @param @throws Exception    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String userLogin() throws Exception{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String remberPwd = request.getParameter("remberPwd");
		
		if (userName!=null && password!=null && remberPwd!=null) {
			User user = new User();
			user.setUserName(userName);
			user.setPassword(password);
			User realUser = this.userService.login(user);
			if (realUser != null) {
				request.getSession().setAttribute("user", realUser);
				ObjectMapper mapper = new ObjectMapper();
				result = mapper.writeValueAsString("ok");
			}
		}
		return SUCCESS;
	}
	/**
	 * @throws Exception 
	 * 
	 * @Title: userRegister 
	 * @Description: TODO(用户注册) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String userRegister() throws Exception{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		String verifyCode = request.getParameter("verifyCode").toUpperCase();
		String realVerifyCode = request.getSession().getAttribute("securityCode").toString().toUpperCase();
		
		if (!verifyCode.equals(realVerifyCode)) {
			ObjectMapper mapper = new ObjectMapper();
			result = mapper.writeValueAsString("验证码有误...");
			return SUCCESS;
		}
		
		User user =new User();
		user.setUserName(userName);
		user.setPassword(password);
		user.setNickName(nickName);
		user.setExperience(0);
		user.setHead_pic("img/head.jpg");
		user.setRegisterTime((new Date()));
		this.userService.save(user);
		request.getSession().setAttribute("user", user);
		ObjectMapper mapper = new ObjectMapper();
		result = mapper.writeValueAsString("ok");
		return SUCCESS;
	}
	public void setServletRequest(HttpServletRequest hsq) {
		request=hsq;
	}
}
