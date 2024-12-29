package com.notes.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.notes.domain.Errorbook;
import com.notes.domain.Notes;
import com.notes.domain.User;
import com.notes.mapper.ErrorMapper;
import com.notes.mapper.NotesMapper;
import com.notes.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
 * 即考虑缓存，同时又要修改数据库
 * */
@Service
public class BookService {
    @Autowired
    UserMapper userMapper;

    @Autowired
    NotesMapper notesMapper;

    /**
     * 缓存
     * 获取用户所有组名（解开分隔符#）（注意无分组情况）
     *
     * @param account 当前用户账号
     * @return 所有组名
     */
//    @Cacheable(value = "GroupsName", key = "#account")
    public String[] getBooksName(String account) {
        try {
            User user= userMapper.selectById(account);

            if(user.getBookName()==null||user.getBookName().length()==0){ // null 或空字符串
                return new String[0];
            }
            String[] ret = user.getBookName().split("#");
            return ret;
        } catch (Exception e) {
            e.printStackTrace();
            return new String[0];
        }
    }

    /**
     * 缓存
     * 添加组名
     *判断是否为空字符串或null，是的话直接添加，否则先补#再添加
     * @param account      当前用户账号
     * @param newGroupName 新组名
     * @return 所有组名
     */
//    @CachePut(value = "GroupsName", key = "#account")
    public String[] addBook(String account, String newBookName) {
        try {
            User user = userMapper.selectById(account);
            String books = user.getBookName();
            if(books==null ||books.length()==0){
                user.setBookName(newBookName);
                userMapper.updateById(user);
                return new String[]{newBookName};
            }else{
                books = books +"#"+newBookName;
                user.setBookName(books);
            }
            userMapper.updateById(user);
            return user.getBookName().split("#");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    /**
//     * 缓存
//     * 更新组名
//     *
//     * @param account      当前用户账号
//     * @param oldGroupName  原组名
//     * @param newGroupName 更新组名
//     * @return 所有组名
//     */
////    @CachePut(value = "GroupsName", key = "#account")
//    public String[] updateGroup(String account,String oldGroupName, String newGroupName) {
//        try {
//            User user = userMapper.selectById(account);
//            user.setUserGroups(user.getUserGroups().replace(oldGroupName, newGroupName));
//            userMapper.updateById(user);
//            return user.getUserGroups().split("#");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
    /**
     * 缓存
     * 注意！删除组的同时需要将该组下的所有错题的分组改为 '' ！
     * 注意！当没有组时用户组字段应该为''，不能有’#‘！
     * 删除组名
     *
     * @param account   当前用户账号
     * @param groupName 要删除的组名
     * @return 删除后的所有组名
     */
//    @CachePut(value = "GroupsName", key = "#account")
    public String[] deleteBook(String account, String bookName) {
        try {
            notesMapper.deleteGroup(bookName);
            User user = userMapper.selectById(account);
            String book = user.getBookName();
            if(book.contains("#")){ // 多个groups
                if(book.startsWith(bookName)){
                    user.setBookName(book.replace(bookName+"#",""));
                }else{
                    user.setBookName(book.replace("#"+bookName,""));
                }
                userMapper.updateById(user);
                return user.getBookName().split("#");
            }else{
                user.setBookName("");
                userMapper.updateById(user);
                return new String[0];
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addBooks(List<Integer> addNotesId, String bookname) {
        // 创建 UpdateWrapper，设置 update 条件
        for (int i = 0; i < addNotesId.size(); i++) {
            System.out.println(addNotesId.get(0));
            notesMapper.update(addNotesId.get(i),bookname);
        }
        }



    public boolean delete(List<Integer> notesIds) {
        try {
            for (int i = 0; i < notesIds.size(); i++) {
                Notes notes = notesMapper.selectById(notesIds.get(i));
                notes.setDeleted(true);
                notesMapper.updateById(notes);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 条件获取用户错题（用于列表显示
     *
     * @param account        当前用户账号
     * @param condition      查询条件（key包括content[关键字匹配标题],notesGroup,priority),条件为空则表示全查询
     * @param order          排序（0表示不排序，1表示升序，-1表示降序）
     * @param orderCondition 排序条件(priority,notesGroup,updateTime 其中一个)
     * @return 分页结果
     */
    // @Cacheable("getNotes")
    public IPage<Notes> getBook(long currentPage, long pageSize,
                                 String account, Map<String, String> condition,
                                 int order, String orderCondition) {
        try {
            QueryWrapper<Notes> wrapper = new QueryWrapper<>();
            wrapper.orderByAsc("proficiency");
            wrapper.eq("promulgator",account);
            wrapper.eq("deleted", false);
            wrapper.orderByAsc("proficiency");
            if (!condition.get("errorbookName").isEmpty())
                wrapper.eq("errorbook_name", condition.get("errorbookName"));
            IPage<Notes> page = new Page<>(currentPage, pageSize);
            notesMapper.selectPage(page,wrapper);
            return page;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;}

    public boolean deletebook(Integer notesId) {
        try {
            notesMapper.clean(notesId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
