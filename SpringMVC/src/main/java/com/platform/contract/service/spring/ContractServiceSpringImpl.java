package com.platform.contract.service.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.platform.common.schema.vo.Page;
import com.platform.common.service.RegulationService;
import com.platform.common.spring.IBaseDaoServiceSpringImpl;
import com.platform.contract.schema.model.MainContract;
import com.platform.contract.schema.vo.ContractQueryVo;
import com.platform.contract.service.facade.ContractService;
@Service(value="contractservice")
public class ContractServiceSpringImpl extends IBaseDaoServiceSpringImpl<MainContract,String> implements ContractService {
	@Autowired
	RegulationService regulationService;
	@Override
	public Boolean saveContract(MainContract mainContract) throws Exception {
		String contractNo = mainContract.getContractNo();
		String cityCode = mainContract.getCityCode();//归属机构
		if(StringUtils.isBlank(contractNo)){
			contractNo = regulationService.getOrgCode(cityCode, "contractNo");
			mainContract.setContractNo(contractNo);
			mainContract.getPartyA().setContractNo(contractNo);
			mainContract.getPartyB().setContractNo(contractNo);
			mainContract.getVehicleMsg().setContractNo(contractNo);
			
		}
		super.saveOrUpdate(mainContract);
		return true;
	}

	@Override
	public Boolean delContract(String contractNo) throws Exception {
		super.deleteById(contractNo);
		return true;
	}

	@Override
	public MainContract findContractVo(String contractNo) throws Exception {
		MainContract mainContract = super.get(contractNo);
		return mainContract;
	}

	@Override
	public List<MainContract> findContractList(ContractQueryVo contractQueryVo)
			throws Exception {
		StringBuffer hql = new StringBuffer(" from MainContract a where 1=1 ");
		Map<String,String> map = new HashMap<String,String>();
		String policyNo = contractQueryVo.getPolicyNo();//保单号
		String contractNo = contractQueryVo.getContractNo();//合同号
		String ownerName = contractQueryVo.getOwnerName();//车主
		String vinNo = contractQueryVo.getVinNo();//车架号
		if(StringUtils.isNotBlank(policyNo)) {
			hql.append(" and a.policyNo like :policyNo");
			map.put("policyNo", policyNo);
		}
		if(StringUtils.isNotBlank(contractNo)) {
			hql.append(" and a.contractNo = :contractNo");
			map.put("contractNo", contractNo);
		}
		if(StringUtils.isNotBlank(ownerName)) {
			hql.append(" and a.partyB.ownerName = :ownerName");
			map.put("ownerName", ownerName);
		}
		if(StringUtils.isNotBlank(vinNo)){
			hql.append(" and a.vehicleMsg.vinNo = :vinNo ");
			map.put("vinNo", vinNo);
		}
		return super.listByHQL(hql.toString(),map);
	}

	@Override
	public Page findContractPageList(Page page, ContractQueryVo contractQueryVo)
			throws Exception {
		StringBuffer hql = new StringBuffer(" from MainContract a where 1=1 ");
		StringBuffer hql_count = new StringBuffer();
		Map<String,String> map = new HashMap<String,String>();
		String policyNo = contractQueryVo.getPolicyNo();//保单号
		String contractNo = contractQueryVo.getContractNo();//合同号
		String ownerName = contractQueryVo.getOwnerName();//车主
		String vinNo = contractQueryVo.getVinNo();//车架号
		if(StringUtils.isNotBlank(policyNo)) {
			hql_count.append(" and a.policyNo like :policyNo");
			map.put("policyNo", policyNo);
		}
		if(StringUtils.isNotBlank(contractNo)) {
			hql_count.append(" and a.contractNo = :contractNo");
			map.put("contractNo", contractNo);
		}
		if(StringUtils.isNotBlank(ownerName)) {
			hql_count.append(" and a.partyB.ownerName = :ownerName");
			map.put("ownerName", ownerName);
		}
		if(StringUtils.isNotBlank(vinNo)){
			hql_count.append(" and a.vehicleMsg.vinNo = :vinNo ");
			map.put("vinNo", vinNo);
		}
		if(StringUtils.isNotBlank(hql_count.toString())){
			hql = hql.append(hql_count);
		}
		int total = super.getCountByHqlCondition(hql_count.toString(), map);
		List<MainContract> mainContractPage =  super.listByHQL(hql.toString(),map,(page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		return new Page(page.getPageNo(), page.getPageSize(), total,mainContractPage);
	}

}
