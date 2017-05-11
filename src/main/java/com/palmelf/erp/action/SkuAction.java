package com.palmelf.erp.action;

import com.opensymphony.xwork2.ModelDriven;
import com.palmelf.erp.model.Sku;
import com.palmelf.erp.model.Spu;
import com.palmelf.erp.service.SkuService;
import com.palmelf.erp.service.SpuService;
import com.palmelf.erp.util.Constants;
import com.palmelf.erp.util.PageUtil;
import com.palmelf.erp.viewModel.GridModel;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

@Namespace("/sku")
@Action(value = "skuAction")
public class SkuAction extends BaseAction implements ModelDriven<Sku>
{
	private static final long serialVersionUID = -1829373389433829721L;
	private SkuService skuService;

    private Sku sku;

    public Sku getSku()
    {
        return sku;
    }

    public void setSku(Sku sku )
    {
        this.sku = sku;
    }
	@Autowired
	public void setSkuService(SkuService skuService )
	{
		this.skuService = skuService;
	}


	public String persistenceSku() throws Exception
	{
		OutputJson(getMessage(skuService.persistenceSku(getModel())),Constants.TEXT_TYPE_PLAIN);
		return null;
	}

	public String delSpu() throws Exception
	{
		OutputJson(getMessage(skuService.delSku(getModel().getSkuId())));
		return null;
	}

	public Sku getModel()
	{
		if (null == sku)
		{
			sku=new Sku();
		}
		return sku;
	}


}
