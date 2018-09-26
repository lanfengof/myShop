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
                    </div>
                </div>
                </form:form>
            </div>

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">用户列表</h3>
                    <a class="row" style="padding-left: 15px; padding-top: 10px">
                        <a href="/user/form" type="button" class="btn btn-primary btn-xs"><i
                                class="fa fa-plus"></i>&nbsp;新增</a>&emsp;
                        <a href="#" type="button" class="btn btn-danger btn-xs" onclick="App.deleteMulti('/user/delete')"><i
                                class="fa fa-trash"></i>&nbsp;删除</a>&emsp;
                        <a href="#" type="button" class="btn btn-primary btn-xs"><i
                                class="fa fa-level-down" onclick="add.ss()"></i>&nbsp;导入</a>&emsp;
                        <a href="#" type="button" class="btn btn-primary btn-xs"><i class="fa fa-level-up"></i>&nbsp;导出</a>&emsp;
                        <button type="button" class="btn btn-primary btn-xs"
                                onclick="$('.box-info-search').css('display')=='none'? $('.box-info-search').show('fast'):$('.box-info-search').hide('fast')">
                            <i class="fa fa-search"></i>搜索
                        </button>
                    </a>
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
                    <c:forEach items="${tbUsers}" var="tbUser">
                        <tr>
                            <td><input id="${tbUser.id}" type="checkbox" class="minimal"/></td>
                                <%--
                                <input type="checkbox" class="minimal" checked>
                                <input type="checkbox" class="minimal">
                                <input type="checkbox" class="minimal" disabled>
                                --%>
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
        </section>
    </div>
    <jsp:include page="../includes/copyright.jsp"/>
</div>

<jsp:include page="../includes/footer.jsp"/>

<%--自定义模态框--%>
<sys:modal/>

<script>
    /**
     * 批量删除
     */

        //定义一个存放ID的数组
    /*var idArray = new Array();

    function deleteMuilti() {
        // var idArray = new Array();

        //将选中元素的ID放入数组中
        var _chekbox = App.getCheckbox();
        _chekbox.each(function () {
            var _id = $(this).attr("id");
            if (_id !== null && _id !== "undefine" && $(this).is(":checked")) {
                idArray.push(_id);
            }
        });

        if (idArray.length === 0) {
            // 更改提示消息-未选择时
            $('#modal-message').html("您还没有选择任何数据,请至少选择一项");
        } else {
            // 更改提示消息-已选择时
            $('#modal-message').html("您确定删除该数据吗?");
        }
        // 打开温馨提示模态框
        $('#modal-default').modal('show');
    }

    // console.log(idArray);
    $(function () {
        // 模块框的确定按钮绑定点击事件
        $('.modal-footer .btn-primary').bind("click", function () {
            del(idArray, "/user/delete");
        });

        function del(idArray, url) {
            //未选择数据就隐藏
            if (idArray.length === 0) {
                $('#modal-default').modal("hide");
            }
            // 否则提交数据到后台
            else {
                // console.log("提交数据到后台");
                $.ajax({
                    "url": url,
                    "type": "POST",
                    "data": {"ids": idArray.toString()},
                    "dataType": "JSON",
                    "success": function (data) {
                        console.log(data);
                    }
                });
            }
        }
    });
*/
</script>

</body>
</html>
