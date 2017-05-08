package com.palmelf.erp.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.SerializeWriter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ModelDriven;
import com.palmelf.erp.model.Spu;
import com.palmelf.erp.service.SpuService;
import com.palmelf.erp.util.Color;
import com.palmelf.erp.util.Constants;
import com.palmelf.erp.util.PageUtil;
import com.palmelf.erp.viewModel.GridModel;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Namespace("/spu")
@Action(value = "spuAction")
public class SpuAction extends BaseAction implements ModelDriven<Spu>
{
	private static final long serialVersionUID = -1829373389433829721L;
	private SpuService spuService;

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
	public String persistenceSpu() throws Exception
	{
		OutputJson(getMessage(spuService.persistenceSpu(getModel())),Constants.TEXT_TYPE_PLAIN);
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
	* 函数功能说明 TODO:获取所有销售代表
	* Administrator修改者名字
	* 2013-6-24修改日期
	* 修改内容
	* @Title: findSaleNameList
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

//	public void OutputJson(List<Color> colorList) {
//		PrintWriter out = null;
//		HttpServletResponse httpServletResponse = ServletActionContext
//				.getResponse();
//		httpServletResponse.setContentType("application/json");
//		httpServletResponse.setCharacterEncoding("utf-8");
//		String json = null;
//		try {
//			out = httpServletResponse.getWriter();
//			json = JSON.toJSONString(colorList);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		logger.debug("json:" + json);
//		out.print(json);
//		out.close();
//	}

}
