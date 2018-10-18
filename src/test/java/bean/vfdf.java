package bean;

import com.lcvc.tsg.dao.AdminDao.AdminDao;
import com.lcvc.tsg.dao.AdminDao.BookDao;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.servers.Admin.BookBean;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @ClassName vfdf
 * @Author Anle
 * @Date 2018/10/18 0018 上午 10:39
 * @Version 1.0
 **/
@Controller
public class vfdf  {
    @Resource
    private BookBean bookBean;
    @Test
    public  void cc() {
        List<String> bookList = new ArrayList<String>();
         bookList.add("java1");
        bookList.add("java-2");
        bookList.add("java-3");
        bookList.add("java-4");
        bookList.add("java-5");
        bookList.add("java-6");
        bookList.add("java-7");
        bookList.add("java-8");
        bookList.add("java-9");
        bookList.add("java-10");
        bookList.add("java-11");
        bookList.add("java-12");
        bookList.add("java-13");
        bookList.add("java-14");
        bookList.add("java-15");
        bookList.add("java-16");
        bookList.add("java-17");
        bookList.add("java-18");
        bookList.add("java-19");

        List<Integer> list = new ArrayList<Integer>();
            for (int s=0;s<20;s++) {
                for (int i = 0; i < bookList.size(); i++) {
                    list.add(i);
                }
                Collections.shuffle(bookList);
                System.out.println(bookList.get(0));
            }

    }
}
