package com.funtl.my.shop.web.admin.web.controller;

import com.funtl.my.shop.commons.CookieUtils;
import com.funtl.my.shop.commons.constant.ConstantUtils;
import com.funtl.my.shop.domain.TbUser;
import com.funtl.my.shop.web.admin.service.TbUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * @Author: two
 */
@Controller
public class LoginController {
    @Autowired
    private TbUserService tbUserService;

    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public String login(HttpServletRequest req) {
        //通过"userinfo"获取Cookie的值保存在字符串userInfo中
        String userInfo = CookieUtils.getCookieValue(req, "userInfo");
        //获取的值不为空
        if (!StringUtils.isBlank(userInfo)) {
            //将字符串拆分为email和password并放到req对象中,进入登录界面就能显示req中的值
            String[] userInfoArray = userInfo.split(":");
            String email = userInfoArray[0];
            String password = userInfoArray[1];
            req.setAttribute("email", email);
            req.setAttribute("password", password);
            req.setAttribute("isRemember", true);
        }
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestParam/*(required = true)*/ String email, @RequestParam/*(required = true)*/ String password, HttpServletRequest req, HttpServletResponse resp, Model model) {
        TbUser tbUser = tbUserService.login(email, password);
        boolean isRemember = req.getParameter("isRemember") != null;
        //未选择记住我,清空Cookie中的用户信息
        if (!isRemember) {
            CookieUtils.deleteCookie(req, resp, "userInfo");
        }
        //登录失败
        if (tbUser == null) {
            model.addAttribute("message", "用户名或密码错误,请重新输入");
            return "login";
        }
        //登录成功
        else {
            if (isRemember) {
                //用户信息存储7天,format(String format, Object... args)使用指定的字符串格式和参数生成格式化的新字符串。
                CookieUtils.setCookie(req, resp, "userInfo", String.format("%s:%s", email, password), 7 * 24 * 60 * 60);
            }
            //用户信息放入session
            req.getSession().setAttribute(ConstantUtils.SESSION_USER, tbUser);
            //重定向到首页
            return "redirect:/main";
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest req) {
        if (req.getSession().getAttribute(ConstantUtils.SESSION_USER) != null) {
            req.getSession().invalidate();
            return "redirect:/login";
        }
        return "login";
    }
}
