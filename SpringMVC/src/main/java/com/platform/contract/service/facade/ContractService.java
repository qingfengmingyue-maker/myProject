package com.platform.contract.service.facade;

import java.util.List;

import com.platform.common.schema.vo.Page;
import com.platform.contract.schema.model.MainContract;
import com.platform.contract.schema.vo.ContractQueryVo;
import com.platform.user.schema.model.UserMsg;
import com.platform.user.schema.vo.UserMsgVo;

public interface ContractService {
	/**
	 * 保存/更新订单合同
	 * @param mainContract
	 * @return
	 * @throws Exception
	 */
	MainContract saveContract(MainContract mainContract,UserMsg userMsg) throws Exception;
	Boolean delContract(String contractNo)throws Exception;
	MainContract findContractVo(String contractNo) throws Exception;
	/**
	 * 查询list,下载使用
	 * @param contractQueryVo
	 * @return
	 * @throws Exception
	 */
	List<MainContract> findContractList(ContractQueryVo contractQueryVo) throws Exception;
	/**
	 * 分页查询list
	 * @param page
	 * @param contractQueryVo
	 * @return
	 * @throws Exception
	 */
	Page findContractPageList(Page page, ContractQueryVo contractQueryVo,UserMsg userMsg)throws Exception;
	
}
