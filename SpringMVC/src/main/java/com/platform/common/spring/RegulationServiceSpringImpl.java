package com.platform.common.spring;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.platform.common.schema.Regulation;
import com.platform.common.service.RegulationService;
@Service(value="regulationService")
public class RegulationServiceSpringImpl extends IBaseDaoServiceSpringImpl<Regulation,Integer> implements RegulationService {
	private DataSource dataSource;
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	@Override
	public String getOrgCode(String groupno,String codeType) {
		int serialNo = 4;//流水号长度
		String maxNo = "0001";//初始流水号
		if("userCode".equals(codeType)){
			groupno = groupno.substring(0,4);//所属区域4位代码+4位流水
		}else if("contractNo".equals(codeType)){
			groupno = "H"+groupno;//H+6位机构+6位日期+4位流水
			Calendar calendar = Calendar.getInstance();
			int year =  calendar.get(calendar.YEAR);
			int month =  calendar.get(calendar.MONTH) + 1;
			if(month < 10){
				groupno += year + "0"+month; 
			}else{
				groupno += year + "" +month; 
			}
		}
		String businessno = "";
		int count=0;
		//定义变量
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			conn.setAutoCommit(false);
			String sql = "select max(maxNo),COUNT(*) from Regulation where groupNo =?  ";
			stat = conn.prepareStatement(sql);
			stat.setString(1, groupno);
			rs = stat.executeQuery();
			if(rs.next()){
				if(rs.getString(1) != null){
					maxNo= rs.getString(1);
				}
				count= rs.getInt(2);
			}
		} catch (Exception ex1) {
			System.out.println("获取最大号码异常"+ex1);
		} finally {
			try {
				if (stat != null) {
					stat.close();
				}
			} catch (SQLException e) {
				System.out.println("预处理对象关闭异常"+e);
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println(("数据库连接对象关闭异常"+e));
			}
		}
		if(count != 0){
			maxNo = String.valueOf(Long.parseLong(maxNo) + 1);
			//缺少的0的个数
			int intlength = serialNo - maxNo.length();
			StringBuffer buffer = new StringBuffer();
			for(int i = 0; i < intlength; i++)
			{
				buffer.append('0');
			}
			maxNo = buffer.toString()+maxNo;
		}
		businessno = groupno+ maxNo;
		try {
			conn = dataSource.getConnection();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO Regulation(businessno,groupNo,maxNo) values(?,?,?) ";
			stat = conn.prepareStatement(sql);
			stat.setString(1, businessno);
			stat.setString(2, groupno);
			stat.setString(3, maxNo);
			stat.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception ex1) {
			System.out.println("插入最大号码异常"+ex1);
			businessno = "";
		} finally {
			try {
				if (stat != null) {
					stat.close();
				}
			} catch (SQLException e) {
				System.out.println("预处理对象关闭异常"+e);
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println(("数据库连接对象关闭异常"+e));
			}
		}
		return businessno;
	}

}
