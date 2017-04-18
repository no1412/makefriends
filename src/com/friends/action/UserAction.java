package com.friends.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.friends.dao.BaseAction;
import com.friends.model.User;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> implements ServletRequestAware{

	private HttpServletRequest request;
	
	private static final long serialVersionUID = -3010979754973676105L;

	/**
	 * 
	 * @Title: login 
	 * @Description: TODO(用户登录) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String login(){
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		User realUser = this.userService.login(user);
		if (realUser != null) {
			request.getSession().setAttribute("user", realUser);
			
			return "login";
		}else{
			request.setAttribute("username", user.getUserName());
			request.setAttribute("errorMsg", "账号或密码错误！！！");
			return INPUT;
		}
	}
	
	/**
	 * 
	 * @Title: logOut 
	 * @Description: TODO(用户登出) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String logOut(){
		request.getSession().setAttribute("user", null);
		return "login";
	}

	/**
	 * @Title: getMyCollections 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String getMyCollections(){
		return "getMyCollections";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest hsq) {
		this.request=hsq;
	}
	
}
