package com.platform.contract.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
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
import com.platform.contract.schema.model.PartyB;
import com.platform.contract.schema.model.VehicleMsg;
import com.platform.contract.schema.vo.ContractQueryVo;
import com.platform.contract.schema.vo.ContractReturnVo;
import com.platform.contract.service.facade.ContractService;
import com.platform.user.schema.model.UserMsg;
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
    		List<VehicleClass> vehicleClasslist = null;
 			try {
 				vehicleClasslist = vehicleClassService.findVehicleClassList("");
 			} catch (Exception e) {
 				System.out.println(e);
 				e.printStackTrace();
 			}
 			mv.addObject("vehicleClasslist", vehicleClasslist);
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
	public ModelAndView saveContract(MainContract mainContract,HttpServletResponse response,HttpSession session){
		try {
			UserMsg userMsg = (UserMsg) session.getAttribute("USER_SESSION");
			mainContract = contractService.saveContract(mainContract,userMsg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(StringUtils.isNotBlank(mainContract.getSaveType()) && "0".equals(mainContract.getSaveType())) {
			List<VehicleClass> vehicleClasslist = null;
			try {
				vehicleClasslist = vehicleClassService.findVehicleClassList("");
			} catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
			}
			 ModelAndView mv = new ModelAndView("/UIContractOperate");
			 mv.addObject("vehicleClasslist", vehicleClasslist);
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
	@RequestMapping("/queryContractPageList")
	@ResponseBody
	public Pager<ContractReturnVo> queryContractPageList(@RequestBody ContractQueryVo contractQueryVo,HttpSession session){
		UserMsg userMsg = (UserMsg) session.getAttribute("USER_SESSION");
		Page page=new Page<ContractQueryVo>(contractQueryVo.getCurrentPageNum(), contractQueryVo.getiDisplayLength());
	   	try {
			page=contractService.findContractPageList(page, contractQueryVo,userMsg);
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
     * @deprecated:注销订单
     * @param userCode
     * @param response
     */
    @RequestMapping("/cancelContractByContractNo")
    public void cancelContractByContractNo(String contractNo,HttpServletResponse response) {
		try {
			int x = contractService.cancelContractByContractNo(contractNo);
			response.setHeader("Content-Type", "text/html;charset=UTF-8");//这句话是解决乱码的
			PrintWriter writer = response.getWriter();
			writer.print(x);
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
     * @deprecated:查询保存状态是暂存还是保存
     */
    @RequestMapping("/getSaveTypeByContractNo")
    public void getSaveTypeByContractNo(String contractNo,HttpServletResponse response) {
    	//暂存还是保存标识 0为暂存，1为保存
    	String saveType ="0";
    	try {
    		MainContract mainContract = contractService.findContractVo(contractNo);
    		saveType = mainContract.getSaveType();
    		PrintWriter writer = response.getWriter();
    		writer.print(saveType);
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
     * @deprecated:查询保存状态是暂存还是保存
     */
    @RequestMapping("/getStartDateByContractNo")
    public void getStartDateByContractNo(String contractNo,HttpServletResponse response) {
    	//暂存还是保存标识 0为暂存，1为保存
    	Date startDate = null;
    	try {
    		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    		MainContract mainContract = contractService.findContractVo(contractNo);
    		String saveType = mainContract.getSaveType();
    		startDate = mainContract.getStartDate();
    		PrintWriter writer = response.getWriter();
    		writer.print(saveType+","+sf.format(startDate));
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
		String basePathTemp=Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		if(basePathTemp.indexOf("WEB-INF/classes") > -1){
			basePathTemp = basePathTemp.substring(0,basePathTemp.indexOf("WEB-INF/classes"));
		}
		String modelPath= basePathTemp+"/model/model.xls";
		List<MainContract> mainContractList = null;
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	   	try {
			mainContractList=contractService.findContractList(contractQueryVo);
			FileInputStream in = new FileInputStream(modelPath);
			HSSFWorkbook wb = new HSSFWorkbook(in);;
			HSSFSheet sheet = wb.getSheetAt(0);//wb.createSheet("合同报表");
			HSSFCellStyle style = wb.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框  
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框  
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框  
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框  
			int rownum = 4;
			int count = 1;
			for(MainContract mainContract:mainContractList){
				HSSFRow row = sheet.createRow(rownum++);
				int cellnum = 0;
				creatCell(row,style,cellnum++,count+++"");
			    PartyB partyB = mainContract.getPartyB();
			    if(partyB != null){
			    	creatCell(row,style,cellnum++,partyB.getOwnerName());//客户证件姓名
			    	String documentType = partyB.getDocumentType();
			    	String documentName = "";
			    	if("01".equals(documentType)){ //车主证件类型
			    		documentName ="身份证";
			    	}else if("02".equals(documentType)){
			    		documentName ="护照";
			    	}else if("03".equals(documentType)){
			    		documentName ="军官证";
			    	}else if("04".equals(documentType)){
			    		documentName ="组织机构代码";
			    	}else if("05".equals(documentType)){
			    		documentName ="统一社会信用代码";
			    	}else if("99".equals(documentType)){
			    		documentName ="其他";
			    	}
			    	creatCell(row,style,cellnum++,documentName);//车主证件类型
			    	creatCell(row,style,cellnum++,partyB.getDocumentNo());//车主证件号码
			    	creatCell(row,style,cellnum++,partyB.getOwnerMobile());//车主联系方式
			    }else{
			    	creatCell(row,style,cellnum++,"");
			    	creatCell(row,style,cellnum++,"");
			    	creatCell(row,style,cellnum++,"");
			    }
			    VehicleMsg vehicleMsg = mainContract.getVehicleMsg();
			    if(vehicleMsg != null){
			    	String insuranceName = vehicleMsg.getInsuranceName();
			    	String insurancevlaue = "";
			    	if("1".equals(insuranceName)){
			    		insurancevlaue ="人保";
			    	}else if("2".equals(insuranceName)){
			    		insurancevlaue ="平安";
			    	}else if("3".equals(insuranceName)){
			    		insurancevlaue="太保";
			    	}else if("4".equals(insuranceName)){
			    		insurancevlaue ="鑫安";
			    	}else if("5".equals(insuranceName)){
			    		insurancevlaue ="其他";
			    	}
			    	creatCell(row,style,cellnum++,insurancevlaue);
			    	creatCell(row,style,cellnum++,vehicleMsg.getVinNo());
			    	if(vehicleMsg.getInvoiceAmount() != null){
			    		creatCell(row,style,cellnum++,vehicleMsg.getInvoiceAmount()+"");
			    	}else{
			    		creatCell(row,style,cellnum++,"");
			    	}
			    }else{
			    	creatCell(row,style,cellnum++,"");
			    	creatCell(row,style,cellnum++,"");
			    	creatCell(row,style,cellnum++,"");
			    }
			    creatCell(row,style,cellnum++,mainContract.getServiceDate());//服务期限
			    if(mainContract.getStartDate() != null){
			    	creatCell(row,style,cellnum++,dateformat.format(mainContract.getStartDate()));
			    }else{
			    	creatCell(row,style,cellnum++,"");
			    }
			    if(mainContract.getEndDate() != null){
			    	creatCell(row,style,cellnum++,dateformat.format(mainContract.getEndDate()));
			    }else{
			    	creatCell(row,style,cellnum++,"");
			    }
			}
			
		    OutputStream os = null;
		    try {
				os = response.getOutputStream();
				SimpleDateFormat datetemp = new SimpleDateFormat("yyyyMMdd");
				String fileName = datetemp.format(new Date()) + ".xls";
				response.setHeader("Content-disposition", "attachment; filename="+ fileName + "");// 设定输出文件头
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
	public HSSFCell creatCell(HSSFRow row,HSSFCellStyle cellstyle,int cellNum,String value){
		HSSFCell cell = row.createCell(cellNum);
		cell.setCellStyle(cellstyle);
		cell.setCellValue(value);
		return cell;
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
