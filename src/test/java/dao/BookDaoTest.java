package dao;

import com.lcvc.tsg.dao.BookDao;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * @ClassName BookDaoTest
 * @Author Anle
 * @Date 2018/9/25 0025 下午 4:25
 * @Version 1.0
 **/
public class BookDaoTest extends SpringJunitTest {
    @Resource
    private BookDao bookdao;

    @Test
    public void ShowBookName() {
        System.out.println(bookdao.bookname());


    }

}
