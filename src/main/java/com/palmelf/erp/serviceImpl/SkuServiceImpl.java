package com.palmelf.erp.serviceImpl;

import com.palmelf.erp.dao.PublicDao;
import com.palmelf.erp.model.Sku;
import com.palmelf.erp.model.Spu;
import com.palmelf.erp.service.SkuService;
import com.palmelf.erp.service.SpuService;
import com.palmelf.erp.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
@Service("skuService")
public class SkuServiceImpl implements SkuService
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
	* <p>Title: persistenceCustomer</p>
	* <p>Description:持久化Customer和持久化关联的 CustomerContact</p>
	* @param c
	* @param map
	* @return
	* @see com.palmelf.erp.service.CstService#persistenceCustomer(com.palmelf.erp.model.Customer, java.util.Map)
	*/
	public boolean persistenceSku(Sku sku)
	{
		Integer userId=Constants.getCurrendUser().getUserId();
		if (sku.getSkuId()==null||"".equals(sku.getSkuId()))
		{
			//spu.setCreated(new Date());
			//sku.setLastmod(new Date());
			sku.setCreater(userId);
			sku.setModifiyer(userId);
			publicDao.save(sku);
		}else {
			//sku.setLastmod(new Date());
			sku.setModifiyer(userId);
			publicDao.update(sku);
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
	public boolean delSku(Integer skuId)
	{
		Integer userId = Constants.getCurrendUser().getUserId();
		Sku sku = (Sku)publicDao.get(Sku.class, skuId);
		//sku.setLastmod(new Date());
		sku.setModifiyer(userId);
		publicDao.delete(sku);
		return true;
	}
}
