package com.platform.contract.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.platform.common.schema.vo.Page;
import com.platform.common.schema.vo.Pager;
import com.platform.common.service.RegulationService;
import com.platform.contract.schema.model.MainContract;
import com.platform.contract.schema.vo.ContractQueryVo;
import com.platform.contract.schema.vo.ContractReturnVo;
import com.platform.contract.service.facade.ContractService;
@Controller
@RequestMapping("/contract")
public class ContractController {
	@Autowired
	RegulationService regulationService;
	@Autowired
	ContractService contractService;
	/**
	 * 跳转查询页面
	 * @return
	 */
	@RequestMapping("/contractList")
	public String prepareQuery(){
		return "/UIContractQuery";
	}
	/**
	 * 跳转新增合同页面
	 * @return
	 */
	@RequestMapping("/createNewContract")
	    public ModelAndView createNewUser() {
		   ModelAndView mv = new ModelAndView("/UIContractOperate");
		   mv.addObject("title", "新增合同");
		   return mv;
	 }
	/**
	 * 保存
	 * @param ContractVo
	 * @return
	 */
	@RequestMapping("/saveContract")
	public ModelAndView saveContract(MainContract mainContract){
		try {
			mainContract.setContractNo("H1300002020040003");
			contractService.saveContract(mainContract);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:contractList.do");
	}
	/**
	 * 修改跳转修改页面
	 * @param contractNo
	 * @param busiType
	 * @return
	 */
	@RequestMapping("/editContract")
	public ModelAndView editContract(String contractNo,String busiType){
		ModelAndView mv = new ModelAndView("");
		try {
			MainContract mainContract = contractService.findContractVo(contractNo);
			mv.addObject("mainContract",mainContract);
			mv.addObject("busiType", busiType);
			mv.setViewName("/UINewContract");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 订单合同分页查询
	 * @param contractQueryVo
	 * @return
	 */
	@RequestMapping("/quryContractList")
	@ResponseBody
	public List<MainContract> quryContractList(ContractQueryVo contractQueryVo){
		List<MainContract> mainContractList = null;
	   	try {
			mainContractList=contractService.findContractList(contractQueryVo);
			if(mainContractList != null){
				System.out.println(mainContractList.size());
			}else{
				System.out.println("11111111111111111111");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	   	return mainContractList;
	}
	/**
	 * 订单合同分页查询
	 * @param contractQueryVo
	 * @return
	 */
	@RequestMapping("/quryContractPageList")
	@ResponseBody
	public Pager<ContractReturnVo> quryContractPageList(@RequestBody ContractQueryVo contractQueryVo){
		Page page=new Page<ContractQueryVo>(contractQueryVo.getCurrentPageNum(), contractQueryVo.getiDisplayLength());
	   	try {
			page=contractService.findContractPageList(page, contractQueryVo);
			return new Pager<ContractReturnVo>().wrapPager(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   	return null;
	}
}
