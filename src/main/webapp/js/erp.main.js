/**
 * Created by yuanc3 on 2017/6/1.
 */
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
        {field : 'simplified',title : '颜色简称',width : parseInt($(this).width()*0.1)},
        {field : 'name',title : '颜色',width : parseInt($(this).width()*0.1)},

    ] ]
});
$cusColor = $("#cusColor");
$cusColorGrid=$cusColor.datagrid({
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

function addColorRows(){
    $cusColor.datagrid('appendRow', {});
    var rows = $cusColor.datagrid('getRows');
    $cusColor.datagrid('beginEdit', rows.length - 1);
}

function endColorEdit(){
    var flag=true;
    var rows = $cusColor.datagrid('getRows');
    for ( var i = 0; i < rows.length; i++) {
        $cusColor.datagrid('endEdit', i);
        var temp=$cusColor.datagrid('validateRow', i);
        if(!temp){flag=false;}
    }
    return flag;
}
function saveColorRows(){
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
function removeColorRows(){
    var rows = $cusColor.datagrid('getSelections');
    $.each(rows,function(i,row){
        if (row) {
            var rowIndex = $cusColor.datagrid('getRowIndex', row);
            $cusColor.datagrid('deleteRow', rowIndex);
        }
    });
}

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
        {field : 'size',title : '尺寸',width : parseInt($(this).width()*0.1)}
    ] ]
});
$cusSize = $("#cusSize");
$cusSizeGrid=$cusSize.datagrid({
    url : '',
    width : 'auto',
    height : $(this).height()-380,
    rownumbers:true,
    border:false,
    fit:true,
    singleSelect:true,
    columns : [ [
        {field : 'size',title : '尺寸',width : parseInt($(this).width()*0.2),align : 'left',editor : {type:'numberbox',options:{precision:2}}}
    ] ],toolbar:'#csTBar'
});

function addSizeRows(){
    $cusSize.datagrid('appendRow', {});
    var rows = $cusSize.datagrid('getRows');
    $cusSize.datagrid('beginEdit', rows.length - 1);
}

function endSizeEdit(){
    var flag=true;
    var rows = $cusSize.datagrid('getRows');
    for ( var i = 0; i < rows.length; i++) {
        $cusSize.datagrid('endEdit', i);
        var temp=$cusSize.datagrid('validateRow', i);
        if(!temp){flag=false;}
    }
    return flag;
}

function removeSizeRows(){
    var rows = $cusSize.datagrid('getSelections');
    $.each(rows,function(i,row){
        if (row) {
            var rowIndex = $cusSize.datagrid('getRowIndex', row);
            $cusSize.datagrid('deleteRow', rowIndex);
        }
    });
}
function saveSizeRows(){
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
$colorSizeWeightCost = $("#colorSizeWeightCost");
$colorSizeWeightCostGrid=$colorSizeWeightCost.datagrid({
    url : '',
    width : 'auto',
    height : $(this).height()-380,
    rownumbers:true,
    border:false,
    fit:true,
    singleSelect:true,
    columns : [ [
        {field : 'weight',title : '重量',width : parseInt($(this).width()*0.2),align : 'left'},
        {field : 'cost',title : '价格',width : parseInt($(this).width()*0.2),align : 'left'},
        {field : 'simplified',title : '颜色简称',width : parseInt($(this).width()*0.1),align : 'left'},
        {field : 'name',title : '颜色',width : parseInt($(this).width()*0.1),align : 'left'},
        {field : 'size',title : '尺寸',width : parseInt($(this).width()*0.2),align : 'left'}
    ] ]
});

$weightAndCost = $("#weightAndCost");
$weightAndCostGrid=$weightAndCost.datagrid({
    url : '',
    width : 'auto',
    height : $(this).height()-380,
    rownumbers:true,
    border:false,
    fit:true,
    singleSelect:true,
    columns : [ [
        {field : 'weight',title : '重量',width : parseInt($(this).width()*0.2),align : 'left',editor : {type:'numberbox',options:{precision:2}}},
        {field : 'cost',title : '价格',width : parseInt($(this).width()*0.2),align : 'left',editor : {type:'numberbox',options:{precision:2}}}
    ] ],toolbar:'#cwcTBar'
});
function addWeightCostRows(){
    $weightAndCost.datagrid('appendRow', {});
    var rows = $weightAndCost.datagrid('getRows');
    $weightAndCost.datagrid('beginEdit', rows.length - 1);
}

function endWeightCostEdit(){
    var flag=true;
    var rows = $weightAndCost.datagrid('getRows');
    for ( var i = 0; i < rows.length; i++) {
        $weightAndCost.datagrid('endEdit', i);
        var temp=$weightAndCost.datagrid('validateRow', i);
        if(!temp){flag=false;}
    }
    return flag;
}

function removeWeightCostRows(){
    var rows = $weightAndCost.datagrid('getSelections');
    $.each(rows,function(i,row){
        if (row) {
            var rowIndex = $weightAndCost.datagrid('getRowIndex', row);
            $weightAndCost.datagrid('deleteRow', rowIndex);
        }
    });
}
function saveWeightCostRows(){
    var flag=true;
    var rows = $weightAndCost.datagrid('getRows');
    for ( var i = 0; i < rows.length; i++) {
        $weightAndCost.datagrid('endEdit', i);
        var temp=$weightAndCost.datagrid('validateRow', i);
        if(!temp){flag=false;}
    }
    if(flag){
        if ($weightAndCost.datagrid('getChanges').length) {
            var inserted = $weightAndCost.datagrid('getChanges', "inserted");
            $colorSizeWeightCost = $("#colorSizeWeightCost");
            var i = 0;
                var row = inserted[0];
                $colorSizeWeightCost.datagrid('appendRow', row);
        }
        $weightAndCost.datagrid('loadData',{total:0,rows:[]});
    }else{
        $.messager.alert("提示", "字段验证未通过!请查看");
    }
}