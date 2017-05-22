<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $dg = $("#dg");
    $grid=$dg.datagrid({
        url : '',
        width : 'auto',
        height : $(this).height()-380,
        rownumbers:true,
        border:false,
        singleSelect:true,
        columns : [ [
            {field : 'value',title : '尺寸',width : parseInt($(this).width()*0.2),align : 'left',editor : "text"}
        ] ],toolbar:'#tb'
    });


    function addRows(){
        $dg.datagrid('appendRow', {});
        var rows = $dg.datagrid('getRows');
        $dg.datagrid('beginEdit', rows.length - 1);
    }

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

    function removeRows(){
        var rows = $dg.datagrid('getSelections');
        $.each(rows,function(i,row){
            if (row) {
                var rowIndex = $dg.datagrid('getRowIndex', row);
                $dg.datagrid('deleteRow', rowIndex);
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
    <table id="dg"></table>
    <div id="tb" style="padding:2px 0">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td style="padding-left:2px">
                    <%--<shiro:hasPermission name="cstConEdit">--%>
                    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addRows();">添加</a>
                    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-end" plain="true" onclick="endEdit();">结束编辑</a>
                    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeRows();">删除</a>
                    <%--</shiro:hasPermission>--%>
                </td>
            </tr>
        </table>
    </div>
</div>
