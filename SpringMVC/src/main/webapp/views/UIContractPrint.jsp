<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html style="margin-top: 10px">
<%@ include file="/static/common/taglibs.jsp"%>
<head>
    <meta  http-equiv="Content-Type"  content="text/html;charset=utf-8" />
    <title>打印合同</title>
    <style type="text/css">
       .divcss5{width:250px; height:40px;overflow:hidden} 
       .divcss5 img{max-width:250px;_width:expression(this.width > 250 ? "250px" : this.width);}
        @media print {
        	body{
       			 -webkit-print-color-adjust:exact;
       			 -moz-print-color-adjust:exact;
      			  -ms-print-color-adjust:exact;
       			 print-color-adjust:exact;
       			}
       }
    </style>
    <script type="text/javascript"	src="${ctx}/views/js/UIContractPrint.js"></script>
</head>
<body>
  <div class="panel-group" id="accordion">
	<div class="col-lg-12">
	  	<div class="panel-body" >
	  	
	  	   <button type="button" id="goBackButton"   onclick="goBack();"  class="btn btn-primary glyphicon glyphicon-arrow-left noPrint"> 返回</button>       
					
           <button class="btn btn-primary glyphicon glyphicon-print noPrint" id="printHT"
					type="button"   onclick="isImgLoad()" >打印</button>
					
					
     <!--startprint-->  
