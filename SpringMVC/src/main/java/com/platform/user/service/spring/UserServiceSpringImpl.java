package com.platform.user.service.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.platform.common.schema.vo.Page;
import com.platform.common.spring.IBaseDaoServiceSpringImpl;
import com.platform.user.schema.model.User;
import com.platform.user.schema.vo.UserVo;
import com.platform.user.service.facade.UserServcie;
@Service(value="userServcie")
public class UserServiceSpringImpl extends IBaseDaoServiceSpringImpl<User,Integer> implements UserServcie {

	@Override
	public List<User> queryUser(UserVo userVo) {
		StringBuffer sb = new StringBuffer("from User where 1=1 ");
		Map<String,String> map = new HashMap<String,String>();
		if(StringUtils.isNotBlank(userVo.getUserName())) {
			sb.append(" and userName = :userName");
			map.put("userName", userVo.getUserName());
		}
		return super.listByHQL(sb.toString(),map);
	}

	@Override
	public Page findListByPage(Page page,UserVo userVo) {
		StringBuffer hql = new StringBuffer(" from User where 1=1 ");
		StringBuffer hql_count = new StringBuffer();
		Map<String,String> map = new HashMap<String,String>();
		if(StringUtils.isNotBlank(userVo.getUserName())) {
			String param = " and userName = :userName";
			hql.append(param);
			hql_count.append(param);
			map.put("userName", userVo.getUserName());
		}
		int total = super.getCountByHqlCondition(hql_count.toString(), map);
		List<User> users =  super.listByHQL(hql.toString(),map,(page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		return new Page(page.getPageNo(), page.getPageSize(), total,users);
	}

	@Override
	public void saveUser(User user) {
		super.saveOrUpdate(user);
		
	}

	@Override
	public User findUserByPK(Integer id) {
		return  super.get(id);
	}

	@Override
	public void deletUserByPK(Integer id) {
		super.deleteById(id);
		
	}
}
