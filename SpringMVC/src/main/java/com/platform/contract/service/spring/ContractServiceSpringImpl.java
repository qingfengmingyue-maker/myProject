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
import com.platform.user.schema.vo.UserMsgVo;
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
		Map<String,Object> map = new HashMap<String,Object>(0);
		String contractNo = contractQueryVo.getContractNo();//合同号
		String ownerName = contractQueryVo.getOwnerName();//车主
		String vinNo = contractQueryVo.getVinNo();//车架号
		String orgName = contractQueryVo.getOrgName();   //经销商名称
		Date insertTime = contractQueryVo.getInsertTime();   //保存日期起期
		Date insertTime1 = contractQueryVo.getInsertTime1();  //保存日期止期
		String carState = contractQueryVo.getCarState();    //车辆状态
		String serviceType = contractQueryVo.getServiceType();  //服务类型
		Character serviceDate = contractQueryVo.getServiceDate();  //服务期限
		if(StringUtils.isNotBlank(contractNo)) {
			hql.append(" and a.contractNo = :contractNo");
			map.put("contractNo", contractNo);
		}
		if(StringUtils.isNotBlank(serviceType)) {
			hql.append(" and a.serviceType = :serviceType");
			map.put("serviceType", serviceType);
		}
		if(insertTime!=null) {
			hql.append(" and a.insertTime >= :insertTime");
	  		map.put("insertTime", insertTime);
	  	}
		if(insertTime1!=null) {
			hql.append(" and a.insertTime <= :insertTime1");
			map.put("insertTime1", insertTime1);
		}
		if(serviceDate != null) {
			hql.append(" and a.serviceDate = :serviceDate");
			map.put("serviceDate", serviceDate);
		}
		if(StringUtils.isNotBlank(ownerName)) {
			hql.append(" and a.partyB.ownerName = :ownerName");
			map.put("ownerName", ownerName);
		}
		if(StringUtils.isNotBlank(vinNo)){
			hql.append(" and a.vehicleMsg.vinNo = :vinNo ");
			map.put("vinNo", vinNo);
		}
		if(StringUtils.isNotBlank(carState)){
			hql.append(" and a.vehicleMsg.carState = :carState ");
			map.put("carState", carState);
		}
		if(StringUtils.isNotBlank(orgName)){
			hql.append(" and a.partyA.orgName = :orgName");
			map.put("orgName", orgName);
		}
		return super.listByHQL(hql.toString(),map);
	}

	@Override
	public Page findContractPageList(Page page, ContractQueryVo contractQueryVo)
			throws Exception {
		StringBuffer hql = new StringBuffer("select a.contractNo, pb.ownerName, vm.brandName, vm.className,vm.modelName,vm.carState,a.insertTime, "
				+"a.servicetype,a.settleamount,a.servicedate,pa.orgName,a.operateTime,pa.businessName  "
				+ "from MainContract a left join partya pa on a.contractNo=pa.contractNo "
				+ "left join partyb pb on a.contractNo=pb.contractNo "
				+ "left join vehiclemsg vm on a.contractNo=vm.contractNo where 1=1 ");
		StringBuffer hql_count = new StringBuffer("select count(*)   from MainContract a,partya pa,partyb pb,vehiclemsg vm  where 1=1 and a.contractno=pa.contractno and a.contractno=pb.contractno and a.contractno=vm.contractno ");
		StringBuffer hqlFilter = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		String policyNo = contractQueryVo.getPolicyNo();//保单号
		String contractNo = contractQueryVo.getContractNo();//合同号
		String ownerName = contractQueryVo.getOwnerName();//车主
		String vinNo = contractQueryVo.getVinNo();//车架号
		//以下是复杂查询的查询条件
		String  orgName = contractQueryVo.getOrgName();   //经销商名称
		Date insertTime  =contractQueryVo.getInsertTime();//保存日期起期
		Date insertTime1= contractQueryVo.getInsertTime1();  //保存日期止期
		String carState = contractQueryVo.getCarState();  //车辆状态
		String serviceType = contractQueryVo.getServiceType();   //服务类型
		Character serviceDate= contractQueryVo.getServiceDate(); //服务期限
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
      
	   if(StringUtils.isNotBlank(orgName)) {
		 hqlFilter.append(" and pa.orgName like :orgName");
		 map.put("orgName", orgName+"%");
	   }
	   if(insertTime!=null) {
		   hqlFilter.append(" and a.insertTime >= :insertTime");
  			map.put("insertTime", insertTime);
  	   }
	   if(insertTime1!=null) {
		   hqlFilter.append(" and a.insertTime <= :insertTime1");
 			map.put("insertTime1", insertTime1);
 	   }
	   if(StringUtils.isNotBlank(carState)) {
		   hqlFilter.append(" and vm.carState = :carState");
		   map.put("carState", carState);
	   }
	   if(StringUtils.isNotBlank(serviceType)) {
		    hqlFilter.append(" and a.serviceType = :serviceType");
  			map.put("serviceType", serviceType);
  	   }
	   if(serviceDate!=null) {
		    hqlFilter.append(" and a.serviceDate = :serviceDate");
 			map.put("serviceDate", serviceDate);
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
