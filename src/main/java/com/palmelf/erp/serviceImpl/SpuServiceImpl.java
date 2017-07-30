package com.palmelf.erp.serviceImpl;

import com.alibaba.fastjson.JSONObject;
import com.palmelf.erp.dao.PublicDao;
import com.palmelf.erp.model.*;
import com.palmelf.erp.service.SpuService;
import com.palmelf.erp.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.alibaba.fastjson.JSON;

@SuppressWarnings("unchecked")
@Service("spuService")
public class SpuServiceImpl implements SpuService
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
	public List<Sku> findSpu(Map<String, Object> param, PageUtil pageUtil)
	{
		String hql="from Sku t where t.status='A'";
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
	public List<Spu> findSpuNoPage(Map<String, Object> param,PageUtil pageUtil)
	{
		String hql="from Spu t where t.status='A'";
		hql+=Constants.getSearchConditionsHQL("t", param);
		hql+=Constants.getGradeSearchConditionsHQL("t", pageUtil);
		return publicDao.find(hql, param);
	}

	public List<Sku> findSkuBySpu(Integer spuId)
	{
		String hql="from Sku t where t.spuId="+ spuId + " and t.status='A'";
		 return publicDao.find(hql);
	}

	public List<Sku> findSkuNoPage(Map<String, Object> param,PageUtil pageUtil)
	{
		String hql="from Sku s where s.status='A'";
		hql+=Constants.getSearchConditionsHQL("s", param);
		hql+=Constants.getGradeSearchConditionsHQL("s", pageUtil);
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
		String hql="select count(*) from Spu t where t.status='A'";
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
	public boolean persistenceSpu(Spu spu)
	{
		Integer userId=Constants.getCurrendUser().getUserId();
		String[] weightSizeList = spu.getColors().split(";");
		int i = 0;
		for (String weightSize : weightSizeList){
			Map<String, String> items = this.parseWeightSize(weightSize);
			String colorSims = items.get("simplified");
			String color = items.get("color");
			String size = items.get("size");
			Sku sku = new Sku(1,spu.getName(), spu.getMyid()+ "_" + colorSims + "_" + size,
					spu.getDistChName()+ " " +color+ " " + size, spu.getDistEnName(), color, size,
					Double.parseDouble(items.get("cost")), Double.parseDouble(items.get("weight")), spu.getDeveloper(),
					spu.getEnquirer(), spu.getBuyer(), "A",spu.getSupplier(),spu.getPurchaseLink(), userId, userId);
			publicDao.save(sku);
		}
		return true;
	}

	public Map<String, String> parseWeightSize(String weightSize) {
		Map<String, String> weightSizeMap = new HashMap<String, String>();
		String[] weightSizeSplit = weightSize.split(",");
		for(String item : weightSizeSplit){
         weightSizeMap.put(item.substring(0,item.indexOf(":")),item.substring(item.indexOf(":")+1));
		}
		return weightSizeMap;
	}

	/* (非 Javadoc)
        * <p>Title: delCustomer</p>
        * <p>Description: 删除客户以及关联联系人</p>
        * @param customerId
        * @return
        * @see com.palmelf.erp.service.CstService#delCustomer(java.lang.Integer)
        */
	public boolean delSpu(Integer spuId)
	{
		Integer userId = Constants.getCurrendUser().getUserId();
		Spu spu = (Spu)publicDao.get(Spu.class, spuId);
		spu.setLastmod(new Date());
		spu.setModifiyer(userId);
		spu.setStatus(Constants.PERSISTENCE_DELETE_STATUS);
		publicDao.deleteToUpdate(spu);
		String hql="from Sku t where t.spuId="+spu.getSpuId();
		List<Sku> list = publicDao.find(hql);
		for(Sku sku : list){
			sku.setStatus(Constants.PERSISTENCE_DELETE_STATUS);
			publicDao.deleteToUpdate(sku);
		}
		return true;
	}
	/* (非 Javadoc)
	* <p>Title: findSaleNameList</p>
	* <p>Description: 查询销售代表</p>
	* @return
	* @see com.palmelf.erp.service.CstService#findSaleNameList()
	*/
	public List<ColorClass> findColorList()
	{
		List<ColorClass> colors = new ArrayList<ColorClass>();
		for (Color color : Color.values()){
			colors.add(new ColorClass(color.getName(),color.getSimplified()));
		}
		return colors;
	}

	public List<SizeClass> findSizeList()
	{
		List<SizeClass> sizes = new ArrayList<SizeClass>();
		for (Size size : Size.values()){
			sizes.add(new SizeClass(size.getValue()));
		}
		return sizes;
	}
}
