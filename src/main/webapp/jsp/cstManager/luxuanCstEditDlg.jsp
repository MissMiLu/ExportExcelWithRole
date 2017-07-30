<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<script type="text/javascript">
	var $dg;
	var $tree;
	$(function() {
		$("#tt").tabs({
			border:false,
			width:'auto',
			height:$(this).height()-340
		});

		
		$("#form").form({
			url :"luxuanCst/luxuanCstAction!persistenceCustomer.action",
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
				<div title="基本资料" data-options="iconCls:'icon-cstbase'" style="padding:10px">
						<fieldset>
							<legend>基本资料编辑</legend>
							<input name="customerId" id="customerId"  type="hidden"/>
							<input name="creater" id="creater"  type="hidden"/>
							<input name="status" id="status"  type="hidden"/>
							 <table class="table">
								 <tr>
								    <th>宝宝名字</th>
									<td><input name="baby_name" id="baby_name" placeholder="请输入宝宝名字" class="easyui-textbox easyui-validatebox" type="text" data-options="required:true"/></td>
									<th>会员卡号</th>
									<td><input name="myid" id="myid" type="text"  class="easyui-textbox easyui-validatebox" data-options="required:true"/></td>
									<th>宝宝性别</th>
									 <td><select id="baby_sex" class="easyui-combobox" name="baby_sex" style="width:171px;">
										 <option value="男">男</option>
										 <option value="女">女</option>
									 </select>
									 </td>
								 </tr>
								 <tr>
									<th>家长名字</th>
									<td><input id="parent_name" name="parent_name" type="text" class="easyui-textbox easyui-validatebox" /></td>
								    <th>联系方式</th>
									<td><input name="tel" id="tel" type="text" class="easyui-textbox easyui-validatebox" /></td>
								    <th>会员积分</th>
									<td><input id="member_point" name="member_point" type="text" class="easyui-textbox easyui-validatebox" /></td>
								 </tr>
							   </table>
						</fieldset>
				</div>
		  </div>
		</form>
	</div>
</div>
