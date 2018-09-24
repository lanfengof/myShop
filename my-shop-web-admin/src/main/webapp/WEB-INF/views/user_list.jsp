<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">用户列表</h3>
                            <div class="row" style="padding-left: 15px; padding-top: 10px">
                                <a href="/user/form" type="button" class="btn btn-primary btn-xs"><i
                                        class="fa fa-plus"></i>&nbsp;新增</a>&emsp;
                                <a href="#" type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>&nbsp;删除</a>&emsp;
                                <a href="#" type="button" class="btn btn-primary btn-xs"><i
                                        class="fa fa-level-down"></i>&nbsp;导入</a>&emsp;
                                <a href="#" type="button" class="btn btn-primary btn-xs"><i class="fa fa-level-up"></i>&nbsp;导出</a>&emsp;
                            </div>
                            <div class="row" style="margin-top:20px;">
                                <form:form cssClass="form-horizontal" action="/user/search" method="post"
                                           modelAttribute="tbUser">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label for="username" class="col-sm-3 control-label">姓名</label>
                                                <div class="col-sm-6">
                                                    <form:input path="username"
                                                                cssClass="form-horizontal" placeholder="姓名"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label for="email" class="col-sm-3 control-label">邮箱</label>
                                                <div class="col-sm-6">
                                                    <form:input path="email" cssClass="form-horizontal" placeholder="邮箱"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label for="phone" class="col-sm-3 control-label">手机</label>
                                                <div class="col-sm-6">
                                                    <form:input path="phone" cssClass="form-horizontal"
                                                                placeholder="手机"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-right:50px;">
                                            <div class="col-xs-12">
                                                <button type="submit" class="btn btn-info pull-right">搜索</button>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>

                            <div class="box-tools">
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
                            </div>
                        </div>

                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>手机</th>
                                    <th>邮箱</th>
                                    <th>更新时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${tbUsers}" var="tbUser">
                                    <tr>
                                        <td>${tbUser.id}</td>
                                        <td>${tbUser.username}</td>
                                        <td>${tbUser.phone}</td>
                                        <td>${tbUser.email}</td>
                                        <td><fmt:formatDate value="${tbUser.updated}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>
                                                <%--<button type="button" class="btn btn-block btn-default btn-xs">查看</button>
                                                按钮,块状显示,会独占一行--%>
                                            <a href="#" type="button" class="btn btn-default btn-xs"><i
                                                    class="fa fa-search"></i>&nbsp;查看</a>&nbsp;
                                            <a href="/user/form" type="button" class="btn btn-primary btn-xs"><i
                                                    class="fa fa-edit"></i>&nbsp;编辑</a>&nbsp;
                                            <a href="#" type="button" class="btn btn-danger btn-xs"><i
                                                    class="fa fa-trash"></i>&nbsp;删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>

        </section>

    </div>
    <jsp:include page="../includes/copyright.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>
