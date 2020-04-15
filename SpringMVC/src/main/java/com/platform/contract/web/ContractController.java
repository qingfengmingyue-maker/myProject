package com.platform.contract.web;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.platform.common.schema.VehicleClass;
import com.platform.common.schema.vo.Page;
import com.platform.common.schema.vo.Pager;
import com.platform.common.service.RegulationService;
import com.platform.common.service.VehicleClassService;
import com.platform.contract.schema.model.MainContract;
import com.platform.contract.schema.vo.ContractQueryVo;
import com.platform.contract.schema.vo.ContractReturnVo;
import com.platform.contract.service.facade.ContractService;
import com.platform.user.schema.vo.UserMsgVo;
@Controller
@RequestMapping("/contract")
public class ContractController {
	@Autowired
	RegulationService regulationService;
	@Autowired
	ContractService contractService;
	@Autowired
	VehicleClassService vehicleClassService;
	
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
		List<VehicleClass> vehicleClasslist = null;
		try {
			vehicleClasslist = vehicleClassService.findVehicleClassList("");
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		mv.addObject("vehicleClasslist", vehicleClasslist);
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
    
    
    
    /**
	 * 下载
	 */
	@RequestMapping("/loadContractExcel")
	public void loadContractExcel(ContractQueryVo contractQueryVo,HttpServletResponse response){
		List<MainContract> mainContractList = null;
	   	try {
			mainContractList=contractService.findContractList(contractQueryVo);
			String [] columnName={"合同号","车主","品牌","车系",	"车型","车辆状态","保存日期","服务类型","结算金额（元）","服务期限",
					"经销商名称","创建日期","更新日期","操作者"};
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("合同报表");
			HSSFRow rowTitle = sheet.createRow(0);
			int columnNameLength = columnName.length;
			for(int i=0;i<columnNameLength;i++){
				HSSFCell cell = rowTitle.createCell(i);
		    	cell.setCellValue(columnName[i]);
		    }
			int rownum = 1;
			SimpleDateFormat datetemp1 = new SimpleDateFormat("yyyy-MM-dd");
			for(MainContract mainContract:mainContractList){
				HSSFRow row = sheet.createRow(rownum++);
				int cellnum = 0;
				HSSFCell cell = row.createCell(cellnum++);
			    cell.setCellValue(mainContract.getContractNo());//合同号
			    if(mainContract.getPartyB() != null){
			    	row.createCell(cellnum++).setCellValue(mainContract.getPartyB().getOwnerName());//车主
			    }else{
			    	row.createCell(cellnum++).setCellValue("");
			    }
			    row.createCell(cellnum++).setCellValue(mainContract.getVehicleMsg().getBrandName());//品牌
			    row.createCell(cellnum++).setCellValue(mainContract.getVehicleMsg().getClassName());//车系
			    row.createCell(cellnum++).setCellValue(mainContract.getVehicleMsg().getModelName());//车型
			    row.createCell(cellnum++).setCellValue(mainContract.getVehicleMsg().getCarState());//车辆状态
			    if(mainContract.getInsertTime() != null){
			    	row.createCell(cellnum++).setCellValue(datetemp1.format(mainContract.getInsertTime()));//保存日期
			    }else{
			    	row.createCell(cellnum++).setCellValue("");
			    }
			    row.createCell(cellnum++).setCellValue(mainContract.getServiceType());//服务类型
			    if(mainContract.getSettleAmount() != null){
			    	row.createCell(cellnum++).setCellValue(mainContract.getSettleAmount()+"");//结算金额
			    }else{
			    	row.createCell(cellnum++).setCellValue("");
			    }
			    row.createCell(cellnum++).setCellValue(mainContract.getServiceDate());//服务期限
			    if(mainContract.getPartyA() != null){
			    	row.createCell(cellnum++).setCellValue(mainContract.getPartyA().getOrgName());//经销商名称
			    }else{
			    	row.createCell(cellnum++).setCellValue("");
			    }
			    if(mainContract.getInsertTime() != null){
			    	row.createCell(cellnum++).setCellValue(datetemp1.format(mainContract.getInsertTime()));
			    }else{
			    	row.createCell(cellnum++).setCellValue("");
			    }
			    if(mainContract.getOperateTime() != null){
			    	row.createCell(cellnum++).setCellValue(datetemp1.format(mainContract.getOperateTime()));
			    }else{
			    	row.createCell(cellnum++).setCellValue("");
			    }
			    if(mainContract.getPartyA() != null){
			    	row.createCell(cellnum++).setCellValue(mainContract.getPartyA().getBusinessName());
			    }else{
			    	row.createCell(cellnum++).setCellValue("");
			    }
			}
			
		    OutputStream os = null;
		    try {
				os = response.getOutputStream();
				SimpleDateFormat datetemp = new SimpleDateFormat("yyyyMMdd");
				String fileName = datetemp.format(new Date()) + ".xls";
				response.setHeader("Content-disposition", "attachment; filename="+ fileName + "");// 设定输出文件头
				// ZC:WANGXYE111001 导出excel名称修改 mod wangxiaoye 20151110 end
				response.setContentType("application/msexcel");// 定义输出类型
				wb.write(os);
			} catch (IOException e) {
			}finally{
				try {
					os.close();
				} catch (IOException e) {
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 /**
	  * @describe:根据经销商名称查询业务联系人
	  * @param orgCode
	  * @return
	  */
	 @RequestMapping("/prepareUserMsg")
	 public ModelAndView prepareUserMsg(String orgCode,String businessName) {
	       ModelAndView mv = new ModelAndView("/UIPrepareUserMsg");
		   mv.addObject("businessName", businessName);
		   mv.addObject("orgCode", orgCode);
		   return mv;
	 }
}