<div class="divcss5"  style="margin-top: 10px" > 
<img alt="" src="${ctx}/static/images/logo.jpg"  class="printImg">
</div>
<h3 style="text-align: center;font-weight: bold;">保值换新服务合同</h3>
<font style="color: red;font-weight: bold;">———————————————————————————————————————————————————————————————————————————————————————</font><br/>
<font style="font-weight: bold;">尊敬的客户：</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢您购买保值换新服务，请您仔细阅读本合同，本合同将向您介绍更为具体的保值换新服务信息以及将来在您的车辆发生全损或者推定全损并申请更换新车服务时如何处理。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果您的车辆在服务期限内发生了全损或者推定全损事故，请您与签订本服务合同的经销商（“经销商”）联系，经销商在核实并确认您车辆的机动车置换费用补偿服务后，会帮助您解决后续事宜。<br/>
<font style="font-weight: bold;text-decoration: underline;">保值换新服务的使用</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请您在申请机动车保值换新服务时出示《保值换新服务合同》。在服务期限内，您将无需承担涵盖在服务合同范围内的车辆折旧及相关购置税费。下文列明的内容将适用于您已经购买了保值换新服务的车辆，以服务合同中登记的车架号（VIN）为准。<br/>
<font style="font-weight: bold;text-decoration: underline;">相关定义</font><br/>
1．《机动车辆商业保险示范条款》：中国保监会发布的，以机动车辆本身及其第三者责任等为保险标的的一种运输工具保险。<br/>
2.全损或推定全损的证明：是指在车辆投保的商业车险有效期间内，客户车辆发生车险事故后，客户所投保的中国境内保险公司根据《机动车辆商业保险示范条款》为客户的事故车辆开具的全损或推定全损证明文件。<br/>
3.保值换新服务：是指经销商根据《保值换新服务合同》（以下简称“服务合同”）为客户提供的车辆换新费用补偿服务。<br/>
<font style="font-weight: bold;text-decoration: underline;">保值换新服务范围</font><br/>
<font style="font-weight: bold;">1.使用地区</font><br/>
中华人民共和国境内(不包括香港、澳门特别行政区和台湾地区)<br/>
<font style="font-weight: bold;">2.购买条件</font><br/>
（1）九座以下(含九座)新车；<br/>
（2）车辆必须按照厂家车辆使用手册、厂家说明书等相关规定使用；<br/>
（3）车辆使用性质为非营运、非公共服务用途车辆、非比赛竞赛用车。<br/>
（4）车辆为非试乘试驾车、非租赁公司车辆；<br/>
（5）满足“保值换新服务的前提条件”且不存在“保值换新服务除外情形”<br/>
<font style="font-weight: bold;">3.服务生效日期</font><br/>
《保值换新服务合同》以合同签订之日次日零时生效。<br/>
<font style="font-weight: bold;">4.保值换新服务范围</font><br/>
（1）经销商与您签订服务合同后，且服务合同中列明的车辆发生了本合同条款中定义的全损或推定全损，由中国境内的保险公司根据《机动车辆商业保险示范条款》为您的事故车辆开具全损证明，您在本合同期内按照服务合同的规定在经销商处购置新车，并向经销商提出车辆换新费用补偿要求的，经销商根据本合同的约定，在本合同载明的项目和限额内负责提供保值换新服务。<br/>
（2）经销商根据本合同约定提供保值换新服务，保值换新服务特指符合《机动车辆商业保险示范条款》约定的保险事故发生后，经销商根据服务合同应承担的，客户在购置新车过程中产生的车辆折旧费用及相关购置税费。<br/>
<font style="font-weight: bold;">5.保值换新服务的前提条件</font><br/>
（1）您的车辆已经全额投保了下列“相关车险”；<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“相关车险”必须包括机动车损失保险、不计免赔特约险；<br/>
（2）您的车辆在服务有效期内遭受意外事故时，所投保的上述“相关车险”险种依然有效且构成上述“相关车险”责任范围内的全损或推定全损，并提供符合本协议约定的全损或推定全损的证明；<br/>
（3）在保值换新服务合同有效期内向经销商提出购置新车的要求。<br/>
<font style="font-weight: bold;">6.保值换新服务除外情形</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">1)&nbsp;&nbsp;&nbsp;&nbsp;	       未能提供被保险车辆投保商业车险的承保公司提供盖章的全损或者推定全损的协议或证明。</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">2)&nbsp;&nbsp;&nbsp;&nbsp;	       客户要求置换的机动车的身份认证信息、使用性质与服务合同中记载不一致的；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">3)&nbsp;&nbsp;&nbsp;&nbsp;   	置换机动车辆所有人与服务合同客户不一致的；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">4)&nbsp;&nbsp;&nbsp;&nbsp;	       机动车遭受的损害事故发生在服务合同生效前，或客户未在服务合同规定的期限内提出车辆置换要求；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">5)&nbsp;&nbsp;&nbsp;&nbsp;	       机动车因遭受损害事故仅导致部分损失，或机动车非因机动车损失保险、机动车全车盗抢损失保险、自燃损失保险所承保原因导致全损或推定全损；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">6)&nbsp;&nbsp;&nbsp;&nbsp;	       机动车非因服务合同所列原因导致的全损或推定全损；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">7)&nbsp;&nbsp;&nbsp;&nbsp;	       在车辆置换过程中，因更换品牌、型号、规格等原因产生的额外费用</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">8)&nbsp;&nbsp;&nbsp;&nbsp;	       任何形式的人身伤害、财产损失，及除本合同所列车辆置换费用外其他任何费用支出</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">9)&nbsp;&nbsp;&nbsp;&nbsp;	       车辆置换过程中所产生的任何间接损失、赔偿责任</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">10)&nbsp;&nbsp;&nbsp;	客户的故意行为、重大过失、欺诈、不诚实、违法犯罪行为；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">11)&nbsp;&nbsp;&nbsp;	客户使用、维护、保管不当；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">12)&nbsp;&nbsp;&nbsp;	机动车内在或潜在缺陷、自然磨损、自然损耗；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">13)&nbsp;&nbsp;&nbsp;	战争、敌对行为、军事行动、武装冲突、恐怖主义活动、罢工、暴动、骚乱；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">14)&nbsp;&nbsp;&nbsp;	核爆炸、核裂变、核聚变；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">15)&nbsp;&nbsp;&nbsp;	放射性污染及其他各种环境污染；</font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">16)&nbsp;&nbsp;&nbsp;	行政行为、司法行为；</font><br/>
<font style="font-weight: bold;">7.补偿标准及限额</font><br/>
(1).	在合同期间内，客户最多享受一次机动车置换费用补偿服务。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a)	保值换新费用 = 车辆折旧费用 + 新车购置税费<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b)	车辆折旧费用=被置换机动车原车购置发票价*已使用月数 *月折旧率<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：1.被置换机动车原车购车发票显示的购车日期至发生全损或推定全损事故之日计算的已使用月数；<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.不足一月，不计算折旧<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.保值换新服务不包括，当车辆发生盗抢/火灾/水淹造成全损时，产生的赔付，但若因客户未投保某项车险导致出险后保险公司不予全损理赔的，<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保值换新服务保障也将不能进行赔付<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c)	新车购置税费为：被置换机动车原车购置发票价÷1.13*10%<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d)	折旧率表：<br/>
<table   border="1" cellpadding="3" cellspacing="0" style="width: 50%;margin:auto">
<thead><tr style="text-align: center "><td>车辆种类</td><td>月折旧率</td></tr></thead>
<tbody><tr style="text-align: center "><td>9座及9座以下非营运客车（含越野车）</td><td>0.6%</td></tr></tbody>
</table>
<br/>
<div class="divcss5" > 
<img alt="" src="${ctx}/static/images/logo.jpg"  style="vertical-align: bottom">
</div>
<br/>
<font style="font-weight: bold;text-decoration: underline;">您的义务</font><br/>
1.	您享有保值换新服务的前提是您必须对车辆进行正确使用且及时、足额投保“相关车险”，请您保留好投保“相关车险”的记录和证明；<br/>
2.	对于发生上述“相关车险”责任范围内的事故，导致车辆可能存在全损或推定全损风险时，您应在接到上述“相关车险”承保人及其他责任人的通知后三日内通知经销商，并协助经销商进行查勘。如因故意或者重大过失不履行上述义务，经销商有权扣除“保值换新服务”费用补贴金额的10%。<br/>
3.	请您务必保管好下述材料，并在享受服务补偿时出示：1、本合同原件；2、原车购置发票（原件影印件）；3、索赔确认函；4、出险通知单；5、商业险保单；6、行车证、驾驶证、身份证；7、车险理赔计算书；8、拍卖合同和拍卖流水；9、调查认定书；10、推定全损协议书和车险赔款到账流水。<br/>
<font style="font-weight: bold;text-decoration: underline;">注意事项：</font><br/>
您申请补偿时，应及时按照经销商的要求向经销商提供与申请补偿相关的各种证明和资料，并确保其真实、完整。<br/>
因客户未履行前款约定的义务，导致部分或全部合同责任无法确定，经销商对无法确定的部分不承担责任。<br/>
<font style="font-weight: bold;text-decoration: underline;">经销商的权利</font><br/>
如果您以任何方式提出不真实的保值换新服务申请，我们将会追缴已经发生或支付过的相关款项，同时，本机动车保值换新服务将立即终止，不退还服务费用，您将失去享有保值换新服务的所有权利。<br/>
<font style="font-weight: bold;text-decoration: underline;">合同变更、解除及终止</font><br/>
（1）合同有效期内，非经双方协商一致，任何一方均不得擅自变更本合同；<br/>
（2）如您在服务期限内要求取消合同，我们将按照（已生效月份/保障月份）*服务费计费，退还剩余服务费；<br/>
（3）已享受保值换新服务的车辆，本合同自动终止，服务费不予退还；<br/>
（4）服务有效期内，车辆所有权发生转移，本合同自车辆所有权转让之日（指过户之日）起自动终止。<br/>
<br/>
<font  style="font-style: italic;">客户须遵守本手册的约定条款方能享受机动车保值换新服务权益。</font><br/>
<font  style="font-style: italic;">我已阅读并理解保值换新服务合同及合同条款，我理解手册相关约定及解释，<font style="font-weight: bold;">我理解保障内容以及不予保障内容，</font>完全同意并接受前述所有保障条款及相关记录。</font><br/>
<br/>
<table   class=" table table-bordered">
<tbody>
<tr style="text-align: center ">
<td rowspan="3" width="3%">客户信息</td>
<td>客户姓名</td>
<td>${mainContract.partyB.ownerName }</td>
<td>证件号码</td>
<td>${mainContract.partyB.documentNo}</td>
<td>移动电话</td>
<td>${mainContract.partyB.ownerMobile}</td>
</tr>
<tr style="text-align: center ">
<td>车型型号</td>
<td>${mainContract.vehicleMsg.modelName}</td>
<td>VIN码</td>
<td>${mainContract.vehicleMsg.vinNo}</td>
<td>发动机号</td>
<td>${mainContract.vehicleMsg.engineNo}</td>
</tr>
<tr style="text-align: center ">
<td>车辆发票价</td>
<td>${mainContract.vehicleMsg.invoiceAmount}</td>
<td>服务期限(月)</td>
<td><input id="serviceDateShow" value="${mainContract.serviceDate}月"   style="border:0px;text-align: center"></td>
<td>服务费用</td>
<td>${mainContract.settlePrice}</td>
</tr>
<tr>
<td style="text-align: left" colspan="4" rowspan="6" width="50%">机动车置换服务提供商：北京中保泰和科技服务有限公司<br/><div   style="margin-top: 10px;text-align: center;" > 
<img alt="" src="${ctx}/static/images/zhongbao.png"  class="printImg">
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(签章）<br/><br/>联系地址：北京市海淀区永澄北路2号院1号楼B座3层3008-139号</td>
<td style="text-align: left" colspan="3" rowspan="6" width="50%">保险人：中国人民财产保险股份有限公司长春市分公司<br/><div   style="margin-top: 50px;text-align: center;vertical-align: center" > 
<img alt="" src="${ctx}/static/images/renbao.png"  class="printImg">
</div><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(签章）<br/></br>联系地址：长春市朝阳区西安大路402号</td>
</tr>
</tbody>
</table>
<input type="hidden"  id="serviceDateHidden" value="${mainContract.serviceDate}">
<br/><br/>
<font style="text-align: center;font-weight: bold;">客户签章：_________________________ </font> 
<span  style="margin-left: 40%"><font style="text-align: center;font-weight: bold;">生效日期：_______年______月______日 </font> </span>















</div>
</div>
</div>
<!--endprint-->  

    

</body>

</html>