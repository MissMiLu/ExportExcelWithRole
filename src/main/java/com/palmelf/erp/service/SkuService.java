package com.palmelf.erp.service;

import com.palmelf.erp.model.Sku;
import com.palmelf.erp.model.Spu;
import com.palmelf.erp.util.ColorClass;
import com.palmelf.erp.util.PageUtil;
import com.palmelf.erp.util.SizeClass;

import java.util.List;
import java.util.Map;

public interface SkuService
{
	List<Sku> findSku(Map<String, Object> param, PageUtil pageUtil);

	Long getCount(Map<String, Object> param, PageUtil pageUtil);

	List<Sku> findSkuNoPage(Map<String, Object> param, PageUtil pageUtil);

	boolean persistenceSku(Sku sku);

	boolean delSku(Integer skuId);

}
