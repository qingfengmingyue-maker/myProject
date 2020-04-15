<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%@ include file="/static/common/taglibs.jsp"%>
<head>
    <meta  http-equiv="Content-Type"  content="text/html;charset=utf-8" />
    <title>打印合同</title>
    <script type="text/javascript"	src="${ctx}/views/js/UIContractPrint.js"></script>
</head>

<body>
  <div class="panel-group" id="accordion">
	<div class="col-lg-12">
	  	<div class="panel-body" >
 <button class="btn btn-primary glyphicon glyphicon glyphicon-file" id="printHT"
					type="button"   onclick="preview(1)" >打印</button>
    <!--startprint1-->
<h3 style="text-align: center;font-weight: bold;">机动车置换服务合同</h3>
<font style="color: red;font-weight: bold;">————————————————————————————————————————————————————————————————————————————————————————————————————————————————</font><br/>
尊敬的客户：<br/>
&nbsp;&nbsp;&nbsp;&nbsp;感谢您选择青岛黑马网络技术有限公司（下称:“我司”）的车辆过保全服务，我司向您提供更贴心的服务和更全面的保障，我司推出的车辆保全服务（下称:“服务”），帮助您免除车辆价值折旧的损失，无压力更换新车，生活更轻松，服务细则如下：<br/>
&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">一、服务承诺:</font></br>
&nbsp;&nbsp;&nbsp;&nbsp;鉴于在车辆发生全损或推定全损的情况下，虽然客户从保险公司获得了全额赔偿，但仍需承担由于车辆价值折旧所带来的损失：我司为了保障客户的利益，承诺按照下述规则，对客户提供车辆保全服务：<br>
&nbsp;&nbsp;&nbsp;&nbsp;车辆保全服务补偿=车辆购置发票价格×0.6%×折旧时间<font style="font-weight: bold;">(自本服务合同有效期起始日起算，不足一个月的部分，不计折旧)</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">二、服务有效期:</font>自<input style="border:0px;"  value="<fmt:formatDate value="${mainContract.startDate}" pattern="yyyy年MM月dd日"/>">至<input style="border:0px;"  value="<fmt:formatDate value="${mainContract.endDate}" pattern="yyyy年MM月dd日"/>"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">三、注意事项:</font></br>

</div>
</div>
</div>
<div class="panel-group" id="accordion">
	<div class="col-lg-12">
	  	<div class="panel-body" >
<table   class=" table table-bordered">
<tbody>
<tr style="text-align: center ">
<td rowspan="4" width="3%">客户信息</td>
<td>客户姓名</td>
<td colspan="5">${mainContract.partyB.ownerName }</td>
<td>移动电话</td>
<td>${mainContract.partyB.ownerMobile}</td>
</tr>
<tr style="text-align: center ">

<td>联系地址</td>
<td colspan="5">${mainContract.partyB.ownerDress}</td>
<td>固定电话</td>
<td>${mainContract.partyB.ownerMobile}</td>
</tr>
<tr style="text-align: center ">

<td width="10%">证件号码</td>
<td width="17%">${mainContract.partyB.documentNo}</td>
<td width="10%">初始购车价格</td>
<td width="10%">${mainContract.vehicleMsg.invoiceAmount}</td>
<td width="12.5%">车型型号</td>
<td width="12.5%">${mainContract.vehicleMsg.modelName}</td>
<td width="12.5%">车牌号码</td>
<td width="12.5%">${mainContract.vehicleMsg.licenseNo}</td>
</tr>
<tr style="text-align: center ">

<td>VIN码</td>
<td>${mainContract.vehicleMsg.vinNo}</td>
<td>发动机号</td>
<td>${mainContract.vehicleMsg.engineNo}</td>
<td>车辆登记日期</td>
<td><input   style="border:0px;text-align: center"  value="<fmt:formatDate value="${mainContract.vehicleMsg.purchaseDate}" pattern="yyyy年MM月dd日"/>"></td>
<td>保险期限</td>
<td><input id="serviceDateShow"   style="border:0px;text-align: center"></td>
</tr>
<tr>
<td style="text-align: left" colspan="5" rowspan="6" width="50%">机动车置换服务提供商:青岛黑马网络技术有限公式（签章）<br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(签章）<br/>全国统一客服热线:400-708-5577<br/>联系地址:青岛市城阳区长城南路6号首创空港国际中心8号楼</td>
<td style="text-align: left" colspan="5" rowspan="6" width="50%">保险人:中国人民财产保险股份有限公司深圳市分公司<br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(签章）<br/>保险咨询:0755-29634606</br>联系地址:深圳市罗湖区罗芳路122号南方大厦A座</td>
</tr>
</tbody>
</table>
<input type="hidden"  id="serviceDateHidden" value="${mainContract.serviceDate}">
<br/><br/>
<font style="text-align: center">客户签字：_________________________ </font> 
<span  style="margin-left: 40%"><font style="text-align: center">生效日期：_______年______月______日 </font> </span>
</div>
</div>
</div>
    <!--endprint1-->

    

</body>

</html>