<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<script type="text/javascript">
	var $dg;
	var $tree;
	var $colors_value
	$(function() {
		$("#tt").tabs({
			border:false,
			width:'auto'
		});
		
		$("#form").form({
			url :"spu/spuAction!persistenceSpu.action",
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.status) {
					parent.reload;
					parent.$.modalDialog.openner.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_datagrid这个对象，是因为页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
					parent.$.messager.show({
						title : result.title,
						msg : result.message,
						timeout : 1000 * 2
					});
				}else{
					parent.$.messager.show({
						title :  result.title,
						msg : result.message,
						timeout : 1000 * 2
					});
				}
			}
		});
	});
    $colorSizeWeightCostList = $("#colorSizeWeightCostList");
    $colorSizeWeightCostListGrid=$colorSizeWeightCostList.datagrid({
        url : '',
        width : 'auto',
        height : $(this).height()-380,
        border:false,
        fit:true,
        singleSelect:true,
        columns : [ [
            {field : 'weight',title : '重量',width : 75,align : 'left'},
            {field : 'cost',title : '价格',width : 75,align : 'left'},
            {field : 'simplified',title : '颜色简称',width : 75,align : 'left'},
            {field : 'name',title : '颜色',width : 75,align : 'left'},
            {field : 'size',title : '尺寸',width : 75,align : 'left'}
        ] ]
    });
	//弹窗增加区域
	function selectColorDlg() {
		$("<div/>").dialog({
			href : "jsp/skuManager/colorEditDlg.jsp",
			width : 1200,
			height : 700,
			title: '颜色&尺码&重量&价格',
			modal : true,
            resizable: true,
            maximizable:true,
			buttons : [{
				text : '保存',
				iconCls : 'icon-ok',
				handler : function() {
                    var colorSizeWeightCostRows = $('#colorSizeWeightCost').datagrid('getRows');
                    var colorSizeWeightCostArray = [];
                    for ( var i = 0; i < colorSizeWeightCostRows.length; i++) {
                        $colorSizeWeightCostList.datagrid('appendRow', colorSizeWeightCostRows[i]);
                        var colorSizeWeightCostRowJson = 'weight:'+ colorSizeWeightCostRows[i].weight + "," + "cost:"+ colorSizeWeightCostRows[i].cost + ","
						+"simplified:"+colorSizeWeightCostRows[i].simplified + "," + "color:"+ colorSizeWeightCostRows[i].name + "," + "size:" + colorSizeWeightCostRows[i].size;
                        colorSizeWeightCostArray.push(colorSizeWeightCostRowJson);
                    }
                    var colorSizeWeightCostString = colorSizeWeightCostArray.join(";");
                    $("#colors").val(colorSizeWeightCostString);
                    $(this).closest('.window-body').dialog('destroy');
                }
			},{
				text : '取消',
				iconCls : 'icon-cancel',
				handler : function() {
					 $(this).closest('.window-body').dialog('destroy');
				}
			}],
			onClose : function() {
				$(this).dialog('destroy');
			}
		});
	}
</script>
<style>
	.easyui-textbox{
		height: 18px;
		width: 170px;
		line-height: 16px;
	    /*border-radius: 3px 3px 3px 3px;*/
	    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
	    transition: border 0.2s linear 0s, box-shadow 0.2s linear 0s;
	}
	
	textarea:focus, input[type="text"]:focus{
	    border-color: rgba(82, 168, 236, 0.8);
	    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(82, 168, 236, 0.6);
	    outline: 0 none;
		}
		
	
	fieldset {
	    border: 0 none;
	    margin: 0;
	    padding: 0;
	}
	legend {
	    -moz-border-bottom-colors: none;
	    -moz-border-left-colors: none;
	    -moz-border-right-colors: none;
	    -moz-border-top-colors: none;
	    border-color: #E5E5E5;
	    border-image: none;
	    border-style: none none solid;
	    border-width: 0 0 1px;
	    color: #999999;
	    line-height: 20px;
	    display: block;
	    margin-bottom: 10px;
	    padding: 0;
	    width: 100%;
	}
	input, textarea {
	    font-weight: normal;
	}
	.table {
	    background-color: transparent;
	    border-collapse: collapse;
	    border-spacing: 0;
	    max-width: 100%;
	}
	
	.table{
		text-align:left;
		padding: 6px 10px 6px 10px;
	}
	.table th{
		text-align:left;
		padding: 6px 10px 6px 10px;
	}
	.table td{
		text-align:left;
		padding: 6px 10px 6px 10px;
	}
</style>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="">
	<input name="tempId" id="tempId"  type="hidden" value="<%=request.getParameter("tempId")==null?"":request.getParameter("tempId")%>"/>
		<form id="form" method="post">
			<div id="tt">
				<div title="spu编辑" data-options="iconCls:'icon-cstbase'" style="padding:10px">
						<fieldset>
							<legend>spu编辑</legend>
							<input name="spuId" id="spuId"  type="hidden"/>
							<input name="creater" id="creater"  type="hidden"/>
							<input name="inserted" id="inserted"  type="hidden"/>
							<input name="updated" id="updated"  type="hidden"/>
							<input name="deleted" id="deleted"  type="hidden"/>
							 <table class="table">
								 <tr>
								    <th>商品名称</th>
									<td><input name="name" id="name" placeholder="请输入商品名称" class="easyui-textbox easyui-validatebox" type="text" data-options="required:true"/></td>
									<th>spu编码</th>
									<td><input name="myid" id="myid" type="text"  class="easyui-textbox easyui-validatebox" data-options="required:true"/></td>
									<th>中文配货名称</th>
									<td><input name="distChName" id="distChName" type="text" class="easyui-textbox easyui-validatebox" /></td>
								 </tr>
								 <tr>
									 <th>业务开发员</th>
									 <td><input id="developer" name="developer" type="text" class="easyui-textbox easyui-validatebox"/></td>
									 <th>询价员</th>
									 <td><input id="enquirer" name="enquirer" type="text" class="easyui-textbox easyui-validatebox"/></td>
									 <th>采购员</th>
									 <td><input id="buyer" name="buyer" type="text" class="easyui-textbox easyui-validatebox"/></td>
								 </tr>
								 <tr>
									 <th>英文配货名称</th>
									 <td><input id="distEnName" name="distEnName" type="text" class="easyui-textbox easyui-validatebox" /></td>
									 <th>颜色尺寸</th>
									 <td><input id="colors" name="colors" type="hidden" class="easyui-textbox easyui-validatebox"/><img src="../../extend/area.png" style="margin-left:2px;margin-bottom: -5px;cursor: pointer;" onclick="selectColorDlg();"/></td>
								 </tr>
								 <tr>
									 <th>供应商</th>
									 <td colspan="3"><textarea class="easyui-textbox" id="supplier" name="supplier" style="width: 510px;height: 60px;"></textarea></td>
								 </tr>
								 <tr>
									 <th>采购链接</th>
									 <td colspan="3"><textarea class="easyui-textbox" id="purchaseLink" name="purchaseLink" style="width: 510px;height: 60px;"></textarea></td>
								 </tr>
								 <table id="colorSizeWeightCostList" style="width: auto">
								 </table>
							   </table>
						</fieldset>
				</div>
		  </div>
		</form>
	</div>
</div>
