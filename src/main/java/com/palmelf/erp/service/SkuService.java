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

	boolean persistenceSku(Sku sku);

	boolean delSku(Integer skuId);

}
