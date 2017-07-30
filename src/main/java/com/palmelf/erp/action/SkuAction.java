package com.palmelf.erp.action;

import com.opensymphony.xwork2.ModelDriven;
import com.palmelf.erp.model.Sku;
import com.palmelf.erp.service.SkuService;
import com.palmelf.erp.util.CellStyle;
import com.palmelf.erp.util.Constants;
import com.palmelf.erp.util.FileUtil;
import com.palmelf.erp.util.PageUtil;
import com.palmelf.erp.viewModel.GridModel;
import org.apache.poi.hssf.usermodel.*;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Namespace("/sku")
@Action(value = "skuAction")
public class SkuAction extends BaseAction implements ModelDriven<Sku>
{
	private static final long serialVersionUID = -1829373389433829721L;
	private SkuService skuService;

	private HSSFCell cell;

	private  static final  int columnCount = 29;

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

	public String findSkuList() throws Exception
	{
		Map<String, Object> map=new HashMap<String, Object>();
		if (null!=searchValue&&!"".equals(searchValue))
		{
			map.put(searchName, Constants.GET_SQL_LIKE+searchValue+Constants.GET_SQL_LIKE);
		}
		PageUtil pageUtil=new PageUtil(page, rows, searchAnds, searchColumnNames, searchConditions, searchVals);
		GridModel gridModel=new GridModel();
		gridModel.setRows(skuService.findSku(map, pageUtil));
		gridModel.setTotal(skuService.getCount(map,pageUtil));
		OutputJson(gridModel);
		return null;
	}


	public String persistenceSku() throws Exception
	{
		OutputJson(getMessage(skuService.persistenceSku(getModel())),Constants.TEXT_TYPE_PLAIN);
		return null;
	}

	public String delSku() throws Exception
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
		list.add("供应商");
		list.add("采购链接");

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

			List<Sku> skuList = skuService.findSkuNoPage(map, pageUtil);
			// 创建数据
			SetCellData(sheet, styleData, skuList);
			for(Sku sku : skuList){
				skuService.delSku(sku.getSkuId());
			}
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
					case 27:
						cell.setCellValue(s.getSupplier());
						break;
					case 28:
						cell.setCellValue(s.getPurchaseLink());
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
