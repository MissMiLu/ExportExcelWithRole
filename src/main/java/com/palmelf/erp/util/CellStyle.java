package com.palmelf.erp.util;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

/**
 * Created by lzy on 2017/5/12.
 */
public class CellStyle {

    public CellStyle() {

    }

    public HSSFCellStyle getTableHeadStyle(HSSFWorkbook workbook) {
        HSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setWrapText(true);
        style.setFillForegroundColor(new HSSFColor.GREY_40_PERCENT().getIndex());
        style.setFillBackgroundColor(new HSSFColor.GREY_40_PERCENT().getIndex());
        style.setFillPattern(HSSFCellStyle.SPARSE_DOTS);

        HSSFFont font = workbook.createFont();
        font.setColor(HSSFFont.COLOR_NORMAL);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setFontName("宋体");
        font.setFontHeight((short) 300);
        style.setFont(font);
        return style;
    }

    public HSSFCellStyle getDataStyle(HSSFWorkbook workbook) {
        HSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setWrapText(true);
        HSSFFont font = workbook.createFont();
        font.setColor((short) 123412);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        font.setFontName("宋体");
        font.setFontHeight((short) 250);
        style.setFont(font);
        return style;
    }

}