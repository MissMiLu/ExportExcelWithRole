package com.palmelf.erp.action;

import com.opensymphony.xwork2.ModelDriven;
import com.palmelf.erp.model.CustomerContact;
import com.palmelf.erp.model.LuxuanCustomer;
import com.palmelf.erp.service.LuxuanCstService;
import com.palmelf.erp.util.Constants;
import com.palmelf.erp.util.PageUtil;
import com.palmelf.erp.viewModel.GridModel;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Namespace("/luxuanCst")
@Action(value = "luxuanCstAction")
public class LuXuanCstAction extends BaseAction implements ModelDriven<LuxuanCustomer>
{
	private static final long serialVersionUID = -1829376589433829721L;
	private LuxuanCstService luxuanCstService;

	private LuxuanCustomer luxuanCustomer;
	
	public LuxuanCustomer getCustomer()
	{
		return luxuanCustomer;
	}
	
	public void setCustomer(LuxuanCustomer luxuanCustomer )
	{
		this.luxuanCustomer = luxuanCustomer;
	}
	@Autowired
	public void setLuxuanCstService(LuxuanCstService luxuanCstService )
	{
		this.luxuanCstService = luxuanCstService;
	}
	
	/**  
	* 函数功能说明
	* Administrator修改者名字
	* 2013-6-24修改日期
	* 修改内容
	* @Title: findCustomerList 
	* @Description: TODO:查询所有客户
	* @param @return
	* @param @throws Exception    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	public String findCustomerList() throws Exception
	{
		Map<String, Object> map=new HashMap<String, Object>();
		if (null!=searchValue&&!"".equals(searchValue))
		{
			map.put(searchName, Constants.GET_SQL_LIKE+searchValue+Constants.GET_SQL_LIKE);
		}
		PageUtil pageUtil=new PageUtil(page, rows, searchAnds, searchColumnNames, searchConditions, searchVals);
		GridModel gridModel=new GridModel();
		gridModel.setRows(luxuanCstService.findCustomerList(map, pageUtil));
		gridModel.setTotal(luxuanCstService.getCount(map,pageUtil));
		OutputJson(gridModel);
		return null;
	}
	
	/**  
	* 函数功能说明
	* Administrator修改者名字
	* 2013-7-9修改日期
	* 修改内容
	* @Title: findCustomerListNoPage 
	* @Description: TODO:查询所有客户不分页
	* @param @return
	* @param @throws Exception    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	public String findCustomerListNoPage() throws Exception
	{
		Map<String, Object> map=new HashMap<String, Object>();
		if (null!=searchValue&&!"".equals(searchValue))
		{
			map.put(searchName, Constants.GET_SQL_LIKE+searchValue+Constants.GET_SQL_LIKE);
		}
		PageUtil pageUtil=new PageUtil(page, rows, searchAnds, searchColumnNames, searchConditions, searchVals);
		GridModel gridModel=new GridModel();
		gridModel.setRows(luxuanCstService.findCustomerList(map, pageUtil));
		gridModel.setTotal(null);
		OutputJson(gridModel);
		return null;
	}
	
	/**  
	* 函数功能说明
	* Administrator修改者名字
	* 2013-6-24修改日期
	* 修改内容
	* @Title: persistenceCustomer 
	* @Description: TODO:持久化Customer
	* @param @return
	* @param @throws Exception    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	public String persistenceCustomer() throws Exception
	{
		Map<String, List<CustomerContact>> map=new HashMap<String, List<CustomerContact>>();
		OutputJson(getMessage(luxuanCstService.persistenceCustomer(getModel(),map)),Constants.TEXT_TYPE_PLAIN);
		return null;
	}
	
	/**  
	* 函数功能说明 
	* Administrator修改者名字
	* 2013-6-26修改日期
	* 修改内容
	* @Title: delCustomer 
	* @Description: TODO:删除客户
	* @param @return
	* @param @throws Exception    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	public String delCustomer() throws Exception
	{
		OutputJson(getMessage(luxuanCstService.delCustomer(getModel().getCustomerId())));
		return null;
	}

	public LuxuanCustomer getModel()
	{
		if (null == luxuanCustomer)
		{
			luxuanCustomer = new LuxuanCustomer();
		}
		return luxuanCustomer;
	}

}
