<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
    <meta  http-equiv="Content-Type"  content="text/html;charset=utf-8" />
    <title></title>
    <meta  charset="utf-8"/>

    <script language="javascript">

        function  preview(oper) {

            if(oper < 10) {

                bdhtml =window.document.body.innerHTML;//获取当前页的html代码

                sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域

                eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域

                prnhtml =bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html

                prnhtml = prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html

                window.document.body.innerHTML= prnhtml;

                window.print();

                window.document.body.innerHTML =bdhtml;

            } else{

                window.print();

            }

        }

    </script>
  <style type="text/css"   media="print">
  @media print{
    .table>tbody>tr>td { text-align: center;}
  }
.table>tbody>tr>td { text-align: center;}
  </style>
</head>

<body>

    <!--startprint1-->
<table   class="table  table-bordered table-sort">
<tbody>
<tr>
<td rowspan="4" width="3%">客户信息</td>
<td>客户姓名</td>
<td colspan="5">何发成</td>
<td>移动电话</td>
<td>18810906875</td>
</tr>
<tr>

<td>联系地址</td>
<td colspan="5">宁夏银川市</td>
<td>固定电话</td>
<td>0316-58112011</td>
</tr>
<tr>

<td width="17%">证件号码</td>
<td width="10%">131025198806034538</td>
<td width="10%">初始购车价格</td>
<td width="10%">119500.00</td>
<td width="12.5%">车型型号</td>
<td width="12.5%">北京现代ix35</td>
<td width="12.5%">车牌号码</td>
<td width="12.5%"></td>
</tr>
<tr>

<td>VIN码</td>
<td>11111111111111111</td>
<td>发动机号</td>
<td>KW460867</td>
<td>车辆登记日期</td>
<td>2020年01月19日</td>
<td>保险期限</td>
<td>壹年</td>
</tr>
<tr>
<td style="text-align: left" colspan="5" rowspan="6" width="50%">机动车置换服务提供商:青岛黑马网络技术有限公式（签章）<br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(签章）<br/>全国统一客服热线:400-708-5577<br/>联系地址:青岛市城阳区长城南路6号首创空港国际中心8号楼</td>
<td style="text-align: left" colspan="5" rowspan="6" width="50%">保险人:中国人民财产保险股份有限公司深圳市分公司<br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(签章）<br/>保险咨询:0755-29634606</br>联系地址:深圳市罗湖区罗芳路122号南方大厦A座</td>
</tr>
</tbody>
</table>
客户签字：_________________________   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      生效日期：_______年______月______日

    <!--endprint1-->

    <input type=button name='button_export'  title='打印1' onclick="preview(1)"value="打印1">

</body>

</html>
