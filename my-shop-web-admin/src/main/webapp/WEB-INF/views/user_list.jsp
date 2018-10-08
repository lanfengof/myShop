<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<!DOCTYPE html>
<html>
<head>
    <title>商城|用户管理</title>
    <jsp:include page="../includes/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <%--顶部导航栏--%>
    <jsp:include page="../includes/nav.jsp"/>
    <!-- 左侧菜单栏 -->
    <jsp:include page="../includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
                <small>...</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-users"></i>首页</a></li>
                <li class="active">用户管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${baseResult != null}">
                        <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <%--<h4><i class="icon fa fa-ban"></i> 警告!</h4>--%>
                                ${baseResult.message}
                        </div>
                    </c:if>

                    <div class="box box-info box-info-search" style="display:none">
                        <div class="box-header">
                            <h3 class="box-title">高级搜索</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form:form cssClass="form-horizontal" action="/user/search" method="post"
                                   modelAttribute="tbUser">

                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="username" class="col-sm-4 control-label">姓名</label>
                                            <div class="col-sm-8">
                                                <form:input path="username"
                                                            cssClass="form-horizontal" placeholder="姓名"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="email" class="col-sm-4 control-label">邮箱</label>
                                            <div class="col-sm-8">
                                                <form:input path="email" cssClass="form-horizontal"
                                                            placeholder="邮箱"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="phone" class="col-sm-4 control-label">手机</label>
                                            <div class="col-sm-8">
                                                <form:input path="phone" cssClass="form-horizontal"
                                                            placeholder="手机"/>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-info pull-right">搜索</button>
                            </div>

                        </form:form>
                    </div>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">用户列表</h3>
                        </div>
                        <div class="box-body">
                            <a href="/user/form" type="button" class="btn btn-primary btn-xs"><i
                                    class="fa fa-plus"></i>&nbsp;新增</a>&emsp;
                            <button type="button" class="btn btn-danger btn-xs"
                                    onclick="App.deleteMulti('/user/delete')"><i
                                    class="fa fa-trash"></i>&nbsp;删除
                            </button>&emsp;
                            <a href="#" type="button" class="btn btn-primary btn-xs"><i
                                    class="fa fa-level-down"></i>&nbsp;导入</a>&emsp;
                            <a href="#" type="button" class="btn btn-primary btn-xs"><i class="fa fa-level-up"></i>&nbsp;导出</a>&emsp;
                            <button type="button" class="btn btn-primary btn-xs"
                                    onclick="$('.box-info-search').css('display')=='none'? $('.box-info-search').show('fast'):$('.box-info-search').hide('fast')">
                                <i class="fa fa-search"></i>搜索
                            </button>
                        </div>

                        <%--<div class="box-tools">
                            <form action="/user/search" method="post">
                                <div class="input-group input-group-sm" style="width: 150px;">
                                    <input type="text" name="keyword" class="form-control pull-right"
                                           placeholder="搜索">
                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>--%>
                    </div>

                    <!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <tr>
                                <td><input type="checkbox" class="minimal icheck_master"/></td>
                                <th>ID</th>
                                <th>用户名</th>
                                <th>手机</th>
                                <th>邮箱</th>
                                <th>更新时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--<c:forEach items="${tbUsers}" var="tbUser">
                                <tr>
                                        &lt;%&ndash;
                                        <input type="checkbox" class="minimal" checked>
                                        <input type="checkbox" class="minimal">
                                        <input type="checkbox" class="minimal" disabled>
                                        &ndash;%&gt;
                                    <td><input id="${tbUser.id}" type="checkbox" class="minimal"/></td>
                                    <td>${tbUser.id}</td>
                                    <td>${tbUser.username}</td>
                                    <td>${tbUser.phone}</td>
                                    <td>${tbUser.email}</td>
                                    <td><fmt:formatDate value="${tbUser.updated}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                            &lt;%&ndash;<button type="button" class="btn btn-block btn-default btn-xs">查看</button>
                                            按钮,块状显示,会独占一行&ndash;%&gt;
                                        <a href="#" type="button" class="btn btn-default btn-xs"><i
                                                class="fa fa-search"></i>&nbsp;查看</a>&nbsp;
                                        <a href="/user/form" type="button" class="btn btn-primary btn-xs"><i
                                                class="fa fa-edit"></i>&nbsp;编辑</a>&nbsp;
                                        <a href="#" type="button" class="btn btn-danger btn-xs"><i
                                                class="fa fa-trash"></i>&nbsp;删除</a>
                                    </td>
                                </tr>
                            </c:forEach>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../includes/copyright.jsp"/>
</div>

<jsp:include page="../includes/footer.jsp"/>

<%--自定义模态框--%>
<sys:modal/>

<script>

    $(function () {
        $("#dataTable").DataTable({
            "info": true,
            "processing": true,
            "searching": false,
            "serverSide": true,
            "deferRender": true,
            "ajax": {
                "url": "/user/page"
            },
            "columns": [
                {
                    "data": function (row, type, val, meta) {
                        return '<input id="' + row.id + '" type="checkbox" class="minimal"/>';
                    }
                },
                {"data": "id"},
                {"data": "username"},
                {"data": "phone"},
                {"data": "email"},
                {"data": "updated"},
                // { "data": "salary" }
                {
                    "data": function (row, type, val, meta) {
                        return '<a href="#" type="button" class="btn btn-default btn-xs"><iclass="fa fa-search"></i>&nbsp;查看</a>&nbsp;' +
                            '<a href="/user/form" type="button" class="btn btn-primary btn-xs"><iclass="fa fa-edit"></i>&nbsp;编辑</a>&nbsp;' +
                            '<a href="#" type="button" class="btn btn-danger btn-xs"><iclass="fa fa-trash"></i>&nbsp;删除</a>';
                    }
                }
            ],
            "language": {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "drawCallback": function (settings) {
                App.init();
            }
        });
    });
    /*
    "data": function ( row, type, val, meta ) {
          if (type === 'set') {
            row.price = val;
            // Store the computed display and filter values for efficiency
            row.price_display = val=="" ? "" : "$"+numberFormat(val);
            row.price_filter  = val=="" ? "" : "$"+numberFormat(val)+" "+val;
            return;
          }
          else if (type === 'display') {
            return row.price_display;
          }
          else if (type === 'filter') {
            return row.price_filter;
          }
          // 'sort', 'type' and undefined all just use the integer
          return row.price;
        }*/
</script>

</body>
</html>
