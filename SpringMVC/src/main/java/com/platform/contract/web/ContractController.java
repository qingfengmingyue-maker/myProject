package com.platform.contract.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
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
	
	
    @RequestMapping("/findContractByContractNo")
    public ModelAndView findContractByContractNo(String contractNo,String editType) {
    	 ModelAndView mv = new ModelAndView("/UIContractOperate");
    	 MainContract mainContract =null;
		try {
			mainContract = contractService.findContractVo(contractNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 if("view".equals(editType)) {
    		 mv.addObject("message", "浏览合同");
    		 mv.addObject("editType", "view");
    	 }else {
    		 mv.addObject("message", "更改合同");
    		 mv.addObject("editType", "edit");
    	 }
    	 mv.addObject("mainContract",mainContract);
    	 return mv;
   }
	/**
	 * 保存
	 * @param ContractVo
	 * @return
	 */
	@RequestMapping("/saveContract")
	public ModelAndView saveContract(MainContract mainContract,HttpServletResponse response){
		try {
			mainContract.setContractNo("H1300002020040003");
			mainContract = contractService.saveContract(mainContract);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(StringUtils.isNotBlank(mainContract.getSaveType()) && "0".equals(mainContract.getSaveType())) {
			 ModelAndView mv = new ModelAndView("/UIContractOperate");
			 mv.addObject("mainContract",mainContract);
			 return mv;
		}else {
			return new ModelAndView("redirect:contractList.do");
		}
		
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
	
	
    /**
     * @deprecated:删除合同信息
     * @param userCode
     * @param response
     */
    @RequestMapping("/deleteContractByContractNo")
    public void deleteContractByContractNo(String contractNo,HttpServletResponse response) {
    	boolean flag = false;
    	String msg = "删除失败";
		try {
			flag = contractService.delContract(contractNo);
			response.setHeader("Content-Type", "text/html;charset=UTF-8");//这句话是解决乱码的
			if(flag) {
	    		 msg = "删除成功";
	    	}
			PrintWriter writer = response.getWriter();
			writer.print(msg);
			writer.flush();
			writer.close();
		}  catch (IOException e1) {
			e1.printStackTrace();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
    
    
    /**
     * @deprecated:打印
     */
    @RequestMapping("/print")
    public ModelAndView print(String contractNo) {
    	 ModelAndView mv = new ModelAndView("/UIContractPrint");
    	 MainContract mainContract =null;
		try {
			mainContract = contractService.findContractVo(contractNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 mv.addObject("mainContract",mainContract);
    	return mv;
   }
}
