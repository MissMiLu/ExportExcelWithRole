package com.palmelf.erp.serviceImpl;

import com.palmelf.erp.dao.PublicDao;
import com.palmelf.erp.model.*;
import com.palmelf.erp.service.LuxuanCstService;
import com.palmelf.erp.util.Constants;
import com.palmelf.erp.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
@Service("LuxuanCstService")
public class LuxuanCstServiceImpl implements LuxuanCstService
{
	@SuppressWarnings("rawtypes")
	private PublicDao publicDao;
	@SuppressWarnings("rawtypes")
	@Autowired
	public void setPublicDao(PublicDao publicDao )
	{
		this.publicDao = publicDao;
	}

	
	
	/* (非 Javadoc) 
	* <p>Title: findCustomerList</p> 
	* <p>Description: 查询所有客户</p> 
	* @param param
	* @param pageUtil
	* @return 
	* @see com.palmelf.erp.service.CstService#findCustomerList(java.util.Map, com.palmelf.erp.util.PageUtil) 
	*/
	public List<LuxuanCustomer> findCustomerList(Map<String, Object> param,PageUtil pageUtil)
	{
		String hql="from LuxuanCustomer t where t.status='A'";
		hql+=Constants.getSearchConditionsHQL("t", param);
		hql+=Constants.getGradeSearchConditionsHQL("t", pageUtil);
		return publicDao.find(hql, param, pageUtil.getPage(), pageUtil.getRows());
	}
	
	/* (非 Javadoc) 
	* <p>Title: findCustomerListNoPage</p> 
	* <p>Description:查询所有客户不分页 </p> 
	* @param param
	* @param pageUtil
	* @return 
	* @see com.palmelf.erp.service.CstService#findCustomerListNoPage(java.util.Map, com.palmelf.erp.util.PageUtil) 
	*/
	public List<LuxuanCustomer> findCustomerListNoPage(Map<String, Object> param, PageUtil pageUtil)
	{
		String hql="from LuxuanCustomer t where t.status='A'";
		hql+=Constants.getSearchConditionsHQL("t", param);
		hql+=Constants.getGradeSearchConditionsHQL("t", pageUtil);
		return publicDao.find(hql, param);
	}
	
	/* (非 Javadoc) 
	* <p>Title: getCount</p> 
	* <p>Description: 查询所有总数</p> 
	* @param param
	* @param pageUtil
	* @return 
	* @see com.palmelf.erp.service.CstService#getCount(java.util.Map, com.palmelf.erp.util.PageUtil) 
	*/
	public Long getCount(Map<String, Object> param,PageUtil pageUtil)
	{
		String hql="select count(*) from LuxuanCustomer t where t.status='A' ";
		hql+=Constants.getSearchConditionsHQL("t", param);
		hql+=Constants.getGradeSearchConditionsHQL("t", pageUtil);
		return publicDao.count(hql, param);
	}
	
	/* (非 Javadoc) 
	* <p>Title: persistenceCustomer</p> 
	* <p>Description:持久化Customer和持久化关联的 CustomerContact</p> 
	* @param c
	* @param map
	* @return 
	* @see com.palmelf.erp.service.CstService#persistenceCustomer(com.palmelf.erp.model.Customer, java.util.Map) 
	*/
	public boolean persistenceCustomer(LuxuanCustomer c, Map<String, List<CustomerContact>> map)
	{
		Integer userId=Constants.getCurrendUser().getUserId();
		if (c.getCustomerId()==null||"".equals(c.getCustomerId()))
		{
			c.setCreater(userId);
			c.setModifiyer(userId);
			c.setStatus(Constants.PERSISTENCE_STATUS);
			publicDao.save(c);
		}else {
			c.setModifiyer(userId);
			publicDao.update(c);
		}
		return true;
	}
	
	/* (非 Javadoc) 
	* <p>Title: delCustomer</p> 
	* <p>Description: 删除客户以及关联联系人</p> 
	* @param customerId
	* @return 
	* @see com.palmelf.erp.service.CstService#delCustomer(java.lang.Integer) 
	*/
	public boolean delCustomer(Integer customerId)
	{
		Integer userId = Constants.getCurrendUser().getUserId();
		LuxuanCustomer c = (LuxuanCustomer)publicDao.get(LuxuanCustomer.class, customerId);
		c.setModifiyer(userId);
		c.setStatus(Constants.PERSISTENCE_DELETE_STATUS);
		publicDao.deleteToUpdate(c);
		return true;
	}
}
