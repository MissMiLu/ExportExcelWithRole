<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $("#colorDlg").datagrid({
        url : "spu/spuAction!findColors.action",
        width : 'auto',
        height : $(this).height()-340,
        pagination:false,
        autoRowHeight:true,
        border:true,
        striped:true,
        singleSelect:false,
        selectOnCheck:true,
        columns : [ [
            {field : 'ck',checkbox : true,width : parseInt($(this).width()*0.1)},
            {field : 'name',title : '颜色',width : parseInt($(this).width()*0.1)}
        ] ]
    });
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
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 10px;">
		<table id="colorDlg" title="选择颜色"></table>
	</div>
</div>
