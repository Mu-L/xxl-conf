<!DOCTYPE html>
<html>
<head>
	<#-- import macro -->
	<#import "../common/common.macro.ftl" as netCommon>
	<#-- commonStyle -->

	<#-- biz start（1/5 style） -->
	<link rel="stylesheet" href="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="${request.contextPath}/static/adminlte/bower_components/select2/dist/css/select2.min.css">
	<#-- biz end（1/5 end） -->

	<@netCommon.commonStyle />

</head>
<body class="hold-transition skin-blue sidebar-mini" >
<div class="wrapper">

	<!-- header -->
	<@netCommon.commonHeader />

	<!-- left -->
	<#-- biz start（2/5 left） -->
	<@netCommon.commonLeft "/instance" />
	<#-- biz end（2/5 left） -->

	<!-- right start -->
	<div class="content-wrapper">

		<!-- content-header -->
		<section class="content-header">
			<#-- biz start（3/5 name） -->
			<h1>注册中心</h1>
			<#-- biz end（3/5 name） -->
		</section>

		<!-- content-main -->
		<section class="content">

			<#-- biz start（4/5 content） -->

			<#-- 查询区域 -->
			<div class="box" style="margin-bottom:9px;">
				<div class="box-body">
					<div class="row" id="data_filter" >
						<div class="col-xs-5">
							<div class="input-group">
								<span class="input-group-addon">AppName</span>
								<input type="text" class="form-control appname" autocomplete="on" >
							</div>
						</div>
						<div class="col-xs-1">
							<button class="btn btn-block btn-primary searchBtn" >${I18n.system_search}</button>
						</div>
					</div>
				</div>
			</div>

			<#-- 数据表格区域 -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header" style="float: right" id="data_operation" >
							<button class="btn btn-sm btn-info add" type="button"><i class="fa fa-plus" ></i>${I18n.system_opt_add}</button>
							<button class="btn btn-sm btn-warning selectOnlyOne update" type="button"><i class="fa fa-edit"></i>${I18n.system_opt_edit}</button>
							<button class="btn btn-sm btn-danger selectAny delete" type="button"><i class="fa fa-remove "></i>${I18n.system_opt_del}</button>
						</div>
						<div class="box-body" >
							<table id="data_list" class="table table-bordered table-striped" width="100%" >
								<thead></thead>
								<tbody></tbody>
								<tfoot></tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 新增.模态框 -->
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog"  aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" >${I18n.system_opt_add}注册节点</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal form" role="form" >
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">Env<font color="red">*</font></label>
									<div class="col-sm-6">
										${XXL_CONF_CURRENT_ENV}
										<input name="env" value="${XXL_CONF_CURRENT_ENV}" hidden="hidden" >
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">AppName<font color="red">*</font></label>
									<div class="col-sm-9">
										<select class="form-control " style="width: 100%;" name="appname" >
											<#list applicationList as item>
												<option value="${item.appname}" >${item.appname}</option>
											</#list>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">注册Ip<font color="red">*</font></label>
									<div class="col-sm-9"><input type="text" class="form-control" name="ip" placeholder="${I18n.system_please_input}Ip" maxlength="46" ></div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">注册端口<font color="red">*</font></label>
									<div class="col-sm-6"><input type="text" class="form-control" name="port" placeholder="${I18n.system_please_input}port" maxlength="10" ></div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">注册模式<font color="red">*</font></label>
									<div class="col-sm-6">
										<select class="form-control" name="registerModel" >
											<#list InstanceRegisterModelEnum as item>
												<option value="${item.value}" >${item.desc}</option>
											</#list>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">扩展信息<font color="black">*</font></label>
									<div class="col-sm-9"><textarea type="text" class="form-control" name="extendInfo" placeholder="${I18n.system_please_input}" maxlength="500" ></textarea></div>
								</div>


								<div class="form-group" style="text-align:center;border-top: 1px solid #e4e4e4;">
									<div style="margin-top: 10px;" >
										<button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- 更新.模态框 -->
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"  aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" >${I18n.system_opt_edit}注册节点</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal form" role="form" >
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">Env<font color="red">*</font></label>
									<div class="col-sm-6">
										${XXL_CONF_CURRENT_ENV}
										<input name="env" value="${XXL_CONF_CURRENT_ENV}" hidden="hidden" >
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">AppName<font color="red">*</font></label>
									<div class="col-sm-9">
										<select class="form-control " style="width: 100%;" name="appname" disabled >
											<#list applicationList as item>
												<option value="${item.appname}" >${item.appname}</option>
											</#list>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">注册Ip<font color="red">*</font></label>
									<div class="col-sm-9"><input type="text" class="form-control" name="ip" placeholder="${I18n.system_please_input}Ip" maxlength="46" readonly ></div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">注册端口<font color="red">*</font></label>
									<div class="col-sm-6"><input type="text" class="form-control" name="port" placeholder="${I18n.system_please_input}port" maxlength="10" readonly ></div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">注册模式<font color="red">*</font></label>
									<div class="col-sm-6">
										<select class="form-control" name="registerModel" >
											<#list InstanceRegisterModelEnum as item>
												<option value="${item.value}" >${item.desc}</option>
											</#list>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">扩展信息<font color="black">*</font></label>
									<div class="col-sm-9"><textarea type="text" class="form-control" name="extendInfo" placeholder="${I18n.system_please_input}" maxlength="500" ></textarea></div>
								</div>


								<div class="form-group" style="text-align:center;border-top: 1px solid #e4e4e4;">
									<div style="margin-top: 10px;" >
										<button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
										<input type="hidden" name="id" >
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>

			<#-- biz end（4/5 content） -->

		</section>

	</div>
	<!-- right end -->

	<!-- footer -->
	<@netCommon.commonFooter />
</div>
<@netCommon.commonScript />

<#-- biz start（5/5 script） -->
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${request.contextPath}/static/adminlte/bower_components/select2/dist/js/select2.full.min.js"></script>

<script src="${request.contextPath}/static/js/common/datatables.select.js"></script>
<script src="${request.contextPath}/static/js/biz/instance.js"></script>
<#-- biz end（5/5 script） -->

</body>
</html>