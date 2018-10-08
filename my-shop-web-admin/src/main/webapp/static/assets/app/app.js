var App = function () {
    var _masterCheckbox;
    var _checkbox;
    // 存放ID的数组
    var _idArray;

    /**
     * 私有方法,初始化ICheck
     */
    var handlerInitCheckbox = function () {
        //  激活Checkbox,初始化样式
        $('input[type="checkbox"].minimal, input[type="redio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        })

        //  获取顶部"全选"checkbox
        _masterCheckbox = $('input[type="checkbox"].minimal.icheck_master');

        //  获取单选Checkbox集合
        _checkbox = $('input[type="checkbox"].minimal');
    };

    /**
     * 全选功能
     */
    var handlerCheckboxAll = function () {
        //  绑定事件--选中
        _masterCheckbox.on("ifClicked", function (e) {
            //  返回true表示"全选框"未选中
            if (e.target.checked) {
                //  _checkbox设置为不选中
                _checkbox.iCheck("uncheck");
            }
            //  否则全选
            else {
                _checkbox.iCheck("check")
            }
        });
    };

    /**
     * 批量删除
     */
    var handlerDeleteMulti = function f(url) {
        _idArray = [];
        //将选中元素的ID放入数组中
        // var _chekbox = this.getCheckbox();
        var _chekbox = App.getCheckbox();
        _chekbox.each(function () {
            var _id = $(this).attr("id");
            if (_id !== null && _id !== "undefine" && $(this).is(":checked")) {
                //push() 方法可向数组的末尾添加一个或多个元素，并返回新的长度
                //要想数组的开头添加一个或多个元素，请使用 unshift() 方法
                _idArray.push(_id);
            }
        });
        // 根据选中ID的数组长度进行操作
        if (_idArray.length === 0) {
            // 更改提示消息-未选择时
            $('#modal-message').html("您还没有选择任何数据,请至少选择一项");
        } else {
            // 更改提示消息-已选择时
            $('#modal-message').html("您确定删除该数据吗?");
        }

        // 打开提示 模态框
        $('#modal-default').modal('show');

        // 模块框的'确定'按钮绑定点击事件
        $('.modal-footer .btn-primary').bind("click", function () {
            del();
        });

        /**
         * 当前私有函数的私有函数,删除数据
         */
        function del() {
            $('#modal-default').modal("hide");
            //未选择数据
            if (_idArray.length === 0) {
                //关闭模态框
                // $('#modal-default').modal("hide");
            }
            // 否则提交数据到后台,删除数据
            else {
                // 延迟执行
                setTimeout(function(){
                    // console.log("提交数据到后台");
                    // 以post方式请求url,
                    // 传入参数ids,预期返回类型JSON
                    // 请求成功后回调函数success,以返回值为参数data
                    //https://www.cnblogs.com/jach/p/5709175.html
                    $.ajax({
                        "url": url,
                        "type": "POST",
                        //设置同步执行
                        "async": false,
                        "data": {"ids": _idArray.toString()},
                        "dataType": "JSON",
                        "success": function (data) {
                            console.log(data);
                            if (data.status === 200) {
                                //成功就刷新
                                window.location.reload();
                            } else {
                                //删除绑定,重新绑定'确定按钮'事件为关闭
                                $('.modal-footer .btn-primary').unbind("click");
                                $('.modal-footer .btn-primary').bind("click", function () {
                                    $('#modal-default').modal('hide');
                                });
                                //改消息,打开模态框,
                                $('#modal-message').html(data.message);
                                $('#modal-default').modal("show");
                            }
                        }
                    })
                }, 300);
            }
        }
    };


    return {
        init: function () {
            handlerInitCheckbox();
            handlerCheckboxAll();
        },
        getCheckbox: function () {
            return _checkbox;
        },
        deleteMulti: function (url) {
            handlerDeleteMulti(url);
        }
    }
}();

$(document).ready(function () {
    App.init();
});

/*
var a = function () {
    var i = 1;
    var j = 2;
    var b = function () {
        return i + j;
    };
    return {
        b,
        c: function () {
            console.log("123");
            console.log(b);
        }
    };
};
*/
/*

var iBaseNum = 10;

var add = function(iNum1, iNum2) {
    var doA = function () {
        return iNum1 + iNum2 + iBaseNum;
    }
    return {
        ss: function() {
            doA(1,2);
            console.log("123");
        }
    }
};
*/
/*
_a = function a(){
    var n = 0;
    function inc(){
        n++;
        console.log(n);
    }
    return inc;
};
var c = a();
c();    //控制台输出1
c();    //控制台输出2
*/
