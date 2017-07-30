<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>SPU管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="../../layout/script.jsp"></jsp:include>
	<script type="text/javascript">
        var $dg;
        var $grid;
        $(function() {
            $dg = $("#dg");
            $grid=$dg.edatagrid({
                url : "sku/skuAction!findSkuList.action",
                saveUrl: "sku/skuAction!persistenceSku.action",
                updateUrl: "sku/skuAction!persistenceSku.action",
                autoSave: true,
                width : 'auto',
                height : $(this).height()-85,
                pagination:true,
                border:true,
                striped:true,
                singleSelect:true,
                columns : [ [ {field : 'name',title : '商品名称',editor : "text",width : parseInt($(this).width()*0.1)},
                    {field : 'myid',title : 'sku标识',editor : "text",width : parseInt($(this).width()*0.1)},
                    {field : 'distChName',title : '中文配货名称',editor : "text",width : parseInt($(this).width()*0.1)},
                    {field : 'distEnName',title : '英文配货名称',editor : "text",width : parseInt($(this).width()*0.1)},
                    {field : 'color',title : '颜色',width : parseInt($(this).width()*0.1)},
                    {field : 'size',title : '尺码',width : parseInt($(this).width()*0.1)},
                    {field : 'latestCost',title : '最新报价',editor : {type:'numberbox',options:{precision:2}},width : parseInt($(this).width()*0.1)},
                    {field : 'weight',title : '重量',editor : {type:'numberbox',options:{precision:2}},width : parseInt($(this).width()*0.1)},
                    {field : 'developer',title : '业务开发员',editor : "text",width : parseInt($(this).width()*0.1)},
                    {field : 'enquirer',title : '询价员',editor : "text",width : parseInt($(this).width()*0.1)},
                    {field : 'buyer',title : '采购员',editor : "text",width : parseInt($(this).width()*0.1)}
                ] ],toolbar:'#tb',
                onSave:function (index,row) {
                            parent.$.messager.show({
                                title : 'success',
                                msg : row.myid + ' saved!',
                                timeout : 1000 * 2
                            });
                        },
            });
            //搜索框
            $("#searchbox").searchbox({
                menu:"#mm",
                prompt :'模糊查询',
                searcher:function(value,name){
                    var str="{\"searchName\":\""+name+"\",\"searchValue\":\""+value+"\"}";
                    var obj = eval('('+str+')');
                    $dg.datagrid('reload',obj);
                }

            });
        });
			//删除
			function delRows(){
				var row = $dg.datagrid('getSelected');
				if(row){
					var rowIndex = $dg.datagrid('getRowIndex', row);
					parent.$.messager.confirm("提示","确定要删除记录吗?",function(r){  
					    if (r){  
					    	$dg.datagrid('deleteRow', rowIndex);
					    	$.ajax({
								url:"sku/skuAction!delSku.action",
								data: "skuId="+row.skuId,
								success: function(rsp){
									parent.$.messager.show({
										title : rsp.title,
										msg : rsp.message,
										timeout : 1000 * 2
									});
								}
							});
					    }  
					});
				}else{
					parent.$.messager.show({
						title : "提示",
						msg :"请选择一行记录!",
						timeout : 1000 * 2
					});
				}
			}

        //导出
        function exportRows() {
            var rows = $dg.datagrid("getRows");
            if(rows.length){
                window.location.href="<%=basePath%>sku/skuAction!exportSkuList.action";
            }else{
                parent.$.messager.show({
                    title :"提示",
                    msg :"暂无导出数据!",
                    timeout : 1000 * 2
                });
            }
        }
			//弹窗增加
			function addRowsOpenDlg() {
				parent.$.modalDialog({
					width : 1000,
					height :550,
					href : "jsp/skuManager/skuEditDlg.jsp",
					buttons : [ {
						text : '保存',
						iconCls : 'icon-ok',
						handler : function() {
							parent.$.modalDialog.openner= $grid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler.find("#form");
							f.submit();
						}
					}, {
						text : '取消',
						iconCls : 'icon-cancel',
						handler : function() {
							parent.$.modalDialog.handler.dialog('destroy');
							parent.$.modalDialog.handler = undefined;
						}
					}
					]
				});
			}
			
			//高级搜索 删除 row
			function tbCompanySearchRemove(curr) {
					$(curr).closest('tr').remove();
			}
			//高级查询
			function tbsCompanySearch() {
				jqueryUtil.gradeSearch($dg,"#tbCompanySearchFm","jsp/company/companySearchDlg.jsp");
			}
		</script>
  </head>
  <body>
      <div data-options="region:'center',border : false">
  		<div class="well well-small" style="margin-left: 5px;margin-top: 5px">
				<span class="badge">提示</span>
				<p>
					在此你可以对<span class="label-info"><strong>sku</strong></span>进行编辑!
				</p>
		</div>
		<div id="tb" style="padding:2px 0">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding-left:2px">
						<shiro:hasPermission name="skuAdd">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addRowsOpenDlg();">添加</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="skuDel">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delRows();">删除</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="skuExport">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-excel" plain="true" onclick="exportRows();">导出</a>
						</shiro:hasPermission>
					</td>
					<td style="padding-left:2px">
						<input id="searchbox" type="text"/>
					</td>
					<td style="padding-left:2px">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="javascript:void(0);">高级查询</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="mm">
				<div name="name">商品名称</div>
				<div name="myid">spu编码</div>
		</div>
		<table id="dg" title="sku管理"></table>
  	</div>	
  </body>
</html>
