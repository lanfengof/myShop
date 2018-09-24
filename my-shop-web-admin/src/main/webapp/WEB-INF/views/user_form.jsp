<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>商城|用户表单</title>
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
                ${tbUser.id==null?"新增":"编辑"}用户
                <small>...</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-users"></i>首页</a></li>
                <li class="active">用户表单</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-6">

                    <c:if test="${baseResult != null}">
                        <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <%--<h4><i class="icon fa fa-ban"></i> 警告!</h4>--%>
                                ${baseResult.message}
                        </div>
                    </c:if>

                    <!-- form start -->
                    <form:form cssClass="form-horizontal" action="/user/save" method="post" modelAttribute="tbUser">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <form:input cssClass="form-control" path="email" placeholder="请输入邮箱"/>
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="请输入邮箱"value="${tbUser.email};">
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <form:password cssClass="form-control" path="password" placeholder="请输入密码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <form:input cssClass="form-control" path="username" placeholder="请输入姓名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Phone" class="col-sm-2 control-label">手机</label>
                                <div class="col-sm-10">
                                    <form:input cssClass="form-control" path="phone" placeholder="请输入手机"/>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                            <button type="submit" class="btn btn-info pull-right">提交</button>
                        </div>
                        <!-- /.box-footer -->
                    </form:form>
                    <%--<form class="form-horizontal" action="/user/save" method="post">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="请输入邮箱"value="${tbUser.email};">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputPassword" name="password" placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputUsername" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputUsername" name="username"
                                           placeholder="请输入用户姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPhone" class="col-sm-2 control-label">手机</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputPhone" name="phone" placeholder="请输入用户手机号">
                                </div>
                            </div>
                            &lt;%&ndash;<div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Remember me
                                        </label>
                                    </div>
                                </div>
                            </div>&ndash;%&gt;
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                            <button type="submit" class="btn btn-info pull-right">提交</button>
                        </div>
                        <!-- /.box-footer -->
                    </form>--%>
                </div>
            </div>
        </section>

    </div>
    <jsp:include page="../includes/copyright.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>
