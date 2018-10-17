package dao;

import com.lcvc.tsg.dao.ShopDao.ShopIndexDao;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName ShopTest
 * @Author Anle
 * @Date 2018/10/17 0017 下午 10:23
 * @Version 1.0
 **/
public class ShopTest extends SpringJunitTest {
    @Resource
    private ShopIndexDao shopIndexDao;
    @Test
    public void getShopIndexBook(){
        List<Book> list  =  shopIndexDao.getShopIndexBook(0);
        for (Book book:list ) {
            System.out.println(book.getBook_name());
        }

    }

}
