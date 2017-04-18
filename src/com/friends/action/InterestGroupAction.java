package com.friends.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.friends.dao.BaseAction;
import com.friends.model.InterestGroup;
import com.friends.model.UserDynamic;

@Controller
@Scope("prototype")
public class InterestGroupAction extends BaseAction<InterestGroup> implements ServletRequestAware{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = -1501524264138118400L;

	private String interestGroupId;
	
	private HttpServletRequest request;
	
	/**
	 * @Title: seeSpecificInterestGroup 
	 * @Description: TODO(查看兴趣小组的信息) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeInterestGroup(){
		String interestGroupId = request.getParameter("interestGroupId");
		if (interestGroupId!=null) {
			InterestGroup interestGroup = this.interestGroupService.getById(Integer.parseInt(interestGroupId));
			List<UserDynamic> userDynamics = this.userDynamticService.getUserDynamicsByInterestGroupId(Integer.parseInt(interestGroupId));
			request.setAttribute("interestGroup", interestGroup);
			request.setAttribute("userDynamics", userDynamics);
		}
		return SUCCESS;
	}

	/**
	 * @Title: seeSpecificInterestGroup 
	 * @Description: TODO(查看具体的兴趣小组) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String seeSpecificInterestGroup(){
		String interestGroupId = request.getParameter("interestGroupId");
		if (interestGroupId!=null) {
			InterestGroup interestGroup = this.interestGroupService.getById(Integer.parseInt(interestGroupId));
			request.setAttribute("interestGroup", interestGroup);
		}
		return SUCCESS;
	}

	public void setServletRequest(HttpServletRequest hsq) {
		request=hsq;
	}
	
	//UserDynamticAction会传递interestGroupId的值
	public void setInterestGroupId(String interestGroupId) {
		this.interestGroupId = interestGroupId;
	}
}
