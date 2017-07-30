package com.palmelf.erp.service;

import com.palmelf.erp.model.Customer;
import com.palmelf.erp.model.CustomerContact;
import com.palmelf.erp.model.LuxuanCustomer;
import com.palmelf.erp.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface LuxuanCstService
{

	List<LuxuanCustomer> findCustomerList(Map<String, Object> param, PageUtil pageUtil);

	Long getCount(Map<String, Object> param, PageUtil pageUtil);

	boolean persistenceCustomer(LuxuanCustomer c, Map<String, List<CustomerContact>> map);

	boolean delCustomer(Integer customerId);

	List<LuxuanCustomer> findCustomerListNoPage(Map<String, Object> param, PageUtil pageUtil);

}
