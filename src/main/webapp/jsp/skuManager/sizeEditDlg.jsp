<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $("#sizeDlg").datagrid({
        url : "spu/spuAction!findSizes.action",
        fit:true,
        pagination:false,
        rownumbers:true,
        border:true,
        striped:true,
        singleSelect:false,
        selectOnCheck:true,
        columns : [ [
            {field : 'ck',checkbox : true,width : parseInt($(this).width()*0.1)},
            {field : 'value',title : '尺寸',width : parseInt($(this).width()*0.1)}
        ] ]
    });
    $cusSize = $("#cusSize");
    $grid=$cusSize.datagrid({
        url : '',
        width : 'auto',
        height : $(this).height()-380,
        rownumbers:true,
        border:false,
        fit:true,
        singleSelect:true,
        columns : [ [
            {field : 'value',title : '尺寸',width : parseInt($(this).width()*0.2),align : 'left',editor : "text"}
        ] ],toolbar:'#csTBar'
    });


    function addRows(){
        $cusSize.datagrid('appendRow', {});
        var rows = $cusSize.datagrid('getRows');
        $cusSize.datagrid('beginEdit', rows.length - 1);
    }

    function endEdit(){
        var flag=true;
        var rows = $cusSize.datagrid('getRows');
        for ( var i = 0; i < rows.length; i++) {
            $cusSize.datagrid('endEdit', i);
            var temp=$cusSize.datagrid('validateRow', i);
            if(!temp){flag=false;}
        }
        return flag;
    }

    function removeRows(){
        var rows = $cusSize.datagrid('getSelections');
        $.each(rows,function(i,row){
            if (row) {
                var rowIndex = $cusSize.datagrid('getRowIndex', row);
                $cusSize.datagrid('deleteRow', rowIndex);
            }
        });
    }
    function saveRows(){
        var flag=true;
        var rows = $cusSize.datagrid('getRows');
        for ( var i = 0; i < rows.length; i++) {
            $cusSize.datagrid('endEdit', i);
            var temp=$cusSize.datagrid('validateRow', i);
            if(!temp){flag=false;}
        }
        if(flag){
            if ($cusSize.datagrid('getChanges').length) {
                var inserted = $cusSize.datagrid('getChanges', "inserted");
                $sizeDlg = $("#sizeDlg");
                var i = 0;
                for(i;i<inserted.length;i++){
                    var row = inserted[i];
                    $sizeDlg.datagrid('appendRow', row);
                }
            }
            $cusSize.datagrid('loadData',{total:0,rows:[]});
        }else{
            $.messager.alert("提示", "字段验证未通过!请查看");
        }
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
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 10px;">
		<table id="sizeDlg" title="选择尺寸"></table>
	</div>
	<div data-options="region:'east',split:true" title="自定义尺寸" style="width:300px;">
		<table id="cusSize"></table>
		<div id="csTBar" style="padding:2px 0">
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
