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
	function endEdit(){
		var flag=true;
		var rows = $dg.datagrid('getRows');
		for ( var i = 0; i < rows.length; i++) {
			$dg.datagrid('endEdit', i);
			var temp=$dg.datagrid('validateRow', i);
			if(!temp){flag=false;}
		}
		return flag;
	}
	//弹窗增加区域
	function selectColorDlg() {
		$("<div/>").dialog({
			href : "jsp/skuManager/colorEditDlg.jsp",
			width : 800,
			height : 650,
			modal : true,
			buttons : [{
				text : '选择',
				iconCls : 'icon-ok',
				handler : function() {
                    var row = $('#colorDlg').datagrid('getSelections');
                    var i = 0;
                    var colors = "";
                    var shortColors = "";
                    for(i;i<row.length;i++){
                        colors += row[i].name;
                        shortColors += row[i].simplified;
                        if(i < row.length-1){
                            colors += ',';
                            shortColors += ',';
                        }else{
                            break;
                        }
                    }

                    $('#shortColors').attr("value",shortColors);
					$('#colors').attr("value",colors);
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
    function editSizeDlg() {
        $("<div/>").dialog({
            href : "jsp/skuManager/sizeEditDlg.jsp",
            width : 600,
            height : 500,
            modal : true,
            buttons : [ {
                text : '选择',
                iconCls : 'icon-ok',
                handler : function() {
                    var row = $('#sizeDlg').datagrid('getSelections');
                    var i = 0;
                    var sizes = "";
                    for(i;i<row.length;i++){
                        sizes += row[i].value;
                        if(i < row.length-1){
                            sizes += ',';
                        }else{
                            break;
                        }
                    }
                    $('#size').attr("value",sizes);
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
							<input name="shortColors" id="shortColors"  type="hidden"/>
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
									<th>英文配货名称</th>
									<td><input id="distEnName" name="distEnName" type="text" class="easyui-textbox easyui-validatebox" /></td>
								    <th>重量</th>
									<td><input name="weight" id="weight" type="text" class="easyui-textbox easyui-validatebox" /></td>
								    <th>最新报价</th>
									<td><input id="latestCost" name="latestCost" type="text" class="easyui-textbox easyui-validatebox" /></td>
								 </tr>
								  <tr>
									<th>颜色列表</th>
									<td><input id="colors" name="colors" type="text" class="easyui-textbox easyui-validatebox"/><img src="../../extend/area.png" style="margin-left:2px;margin-bottom: -5px;cursor: pointer;" onclick="selectColorDlg();"/></td>
									<th>尺码列表</th>
									<td><input id="size" name="size" type="text" class="easyui-textbox easyui-validatebox"/><img src="../../extend/area.png" style="margin-left:2px;margin-bottom: -5px;cursor: pointer;" onclick="editSizeDlg();"/></td>
									 <th>业务开发员</th>
									<td><input id="developer" name="developer" type="text" class="easyui-textbox easyui-validatebox"/></td>
								 </tr>
								 <tr>
									 <th>询价员</th>
									 <td><input id="enquirer" name="enquirer" type="text" class="easyui-textbox easyui-validatebox"/></td>
									 <th>采购员</th>
									 <td><input id="buyer" name="buyer" type="text" class="easyui-textbox easyui-validatebox"/></td>
								 </tr>
							   </table>
						</fieldset>
				</div>
		  </div>
		</form>
	</div>
</div>
