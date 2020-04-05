package com.platform.organiz.service.spring;

import org.springframework.stereotype.Service;

import com.platform.common.spring.IBaseDaoServiceSpringImpl;
import com.platform.organiz.schema.model.Organization;
import com.platform.organiz.service.facade.OrganizService;

@Service(value="organizService")
public class OrganizServiceSpringImpl extends IBaseDaoServiceSpringImpl<Organization,String> implements OrganizService {


}
