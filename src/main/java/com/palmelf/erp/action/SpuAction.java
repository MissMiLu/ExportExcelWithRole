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

	private  static final  int columnCount = 27;

	private Spu spu;

	private HSSFCell cell;


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

	public String findSkuBySpu() throws Exception
	{
		GridModel gridModel=new GridModel();
		gridModel.setRows(spuService.findSkuBySpu(getModel().getSpuId()));
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
	* 函数功能说明
	* Administrator修改者名字
	* 2013-6-24修改日期
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

	public String  exportSkuList() throws  Exception{


		HSSFWorkbook workbook = getExcelFile();

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		String filename = "商品信息";

		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String excelName = format.format(new Date());
		String path = filename + "-" + excelName + ".xls";
		String fegefu = File.separator;

		String severPath = request.getSession().getServletContext().getRealPath(fegefu);
		String allPath = severPath  + fegefu + path;
		FileOutputStream ouputStream = null;
		try {
			ouputStream = new FileOutputStream(allPath);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {

			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		FileUtil.downFile(path, response, allPath);
		return null;

	}
	public List<String> getHeadColums(){

		List<String> list = new ArrayList<String>();
		list.add("图片URL");
		list.add("SKU");
		list.add("SKU别名");
		list.add("商品名称");
		list.add("分类");
		list.add("品牌");
		list.add("中文配货名称");
		list.add("英文配货名称");
		list.add("中文报关名");
		list.add("英文报关名");
		list.add("海关编码(HS code)");
		list.add("商品平均成本（CNY）");
		list.add("商品最新成本(CNY)");
		list.add("商品尺寸(长cm)");
		list.add("商品尺寸(宽cm)");
		list.add("商品尺寸(高cm)");
		list.add("包装成本(CNY)");
		list.add("包装重量(g)");
		list.add("包装材料");
		list.add("包装尺寸(长cm)");
		list.add("包装尺寸(宽cm)");
		list.add("包装尺寸(高cm)");
		list.add("业务开发员");
		list.add("采购询价员");
		list.add("采购员");
		list.add("首选供应商");
		list.add("最小采购量");

		return list;
	}

	public HSSFWorkbook getExcelFile() throws IOException {

		// 初始化一个Excel文件；
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 为这个Excel文件创建一个工作簿；
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0,"商品信息");

		// 设置列宽 后面再具体改
		for (int i = 0;i <columnCount ; i++){
			sheet.setColumnWidth(i,5000);
		}

		{
			// 创建表头：首先创建一行，让后在这行里放置单元格中的数据
			HSSFRow row = sheet.createRow(0);
			row.setHeight((short) 1000);
			// 获得头部样式；
			CellStyle cs = new CellStyle();
			HSSFCellStyle styleData = cs.getDataStyle(workbook);
			HSSFCellStyle styleHead = cs.getTableHeadStyle(workbook);

			List<String> columnHeaderList = getHeadColums();
			for (int i = 0; i <columnCount ; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(styleHead);
				cell.setCellValue(columnHeaderList.get(i));
			}

			Map<String, Object> map=new HashMap<String, Object>();
			if (null!=searchValue&&!"".equals(searchValue))
			{
				map.put(searchName, Constants.GET_SQL_LIKE+searchValue+Constants.GET_SQL_LIKE);
			}
			PageUtil pageUtil=new PageUtil(page, rows, searchAnds, searchColumnNames, searchConditions, searchVals);

			List<Sku> list = spuService.findSkuNoPage(map, pageUtil);

			// 创建数据
			SetCellData(sheet, styleData, list);
		}

		return workbook;
	}

	private void SetCellData(HSSFSheet sheet,HSSFCellStyle styleData,List<Sku> list) {
		// 创建数据
		int i = 1;
		for (Sku s : list) {

			HSSFRow row = sheet.createRow(i);
			row.setHeight((short) 600);

			for (int j = 0; j < columnCount ; j++) {

				cell = row.createCell(j);
				cell.setCellStyle(styleData);

				switch(j)

				{
					case 1:
						cell.setCellValue(s.getMyid());
						break;
					case 3:
						cell.setCellValue(s.getName());
						break;
					case 6:
						cell.setCellValue(s.getDistChName());
						break;
					case 7:
						cell.setCellValue(s.getDistEnName());
						break;
					case 8:
						cell.setCellValue(s.getDistChName());
						break;
					case 9:
						cell.setCellValue(s.getDistEnName());
						break;
					case 12:
						cell.setCellValue(s.getLatestCost());
						break;
					case 17:
						cell.setCellValue(s.getWeight());
						break;
					case 22:
						cell.setCellValue(s.getDeveloper());
						break;
					case 23:
						cell.setCellValue(s.getEnquirer());
						break;
					case 24:
						cell.setCellValue(s.getBuyer());
						break;
					default:
						cell.setCellValue("");
						break;
				}
			}
			i++;
		}
	}


}
