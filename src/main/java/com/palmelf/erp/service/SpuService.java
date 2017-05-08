package com.palmelf.erp.service;

import com.palmelf.erp.model.Customer;
import com.palmelf.erp.model.CustomerContact;
import com.palmelf.erp.model.Spu;
import com.palmelf.erp.util.Color;
import com.palmelf.erp.util.ColorClass;
import com.palmelf.erp.util.PageUtil;
import com.palmelf.erp.util.SizeClass;
import com.palmelf.erp.viewModel.TreeModel;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public interface SpuService
{

	List<Spu> findSpu(Map<String, Object> param, PageUtil pageUtil);

	Long getCount(Map<String, Object> param, PageUtil pageUtil);

	boolean persistenceSpu(Spu spu);

	boolean delSpu(Integer spuId);

	List<Customer> findSpuNoPage(Map<String, Object> param, PageUtil pageUtil);

	List<ColorClass> findColorList();

	List<SizeClass> findSizeList();

}
