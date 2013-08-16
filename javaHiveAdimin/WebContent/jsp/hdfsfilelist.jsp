<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href=<%=request.getContextPath() %>/>
	<meta charset="utf-8">
	<title>HiveAdmin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href"css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="img/favicon.ico">
		
</head>

<body>


		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="index.html"> <span>HiveAdmin</span></a>
				<span class="pull-right">user : <%=session.getAttribute("user")%></span>
			</div>
		</div>
	</div>
	<!-- topbar ends -->
	
	<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<div class="span3 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Hive数据库管理</li>
						<li><a class="ajax-link" href=<%=request.getContextPath()+"/databaseAction/getDatabaseList"%>><span class="hidden-tablet">数据库浏览</span></a></li>
						<li><a class="ajax-link" href="index.html"><span class="hidden-tablet">数据表操作</span></a></li>
						
						<li class="nav-header hidden-tablet">HDFS管理</li>
						<li><a class="ajax-link" href="#"><span class="hidden-tablet">文件浏览</span></a></li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">文件上传</span></a></li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">文件下载</span></a></li>
						<li class="nav-header hidden-tablet">模板管理</li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">模板列表</span></a></li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">创建模板</span></a></li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">删除模板</span></a></li>
						
						<li class="nav-header hidden-tablet">用户操作历史</li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">操作记录</span></a></li>
						<li class="nav-header hidden-tablet">用户管理</li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">用户列表</span></a></li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">添加用户</span></a></li>
						<li><a class="ajax-link" href="table.html"><span class="hidden-tablet">删除用户</span></a></li>
						
					</ul>
					
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span9">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span8">
			<!-- content starts -->
            <div>
                <ul class="breadcrumb">
                     <li>
                         <a href=<%=request.getContextPath() %>>Home</a> <span class="divider">/</span>
                         <a href="#">HDFS Files</a>
                     </li>
                </ul>
            </div>
			<script type="text/javascript">
				function hdfs_addfile(){
					var curhdfspath = $("#hdfs_curpath").val();
					$("#hdfs_ops").load("jsp/mkfileform.jsp",function(){
						
						$("#hdfs_default_filepath").val(curhdfspath+"/");
						
					});
				}
				function hdfs_adddir(){
					var curhdfspath = $("#hdfs_curpath").val();
					$("#hdfs_ops").load("jsp/mkdirform.jsp",function(){
						
						$("#hdfs_default_filepath").val(curhdfspath+"/");
						
					});
				}
				function hdfs_renamefile(){
					var curhdfspath = $("#hdfs_curpath").val();
					$("#hdfs_ops").load("jsp/mkdirform.jsp",function(){
						
						$("#hdfs_default_filepath").val(curhdfspath+"/");
						
					});
				}

				function hdfs_uploadfile(){
					var curhdfspath = $("#hdfs_curpath").val();
					$("#hdfs_ops").load("jsp/uploadfileform.jsp",function(){
						
						$("#hdfs_default_filepath").val(curhdfspath+"/");
						
					});
				}
			</script>
			<input id="hdfs_curpath" type="hidden" value="<s:property value="listfilepath"/>"/>
							
			<div id="hdfs_ops" class="row-fluid">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-info-sign"></i> HDFS files list</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						 	<div class="box-content">
								<span>path:</span>
								<span class="divider">/</span>
								<s:iterator value="listfilepathfreg">
	 								<a href=<%=request.getContextPath()+"/hdfsOperation/listFileStatus?listfilepath=" %><s:property value="path"/>><s:property value="name"/></a>
									<span class="divider">/</span>
								</s:iterator>
									
								<span class="divider">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<a  href=<%=request.getContextPath()+"/hdfsOperation/listFileStatus?listfilepath=" %><s:property value="listfilepathparent"/> class="btn btn-mini btn-primary pull-center">upgrad directory</a>
								<button id="hdfs_addfile_btn" onclick="hdfs_addfile()" class="btn btn-mini btn-primary">create file</button>
								<button id="hdfs_adddir_btn" onclick="hdfs_adddir()" class="btn btn-mini btn-primary">create dir</button>
								<button id="hdfs_upload_btn" onclick="hdfs_uploadfile()" class="btn btn-mini btn-primary">upload file</button>							
							<p>
							</div>
							<table class="table table-striped table-bordered bootstrap-datatable datatable">
							  <thead>
								  <tr>
									  <th>FileName</th>
									  <th>Size</th>
									  <th>Owner</th>
									  <th>Group</th>
									  <th>ModTime</th>
									  <th>Actions</th>
								  </tr>
							  </thead>   
							  <tbody>
							  <s:iterator value="fileStatusArray" id="status"> 
								<tr>
									<td>
										<s:if test="dir == true"><a href=<%=request.getContextPath()+"/hdfsOperation/listFileStatus?listfilepath="%><s:property value="basePath"/>><s:property value="path.name"/></a></s:if>
										<s:else><s:property value="path.name"/></s:else>
									</td>
									<td><s:property value="len"/></td>
									<td><s:property value="owner"/></td>
									<td><s:property value="group"/></td>
									<td><s:property value="modificationTime"/></td>
									<td class="centre">
										
										<s:if test="dir == true">
											
											<a class="btn btn-danger" href=<%=request.getContextPath()+"/hdfsOperation/deletedirs?dirName="%><s:property value="basePath"/>>
												<i class="icon-trash icon-white"></i> 
												Delete
											</a>
										</s:if>
										<s:else>
											<a class="btn btn-danger" href=<%=request.getContextPath()+"/hdfsOperation/deletefile?fileName="%><s:property value="basePath"/>>
												<i class="icon-trash icon-white"></i> 
												Delete
											</a>
										</s:else>
										
										<input class="hdfs_filepath" type="hidden" value="<s:property value="basePath"/>"/>
										<button   class="hdfs_renamefile_btn btn btn-success">
			
											<i class="icon-zoom-in icon-white"></i>
											Rename
										</button>
										<a class="btn btn-danger" href=<%=request.getContextPath()+"/hdfsOperation/downloadfile?remotepath="%><s:property value="path"/>>
											<i class="icon-trash icon-white"></i> 
											Download
										</a>
									
									</td>
								</tr>
								</s:iterator>
							  </tbody>
						  </table>
						  
					</div>
				</div>
			</div>
	
			</div>
		</div>
	</div>
	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
		<script type="text/javascript">
		$(function(){
			
			$(".hdfs_renamefile_btn").click(function(){
				
				var curhdfspath=$("#hdfs_curpath").val();
				var hdfsoldfilepath=$(this).parent().find("input").val();
				
				$("#hdfs_ops").load("jsp/hdfsrenameform.jsp",function(){
					$("#hdfs_default_oldname").val(hdfsoldfilepath);
					$("#hdfs_default_newname").val(curhdfspath+"/");
					
				});	
				
			});
			
			
		});
	</script>
</body>
</html>
    