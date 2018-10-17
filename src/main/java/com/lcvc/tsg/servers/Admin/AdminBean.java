package com.lcvc.tsg.servers.Admin;

import com.lcvc.tsg.dao.AdminDao.AdminDao;
import com.lcvc.tsg.model.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName AdminBean
 * @Author Anle
 * @Date 2018/10/3 0003 下午 4:28
 * @Version 1.0
 **/
@Service
public class AdminBean {
    @Resource
    private AdminDao adminDao;

    /**
     * @Author Anle
     * @Date 下午 5:34 2018/10/7 0007
     **/
    //=============================== 查看管理员详情=============================
    public Admin getAdmin(int id) {

        return adminDao.getAdmin(id);
    }
    //=============================== 修改管理员密码=============================

    /**
     * @Author JunJi
     * @Date 2018/10/9 14:56
     **/
    public Boolean updatePassword(Integer id, String admin_password) {
        Boolean status = false;
        int i = adminDao.updatePassword(id, admin_password);
        if (i > 0) {
            status = true;
        }
        return status;
    }
    //=============================== 修改基本信息=============================

    public int updateubase(Admin admin) {

        return adminDao.updateubase(admin);
    }

    //=============================== 查看管理员昵称有没有重名 ==================================
    public int AdminRename(String AdminName) {

        return adminDao.AdminRename(AdminName);
    }


}