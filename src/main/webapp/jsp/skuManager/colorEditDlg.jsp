<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $("#colorDlg").datagrid({
        url : "spu/spuAction!findColors.action",
        pagination:false,
        autoRowHeight:true,
        border:true,
        striped:true,
        fit:true,
        singleSelect:false,
        selectOnCheck:true,
        columns : [ [
            {field : 'ck',checkbox : true,width : parseInt($(this).width()*0.1)},
            {field : 'name',title : '颜色',width : parseInt($(this).width()*0.1)}
        ] ]
    });
    $cusColor = $("#cusColor");
    $grid=$cusColor.datagrid({
        url : '',
        width : 'auto',
        height : $(this).height()-380,
        rownumbers:true,
        border:false,
        singleSelect:true,
        columns : [ [
            {field : 'simplified',title : '颜色简称',width : parseInt($(this).width()*0.1),align : 'left',editor : "text"},
            {field : 'name',title : '颜色',width : parseInt($(this).width()*0.1),align : 'left',editor : "text"}
        ] ],toolbar:'#ccTbar'
    });

    function addRows(){
        $cusColor.datagrid('appendRow', {});
        var rows = $cusColor.datagrid('getRows');
        $cusColor.datagrid('beginEdit', rows.length - 1);
    }

    function endEdit(){
        var flag=true;
        var rows = $cusColor.datagrid('getRows');
        for ( var i = 0; i < rows.length; i++) {
            $cusColor.datagrid('endEdit', i);
            var temp=$cusColor.datagrid('validateRow', i);
            if(!temp){flag=false;}
        }
        return flag;
    }
    function saveRows(){
        var flag=true;
        var rows = $cusColor.datagrid('getRows');
        for ( var i = 0; i < rows.length; i++) {
            $cusColor.datagrid('endEdit', i);
            var temp=$cusColor.datagrid('validateRow', i);
            if(!temp){flag=false;}
        }
        if(flag){
            if ($cusColor.datagrid('getChanges').length) {
                var inserted = $cusColor.datagrid('getChanges', "inserted");
                $colorDlg = $("#colorDlg");
                var i = 0;
                for(i;i<inserted.length;i++){
                    var row = inserted[i];
                    $colorDlg.datagrid('appendRow', row);
                }
            }
            $cusColor.datagrid('loadData',{total:0,rows:[]});

        }else{
            $.messager.alert("提示", "字段验证未通过!请查看");
        }
    }
    function removeRows(){
        var rows = $cusColor.datagrid('getSelections');
        $.each(rows,function(i,row){
            if (row) {
                var rowIndex = $cusColor.datagrid('getRowIndex', row);
                $cusColor.datagrid('deleteRow', rowIndex);
            }
        });
    }
</script>
<style>
	table {
		background-color: transparent;
		border-collapse: collapse;
		border-spacing: 0;
		max-width: 100%;
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
	table ,th,td{
		text-align:left;
		padding: 6px;
	}
</style>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="选择颜色" style="overflow: hidden;padding: 10px;">
		<table id="colorDlg" ></table>
	</div>
	<div data-options="region:'east',split:true" title="自定义颜色" style="width:450px;">
		<table id="cusColor"></table>
		<div id="ccTbar" style="padding:2px 0">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding-left:2px">
						<%--<shiro:hasPermission name="cstConEdit">--%>
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addRows();">添加</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-end" plain="true" onclick="endEdit();">结束编辑</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeRows();">删除</a>
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveRows();">保存</a>
						<%--</shiro:hasPermission>--%>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
