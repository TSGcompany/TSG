package com.lcvc.tsg.servers.Admin;

import com.lcvc.tsg.OtherPackage.MyMD5;
import com.lcvc.tsg.dao.AdminDao.PersonalDao;
import com.lcvc.tsg.model.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName PersonalBean
 * @Author Anle
 * @Date 2018/10/8 0008 上午 10:06
 * @Version 1.0
 **/
@Service
public class PersonalBean {
    @Resource
    private PersonalDao personalDao;
    //=============================== 查看管理员有没有重名 ==================================
    public int Rename(String AdminName) {

        return personalDao.Rename(AdminName);
    }

    //=============================== 查看管理员==============================
    public List<Admin> AdminShow(int index) {//展示管理员
        index = index * 10;  //按10个
        return personalDao.AdminShow(index);
    }
    public int AdminCount() {
        return personalDao.AdminCount();
    }

    //=============================== 添加管理员==============================
    public int AddAdmin(Admin admin) {
        admin.setAdmin_password(MyMD5.MD5(admin.getAdmin_password()));//加密
        admin.setAdmin_nickname(admin.getAdmin_name());
        return personalDao.AddAdmin(admin);

    }
    //=============================== 删除管理员==============================

    public int deleteAdmin(Integer adminId) {

        return  personalDao.deleteAdmin(adminId.intValue());
    }
}
