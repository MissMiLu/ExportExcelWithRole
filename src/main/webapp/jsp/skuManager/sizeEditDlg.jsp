<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $("#sizeDlg").datagrid({
        url : "spu/spuAction!findSizes.action",
        width : 'auto',
        height : $(this).height()-340,
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
//        $('#sb').switchbutton({
//            checked: true,
//            onText: 'Regular',
//            offText: 'Custom',
//            onChange: function(checked){
//                if (checked)
//
//                    $("#sizeDlg").hide();
//                else
//                    $("#sizeDlg").show();
//            }
//        })
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
</div>
