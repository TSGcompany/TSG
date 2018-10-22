package com.lcvc.tsg.dao.UserDao;
import com.lcvc.tsg.model.Customer;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    /**
     * Junji
     * @param
     * @return
     */
    //=============================== 查看用户详情=============================

    Customer getCustomer(int id);

    //=============================== 修改用户密码=============================
    public int updateUserPassWord(@Param(value = "id") Integer id, @Param(value = "customer_password") String customer_password);



}
