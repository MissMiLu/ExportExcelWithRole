<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<script type="text/javascript">
    $colorDlg = $("#colorDlg");
    $("#colorDlg").datagrid({
        url: "spu/spuAction!findColors.action",
        pagination: false,
        autoRowHeight: true,
        border: true,
        striped: true,
        fit: false,
        singleSelect: false,
        selectOnCheck: true,
        columns: [[
            {field: 'ck', checkbox: true, width: parseInt($(this).width() * 0.1)},
            {field: 'simplified', title: '颜色简称', width: parseInt($(this).width() * 0.1)},
            {field: 'name', title: '颜色', width: parseInt($(this).width() * 0.1)},

        ]]
    });
    $cusColor = $("#cusColor");
    $cusColorGrid = $cusColor.datagrid({
        url: '',
        width: 'auto',
        height: $(this).height() - 380,
        border: false,
        singleSelect: true,
        columns: [[
            {field: 'simplified', title: '颜色简称', width: parseInt($(this).width() * 0.1), align: 'left', editor: "text"},
            {field: 'name', title: '颜色', width: parseInt($(this).width() * 0.1), align: 'left', editor: "text"}
        ]], toolbar: '#ccTbar'
    });

    function addColorRows() {
        $cusColor.datagrid('appendRow', {});
        var rows = $cusColor.datagrid('getRows');
        $cusColor.datagrid('beginEdit', rows.length - 1);
    }

    function endColorEdit() {
        var flag = true;
        var rows = $cusColor.datagrid('getRows');
        for (var i = 0; i < rows.length; i++) {
            $cusColor.datagrid('endEdit', i);
            var temp = $cusColor.datagrid('validateRow', i);
            if (!temp) {
                flag = false;
            }
        }
        return flag;
    }
    function saveColorRows() {
        var flag = true;
        var rows = $cusColor.datagrid('getRows');
        for (var i = 0; i < rows.length; i++) {
            $cusColor.datagrid('endEdit', i);
            var temp = $cusColor.datagrid('validateRow', i);
            if (!temp) {
                flag = false;
            }
        }
        if (flag) {
            if ($cusColor.datagrid('getChanges').length) {
                var inserted = $cusColor.datagrid('getChanges', "inserted");
                $colorDlg = $("#colorDlg");
                var i = 0;
                for (i; i < inserted.length; i++) {
                    var row = inserted[i];
                    $colorDlg.datagrid('appendRow', row);
                }
            }
            $cusColor.datagrid('loadData', {total: 0, rows: []});
        } else {
            $.messager.alert("提示", "字段验证未通过!请查看");
        }
    }
    function removeColorRows() {
        var rows = $cusColor.datagrid('getSelections');
        $.each(rows, function (i, row) {
            if (row) {
                var rowIndex = $cusColor.datagrid('getRowIndex', row);
                $cusColor.datagrid('deleteRow', rowIndex);
            }
        });
    }
    $sizeDlg = $("#sizeDlg");
    $("#sizeDlg").datagrid({
        url: "spu/spuAction!findSizes.action",
        fit: false,
        pagination: false,
        border: true,
        striped: true,
        singleSelect: false,
        selectOnCheck: true,
        columns: [[
            {field: 'ck', checkbox: true, width: parseInt($(this).width() * 0.1)},
            {field: 'value', title: '尺寸', width: parseInt($(this).width() * 0.1)}
        ]]
    });
    $cusSize = $("#cusSize");
    $cusSizeGrid = $cusSize.datagrid({
        url: '',
        width: 'auto',
        height: $(this).height() - 380,
        border: false,
        fit: false,
        singleSelect: true,
        columns: [[
            {field: 'value', title: '尺寸', width: parseInt($(this).width() * 0.2), align: 'left', editor: "text"}
        ]], toolbar: '#csTBar'
    });

    function addSizeRows() {
        $cusSize.datagrid('appendRow', {});
        var rows = $cusSize.datagrid('getRows');
        $cusSize.datagrid('beginEdit', rows.length - 1);
    }

    function endSizeEdit() {
        var flag = true;
        var rows = $cusSize.datagrid('getRows');
        for (var i = 0; i < rows.length; i++) {
            $cusSize.datagrid('endEdit', i);
            var temp = $cusSize.datagrid('validateRow', i);
            if (!temp) {
                flag = false;
            }
        }
        return flag;
    }

    function removeSizeRows() {
        var rows = $cusSize.datagrid('getSelections');
        $.each(rows, function (i, row) {
            if (row) {
                var rowIndex = $cusSize.datagrid('getRowIndex', row);
                $cusSize.datagrid('deleteRow', rowIndex);
            }
        });
    }
    function saveSizeRows() {
        var flag = true;
        var rows = $cusSize.datagrid('getRows');
        for (var i = 0; i < rows.length; i++) {
            $cusSize.datagrid('endEdit', i);
            var temp = $cusSize.datagrid('validateRow', i);
            if (!temp) {
                flag = false;
            }
        }
        if (flag) {
            if ($cusSize.datagrid('getChanges').length) {
                var inserted = $cusSize.datagrid('getChanges', "inserted");
                var i = 0;
                for (i; i < inserted.length; i++) {
                    var row = inserted[i];
                    $sizeDlg.datagrid('appendRow', row);
                }
            }
            $cusSize.datagrid('loadData', {total: 0, rows: []});
        } else {
            $.messager.alert("提示", "字段验证未通过!请查看");
        }
    }
    $colorSizeWeightCost = $("#colorSizeWeightCost");
    $colorSizeWeightCostGrid = $colorSizeWeightCost.edatagrid({
        url: '',
        width: 'auto',
        height: $(this).height() - 380,
        border: false,
        fit: false,
        singleSelect: true,
        columns: [[
            {field: 'weight', title: '重量', width: 75, align: 'left',editor: {type: 'numberbox', options: {precision: 2}}},
            {field: 'cost', title: '价格', width: 75, align: 'left',editor: {type: 'numberbox', options: {precision: 2}}},
            {field: 'simplified', title: '颜色简称', width: 75, align: 'left'},
            {field: 'name', title: '颜色', width: 75, align: 'left'},
            {field: 'size', title: '尺寸', width: 75, align: 'left'}
        ]]
    });

    function addWeightCostRows() {
        $weightAndCost.datagrid('appendRow', {});
        var rows = $weightAndCost.datagrid('getRows');
        $weightAndCost.datagrid('beginEdit', rows.length - 1);
    }

    function endWeightCostEdit() {
        var flag = true;
        var rows = $weightAndCost.datagrid('getRows');
        for (var i = 0; i < rows.length; i++) {
            $weightAndCost.datagrid('endEdit', i);
            var temp = $weightAndCost.datagrid('validateRow', i);
            if (!temp) {
                flag = false;
            }
        }
        return flag;
    }

    function removeWeightCostRows() {
        var rows = $weightAndCost.datagrid('getSelections');
        $.each(rows, function (i, row) {
            if (row) {
                var rowIndex = $weightAndCost.datagrid('getRowIndex', row);
                $weightAndCost.datagrid('deleteRow', rowIndex);
            }
        });
    }
    function saveWeightCostRows() {
        var flag = true;
        var weightValue = $('#cusweight').numberbox('getValue');
        var costValue = $('#cuscost').numberbox('getValue');
        if (flag) {
                $colorSizeWeightCost = $("#colorSizeWeightCost");
                var colorRow = $('#colorDlg').datagrid('getSelections');
                var colors = "";
                var shortColors = "";
                var sizeRow = $('#sizeDlg').datagrid('getSelections');
                var sizes = "";
                for (i = 0; i < colorRow.length; i++) {
                    colors += colorRow[i].name;
                    shortColors += colorRow[i].simplified;
                    if (i < colorRow.length - 1) {
                        colors += ' ';
                        shortColors += ' ';
                    }
                    for (j = 0; j < sizeRow.length; j++) {
                        $colorSizeWeightCost.datagrid('appendRow', {
                            weight: weightValue,
                            cost: costValue,
                            simplified: colorRow[i].simplified,
                            name: colorRow[i].name,
                            size: sizeRow[j].value
                        });
                    }
                }
                for (j = 0; j < sizeRow.length; j++) {
                    sizes += sizeRow[j].value;
                    if (j < sizeRow.length - 1) {
                        sizes += ' ';
                    }
                }
            $colorDlg.datagrid('clearChecked');
            $sizeDlg.datagrid('clearChecked');
        } else {
            $.messager.alert("提示", "字段验证未通过!请查看");
        }
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

    table, th, td {
        text-align: left;
        padding: 6px;
    }
    .datagrid-header .datagrid-cell {
        height:35px;
    }
</style>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'west',split:true" style="width:400px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center',border:true" title="选择颜色" style="padding: 10px;">
                <table id="colorDlg"></table>
            </div>
            <div data-options="region:'east',split:true" title="自定义颜色">
                <table id="cusColor"></table>
                <div id="ccTbar" style="padding:2px 0">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="padding-left:2px">
                                <%--<shiro:hasPermission name="cstConEdit">--%>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true"
                                   onclick="addColorRows();">添加</a>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-end" plain="true"
                                   onclick="endColorEdit();">结束编辑</a>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove"
                                   plain="true" onclick="removeColorRows();">删除</a>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" plain="true"
                                   onclick="saveColorRows();">保存</a>
                                <%--</shiro:hasPermission>--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div data-options="region:'center',split:true" style="width:300px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center',border:false" title="选择尺寸" style="padding: 10px;width:300px;">
                <table id="sizeDlg"></table>
            </div>
            <div data-options="region:'east'" title="自定义尺寸">
                <table id="cusSize"></table>
                <div id="csTBar" style="padding:2px 0">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="padding-left:2px">
                                <%--<shiro:hasPermission name="cstConEdit">--%>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true"
                                   onclick="addSizeRows();">添加</a>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-end" plain="true"
                                   onclick="endSizeEdit();">结束编辑</a>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove"
                                   plain="true" onclick="removeSizeRows();">删除</a>
                                <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" plain="true"
                                   onclick="saveSizeRows();">保存</a>
                                <%--</shiro:hasPermission>--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div data-options="region:'east',title:'重量 & 价格',iconCls:'icon-ok'" style="width:500px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center',border:false" style="text-align: center">
                    <div style="margin-bottom:20px">
                        <div>重量:</div>
                        <input class="easyui-numberbox" id='cusweight' precision="2" data-options="prompt:'输入重量'">
                    </div>
                    <div style="margin-bottom:20px">
                        <div>价格:</div>
                        <input class="easyui-numberbox" id='cuscost' precision="2" data-options="prompt:'输入价格'">
                    </div>
                    <div>
                        <a class="easyui-linkbutton" iconCls="icon-ok" onclick="saveWeightCostRows();" >生成列表</a>
                    </div>
            </div>
            <div data-options="region:'south',split:true" style="height:400px;">
                <table id="colorSizeWeightCost"></table>
            </div>
        </div>
    </div>
</div>
