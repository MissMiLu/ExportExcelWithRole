package com.palmelf.erp.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.SerializeWriter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ModelDriven;
import com.palmelf.erp.model.Sku;
import com.palmelf.erp.model.Spu;
import com.palmelf.erp.service.SkuService;
import com.palmelf.erp.service.SpuService;
import com.palmelf.erp.util.*;
import com.palmelf.erp.viewModel.GridModel;
import org.apache.poi.hssf.usermodel.*;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Namespace("/spu")
@Action(value = "spuAction")
public class SpuAction extends BaseAction implements ModelDriven<Spu>
{
	private static final long serialVersionUID = -1829373389433829721L;
	private SpuService spuService;
	private SkuService skuService;
	private Spu spu;

	public Spu getSpu()
    {
        return spu;
    }

    public void setSpu(Spu spu )
    {
        this.spu = spu;
    }
	@Autowired
	public void setSpuService(SpuService spuService )
	{
		this.spuService = spuService;
	}

	/**
	*/
	public String findSpuList() throws Exception
	{
		Map<String, Object> map=new HashMap<String, Object>();
		if (null!=searchValue&&!"".equals(searchValue))
		{
			map.put(searchName, Constants.GET_SQL_LIKE+searchValue+Constants.GET_SQL_LIKE);
		}
		PageUtil pageUtil=new PageUtil(page, rows, searchAnds, searchColumnNames, searchConditions, searchVals);
		GridModel gridModel=new GridModel();
		gridModel.setRows(spuService.findSpu(map, pageUtil));
		gridModel.setTotal(spuService.getCount(map,pageUtil));
		OutputJson(gridModel);
		return null;
	}

	/**
	*/
	public String findSpuListNoPage() throws Exception
	{
		Map<String, Object> map=new HashMap<String, Object>();
		if (null!=searchValue&&!"".equals(searchValue))
		{
			map.put(searchName, Constants.GET_SQL_LIKE+searchValue+Constants.GET_SQL_LIKE);
		}
		PageUtil pageUtil=new PageUtil(page, rows, searchAnds, searchColumnNames, searchConditions, searchVals);
		GridModel gridModel=new GridModel();
		gridModel.setRows(spuService.findSpuNoPage(map, pageUtil));
		gridModel.setTotal(null);
		OutputJson(gridModel);
		return null;
	}

	public String findSkuBySpu() throws Exception
	{
		GridModel gridModel=new GridModel();
		gridModel.setRows(spuService.findSkuBySpu(getModel().getSpuId()));
		gridModel.setTotal(null);
		OutputJson(gridModel);
		return null;
	}

	/**
	*/
	public String persistenceSpu() throws Exception
	{
		OutputJson(getMessage(spuService.persistenceSpu(getModel())),Constants.TEXT_TYPE_PLAIN);
		return null;
	}

	/**
	* 函数功能说明
	* Administrator修改者名字
	* 修改内容
	* @Title: delSpu
	* @Description:
	* @param @return
	* @param @throws Exception    设定文件
	* @return String    返回类型
	* @throws
	*/
	public String delSpu() throws Exception
	{
		OutputJson(getMessage(spuService.delSpu(getModel().getSpuId())));
		return null;
	}

	public Spu getModel()
	{
		if (null == spu)
		{
            spu=new Spu();
		}
		return spu;
	}

	/**
	* 修改内容
	* @Title: findColorList
	* @Description:
	* @param @return
	* @param @throws Exception    设定文件
	* @return String    返回类型
	* @throws
	*/
	public String findColors() throws Exception
	{
		OutputJson(spuService.findColorList());
		return null;
	}

	public String findSizes() throws Exception
	{
		OutputJson(spuService.findSizeList());
		return null;
	}

}
