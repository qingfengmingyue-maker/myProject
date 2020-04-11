package com.platform.contract.service.spring;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.platform.contract.schema.vo.ContractReturnVo;
import com.platform.contract.service.facade.ContractService;
@Service(value="contractservice")
public class ContractServiceSpringImpl extends IBaseDaoServiceSpringImpl<MainContract,String> implements ContractService {
	@Autowired
	RegulationService regulationService;
	@Override
	public MainContract saveContract(MainContract mainContract) throws Exception {
		String contractNo = mainContract.getContractNo();
		if(StringUtils.isBlank(contractNo)){
			String orgCode = mainContract.getPartyA().getOrgCode();//归属机构
			contractNo = regulationService.getOrgCode(orgCode, "contractNo");
		}
		mainContract.setContractNo(contractNo);
		mainContract.getPartyA().setContractNo(contractNo);
		mainContract.getPartyB().setContractNo(contractNo);
		mainContract.getVehicleMsg().setContractNo(contractNo);
		super.saveOrUpdate(mainContract);
		return mainContract;
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
		StringBuffer hql = new StringBuffer("select a.contractNo, pb.ownerName, vm.brandName, vm.className,vm.modelName,vm.carState,a.insertTime, "
				+"a.servicetype,a.settleamount,a.servicedate,pa.orgName,a.operateTime,pa.businessName  "
				+ "from MainContract a,partya pa,partyb pb,vehiclemsg vm  where 1=1 and a.contractno=pa.contractno and a.contractno=pb.contractno and a.contractno=vm.contractno ");
		StringBuffer hql_count = new StringBuffer("select count(*)   from MainContract a,partya pa,partyb pb,vehiclemsg vm  where 1=1 and a.contractno=pa.contractno and a.contractno=pb.contractno and a.contractno=vm.contractno ");
		StringBuffer hqlFilter = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		String policyNo = contractQueryVo.getPolicyNo();//保单号
		String contractNo = contractQueryVo.getContractNo();//合同号
		String ownerName = contractQueryVo.getOwnerName();//车主
		String vinNo = contractQueryVo.getVinNo();//车架号
		//以下是复杂查询的查询条件
		String  policyNoComplex = contractQueryVo.getPolicyNoComplex();   //保单号
		String  orgNameComplex = contractQueryVo.getOrgNameComplex();   //经销商名称
		Date insertTimeComplex  =contractQueryVo.getInsertTimeComplex();//保存日期起期
		Date insertTime1Complex = contractQueryVo.getInsertTime1Complex();  //保存日期止期
		String contractNoComplex = contractQueryVo.getContractNoComplex();//合同号
		String vinNoComplex = contractQueryVo.getVinNoComplex();   //车架号
		String ownerNameComplex = contractQueryVo.getOwnerNameComplex(); //车主
		String carStateComplex = contractQueryVo.getCarStateComplex();  //车辆状态
		String serviceTypeComplex = contractQueryVo.getServiceTypeComplex();   //服务类型
		Character serviceDateComplex = contractQueryVo.getServiceDateComplex(); //服务期限
		if(StringUtils.isNotBlank(policyNo)) {
			hqlFilter.append(" and a.policyNo = :policyNo");
			map.put("policyNo", policyNo);
		}
		if(StringUtils.isNotBlank(contractNo)) {
			hqlFilter.append(" and a.contractNo = :contractNo");
			map.put("contractNo", contractNo);
		}
		if(StringUtils.isNotBlank(ownerName)) {
			hqlFilter.append(" and pb.ownerName like :ownerName");
			map.put("ownerName", ownerName+"%");
		}
		if(StringUtils.isNotBlank(vinNo)){
			hqlFilter.append(" and vm.vinNo = :vinNo ");
			map.put("vinNo", vinNo);
		}
       if(StringUtils.isNotBlank(contractQueryVo.getQueryType())&& "complexQuery".equals(contractQueryVo.getQueryType())) {
    	   if(StringUtils.isNotBlank(policyNoComplex)) {
   			hqlFilter.append(" and a.policyNo = :policyNo");
   			map.put("policyNo", policyNoComplex);
   		}
   		if(StringUtils.isNotBlank(contractNoComplex)) {
   			hqlFilter.append(" and a.contractNo = :contractNo");
   			map.put("contractNo", contractNoComplex);
   		}
   		if(StringUtils.isNotBlank(ownerNameComplex)) {
   			hqlFilter.append(" and pb.ownerName like :ownerName");
   			map.put("ownerName", ownerNameComplex+"%");
   		}
   		if(StringUtils.isNotBlank(vinNoComplex)){
   			hqlFilter.append(" and vm.vinNo = :vinNo ");
   			map.put("vinNo", vinNoComplex);
   		}
    	   
    	   if(StringUtils.isNotBlank(orgNameComplex)) {
    		 hqlFilter.append(" and pa.orgName like :orgName");
   			 map.put("orgName", orgNameComplex+"%");
   		   }
    	   if(insertTimeComplex!=null) {
    		   hqlFilter.append(" and a.insertTime >= :insertTime");
      			map.put("insertTime", insertTimeComplex);
      	   }
    	   if(insertTime1Complex!=null) {
    		   hqlFilter.append(" and a.insertTime <= :insertTime1");
     			map.put("insertTime1", insertTime1Complex);
     	   }
    	   if(StringUtils.isNotBlank(carStateComplex)) {
    		   hqlFilter.append(" and vm.carState = :carState");
   			   map.put("carState", carStateComplex);
   		   }
    	   if(StringUtils.isNotBlank(serviceTypeComplex)) {
    		    hqlFilter.append(" and a.serviceType = :serviceType");
      			map.put("serviceType", serviceTypeComplex);
      	   }
    	   if(serviceDateComplex!=null) {
    		    hqlFilter.append(" and a.serviceDate = :serviceDate");
     			map.put("serviceDate", serviceDateComplex);
     	   }
		}
       if(StringUtils.isNotBlank(hqlFilter.toString())){
			hql = hql.append(hqlFilter);
			hql_count = hql_count.append(hqlFilter);
		}
		hql.append("  order by a.operateTime desc");
		int total = super.getCountBySqlCondition(hql_count.toString(), map);
		List<Object[]> mainContractPage =  super.listBySQL(hql.toString(),map,(page.getPageNo()-1)*page.getPageSize(), page.getPageSize());
		List<ContractReturnVo> contractReturnVos = new ArrayList<ContractReturnVo>();
		for(Object[] obj : mainContractPage) {
			ContractReturnVo  contractReturnVo = new ContractReturnVo();
			contractReturnVo.setContractNo((String)obj[0]);
			contractReturnVo.setOwnerName((String)obj[1]);
			contractReturnVo.setBrandName((String)obj[2]);
			contractReturnVo.setClassName((String)obj[3]);
			contractReturnVo.setModelName((String)obj[4]);
			contractReturnVo.setCarState((String)obj[5]);
			contractReturnVo.setInsertTime(obj[6]!=null?(Date)obj[6] : null );
			contractReturnVo.setServiceType((String)obj[7]);
			contractReturnVo.setSettleAmount(obj[8]!=null? (BigDecimal)obj[8] : null);
			contractReturnVo.setServiceDate((Character)obj[9]);
			contractReturnVo.setOrgName((String)obj[10]);
			contractReturnVo.setInsertTimeVo(contractReturnVo.getInsertTime());
			contractReturnVo.setOperateTime(obj[11]!=null?(Date)obj[11] : null );
			contractReturnVo.setBusinessName((String)obj[12]);
			contractReturnVos.add(contractReturnVo);
		}
		return new Page(page.getPageNo(), page.getPageSize(), total,contractReturnVos);
	}

}
