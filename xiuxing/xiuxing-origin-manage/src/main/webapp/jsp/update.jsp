<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<html>
  <head>
  	
  </head>
  
  <body>
  	<div style="width:400px;padding:30px 60px">
  	<!-- 验证还是jquery-validation好用，这里省事没用 -->
		<form id="memberForm" method="post">
			<input type="hidden" name="id" id="uuid">
			<div style="margin-bottom:20px">
				会员名称：
				<input name="memberNo" style="width:100%;height:32px" validType="length[3,30]" class="easyui-validatebox" required="true"> 
			</div>
			<div style="margin-bottom:20px">
				联系电话：
				<input name="phone" style="width:100%;height:32px"   validType="length[3,30]" class="easyui-validatebox" required="true"> 
			</div>
			<div style="margin-bottom:20px">
				手机号：<input name="mobile" min="1" max="120" increment="1" style="width:100%;height:32px"></input>
			</div>
			<div style="margin-bottom:20px">
				邮箱：<input name="email" class="easyui-textbox" style="width:100%;height:32px" class="Wdate" onClick="WdatePicker()">
			</div>
			<div style="margin-bottom:20px">
				昵称：<input id="nickName" name="nickName" class="easyui-textbox" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				推荐人号码：<input id="referrerPhone" name="referrerPhone" class="easyui-textbox" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				头像地址：<input id="iconUrl" name="iconUrl" class="easyui-textbox" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				备注：<input id="remark" name="remark" class="easyui-validatebox" style="width:100%; height:100px">
			</div>
			<div>
				<a href="#" id="btn-back" onclick="closeWindow();" class="easyui-linkbutton" iconCls="icon-back">返回</a>
				<a href="#" id="btn-add" onclick="addOrUpdateUser();" class="easyui-linkbutton" iconCls="icon-save">保存</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		/*
		jQuery(function($){
			//下拉表格初始化
			$('#addDeptId').combobox({
				valueField:'id', //值字段
			    textField:'name', //显示的字段
			    url:'dept/allList',
			    panelHeight:'auto',
			    required:true,
				editable:false//不可编辑，只能选择
			});
		});*/
		
		function addOrUpdateUser(){
			var r = $('#memberForm').form('validate');
			if(!r) {
				return false;
			}
			$.post("${ctx}/member/updateMember.do",$("#memberForm").serializeArray(),function(data){
				$('#MyPopWindow').window('close');
				$('#memberTable').datagrid('reload');  
				$.messager.alert('提示',data.mes,'info');
			});
		}
		
	</script>
  </body>
</html>
