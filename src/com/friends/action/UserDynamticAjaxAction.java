package com.friends.action;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import util.StringUtil;

import com.friends.common.Constant;
import com.friends.dao.BaseAction;
import com.friends.model.User;
import com.friends.model.UserDynamic;

@Controller
@Scope("prototype")
public class UserDynamticAjaxAction extends BaseAction<UserDynamic> implements ServletRequestAware{

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
	
	public String deleteUserDynamtic() throws Exception{
	    String userDynamticId = request.getParameter("userDynamticId");
	    if (!StringUtil.isEmpty(userDynamticId)) {
	        User user = (User) request.getSession().getAttribute(Constant.USER);
	        UserDynamic userDynamic = this.userDynamticService.getById(Integer.parseInt(userDynamticId));
	        this.userDynamticService.delete(userDynamic.getId());
	        request.getSession().setAttribute(Constant.USER, this.userService.getById(user.getId()));
	        ObjectMapper mapper = new ObjectMapper();
	        result = mapper.writeValueAsString("删除成功");
        }
		return SUCCESS;
	}
	public void setServletRequest(HttpServletRequest hsq) {
		request=hsq;
	}
}
