package com.lnc.ums.user.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.common.utils.DateUtils;
import com.lnc.ums.common.utils.DownloadUtils;
import com.lnc.ums.common.utils.ExcelUtils;
import com.lnc.ums.user.bean.UserBean;
import com.lnc.ums.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("main")
    public String main() {

        return "user/main";
    }

    @RequestMapping("list")
    public String list(Model model, UserBean user, @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "10") int limit) {

        List<UserBean> users = userService.query(user, new PageBounds(page, limit));

        model.addAttribute("users", users);

        return "user/list";
    }

    @RequestMapping("initAdd")
    public String initAdd() {
        return "user/add";
    }

    @RequestMapping("add")
    public String add(UserBean user) {

        userService.save(user);

        return "redirect:list.action";
    }

    @RequestMapping("view")
    public String view(Model model, int id) {

        UserBean user = userService.queryById(id);

        model.addAttribute("user", user);

        return "user/view";
    }

    @RequestMapping("initEdit")
    public String initEdit(Model model, int id) {

        UserBean user = userService.queryById(id);

        model.addAttribute("user", user);

        return "user/edit";
    }

    @RequestMapping("edit")
    public String edit(UserBean user) {

        userService.update(user);

        return "redirect:list.action";
    }

    @RequestMapping("delete")
    public String delete(int id) {

        userService.delete(id);

        return "redirect:list.action";
    }

    @RequestMapping("imp")
    public @ResponseBody String imp(HttpSession session, MultipartFile userFile) {

        // 重置上传进度
        session.setAttribute("progress", 0);

        List<Object[]> datas = null;
        if (userFile != null) {
            InputStream stream = null;
            try {
                stream = userFile.getInputStream();
                datas = ExcelUtils.read(stream);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (stream != null) {
                    try {
                        stream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        if (datas != null) {
            UserBean user = null;
            for (Object[] data : datas) {
                user = new UserBean();
                user.setUsername(String.valueOf(data[0]));
                user.setPassword(String.valueOf(data[1]));
                user.setDesc(String.valueOf(data[3]));
                userService.save(user);
            }
        }

        // 模拟上传进度
        for (int i = 0; i <= 100; i += 5) {
            session.setAttribute("progress", i);
            System.out.println(i);
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        return "success";
    }

    @RequestMapping("exp")
    public void exp(HttpServletResponse response) {

        // 下载文件名字
        String fileName = "用户列表_" + DateUtils.toString(DateUtils.currentTime(), "yyyyMMddHHmmss") + ".xls";
        DownloadUtils.fileNameToResponse(response, fileName);

        // 查询所有用户列表
        List<UserBean> users = userService.query(null);

        // 表格表头
        String[] title = { "编号", "用户名", "创建时间", "描述" };
        List<Object[]> datas = new ArrayList<Object[]>();
        for (UserBean user : users) {
            Object[] data = new Object[title.length];
            data[0] = user.getId();
            data[1] = user.getUsername();
            data[2] = DateUtils.toString(user.getCreateTime());
            data[3] = user.getDesc();
            datas.add(data);
        }

        try {
            ExcelUtils.write(title, datas, response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("down")
    public void down(HttpServletResponse response) {

        // 下载文件名字
        String fileName = "用户列表模板_" + DateUtils.toString(DateUtils.currentTime(), "yyyyMMddHHmmss") + ".xls";
        DownloadUtils.fileNameToResponse(response, fileName);

        // 表格表头
        String[] title = { "用户名", "密码" };
        try {
            ExcelUtils.write(title, null, response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
