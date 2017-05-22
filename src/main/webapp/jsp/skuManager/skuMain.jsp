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
            $grid=$dg.datagrid({
                url : "spu/spuAction!findSpuList.action",
                view: detailview,
                detailFormatter:function(index,row){
                    return "<div class='ddv' style='padding:5px 0'></div>";
                },
                onExpandRow: function(index,row) {
                    var ddv = $(this).datagrid('getRowDetail', index).find('div.ddv');
                    ddv.edatagrid({
                        url : "spu/spuAction!findSkuBySpu.action?spuId=" + row.spuId,
						saveUrl: "sku/skuAction!persistenceSku.action",
                        updateUrl: "sku/skuAction!persistenceSku.action",
                        destroyUrl: "sku/skuAction!delSpu.action",
                        autoSave: true,
                        fitColumns:true,
                        singleSelect:true,
                        loadMsg:'',
                        height:'auto',
                        width : 'auto',
                        columns:[[
                            {field:'myid',title:'sku标识',width : 50,},
                            {field:'color',title:'颜色',width : 50},
                            {field:'size',title:'尺寸',width : 50},
					        {field:'weight',title:'重量',editor:{type:'numberbox',options:{precision:2}},width : 50},
					        {field:'latestCost',title:'最新报价',editor:{type:'numberbox',options:{precision:2}},width : 50}
                        ]],
                        onSave:function (index,row) {
                            parent.$.messager.show({
                                title : 'success',
                                msg : row.myid + ' saved!',
                                timeout : 1000 * 2
                            });
                        },
                        onResize:function(){
                            $('#dg').datagrid('fixDetailRowHeight',index);
                            $('#dg').edatagrid('fixDetailRowHeight',index);
                        },
                        onLoadSuccess:function(){
                            setTimeout(function(){
                                $('#dg').datagrid('fixDetailRowHeight',index);
                                $('#dg').edatagrid('fixDetailRowHeight',index);
                            },0);
                        }
                    });
                    $dg.datagrid('fixDetailRowHeight',index);
                },
                width : 'auto',
                height : $(this).height()-85,
                pagination:true,
                rownumbers:true,
                border:true,
                striped:true,
                singleSelect:true,
                columns : [ [ {field : 'name',title : '商品名称',width : parseInt($(this).width()*0.1)},
                    {field : 'myid',title : 'spu标识',width : parseInt($(this).width()*0.1)},
                    {field : 'distChName',title : '中文配货名称',width : parseInt($(this).width()*0.1)},
                    {field : 'distEnName',title : '英文配货名称',width : parseInt($(this).width()*0.1)},
                    {field : 'colors',title : '颜色列表',width : parseInt($(this).width()*0.1)},
                    {field : 'size',title : '尺码列表',width : parseInt($(this).width()*0.1)},
                    {field : 'latestCost',title : '最新报价',width : parseInt($(this).width()*0.1)},
                    {field : 'weight',title : '重量',width : parseInt($(this).width()*0.1)},
                    {field : 'developer',title : '业务开发员',width : parseInt($(this).width()*0.1)},
                    {field : 'enquirer',title : '询价员',width : parseInt($(this).width()*0.1)},
                    {field : 'buyer',title : '采购员',width : parseInt($(this).width()*0.1)}
                ] ],toolbar:'#tb'
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
								url:"spu/spuAction!delSpu.action",
								data: "spuId="+row.spuId,
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
                window.location.href="<%=basePath%>spu/spuAction!exportSkuList.action";
            }else{
                parent.$.messager.show({
                    title :"提示",
                    msg :"暂无导出数据!",
                    timeout : 1000 * 2
                });
            }
        }
			//弹窗修改
			function updRowsOpenDlg() {
				var row = $dg.datagrid('getSelected');
				if (row) {
					parent.$.modalDialog({
						title : '编辑sku',
						width : 900,
						height :550,
						href : "jsp/skuManager/skuEditDlg.jsp?tempId="+row.spuId,
						onLoad:function(){
							var f = parent.$.modalDialog.handler.find("#form");
							row.saleId=(typeof(row.saleId)=="undefined")?row.saleId:"0"+row.saleId;
							row.cityId=(typeof(row.cityId)=="undefined")?row.cityId:"0"+row.cityId;
							f.form("load", row);
						},			
						buttons : [ {
							text : '编辑',
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
				}else{
					parent.$.messager.show({
						title :"提示",
						msg :"请选择一行记录!",
						timeout : 1000 * 2
					});
				}
			}
			//弹窗增加
			function addRowsOpenDlg() {
				parent.$.modalDialog({
					width : 900,
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
						<shiro:hasPermission name="skuEdit">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updRowsOpenDlg();">编辑</a>
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
