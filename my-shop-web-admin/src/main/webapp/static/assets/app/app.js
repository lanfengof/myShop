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

        //  绑定选中事件
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
        var _chekbox = this.getCheckbox();
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
         * 当前私有函数的私有函数
         */
        function del() {
            //未选择数据就关闭模态框
            if (_idArray.length === 0) {
                $('#modal-default').modal("hide");
            }
            // 否则提交数据到后台,删除数据
            else {
                // console.log("提交数据到后台");
                $.ajax({
                    "url": url,
                    "type": "POST",
                    "data": {"ids": _idArray.toString()},
                    "dataType": "JSON",
                    "success": function (data) {
                        console.log(data);
                    }
                });
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
            handlerDeleteMulti();
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
}();
var iBaseNum = 10;

var add = function addNum(iNum1, iNum2) {
    var doA = function () {
        return iNum1 + iNum2 + iBaseNum;
    }
    return {
        ss: function() {
            doA(1,2);
            console.log("123");
        }
    }
}();
*/
