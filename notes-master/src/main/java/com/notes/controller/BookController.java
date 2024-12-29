package com.notes.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.notes.domain.Notes;
import com.notes.domain.RequestData;
import com.notes.service.BookService;
import com.notes.service.GroupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class BookController {

    @Autowired
    BookService bookService;

    /**
     * 获取当前用户的所有分组名称
     * */
    @GetMapping("/getBook/{account}")
    public String[] getGroups(@PathVariable String account){
        return bookService.getBooksName(account);
    }

    /**
     * 添加分组
     * */
    @GetMapping("/addBook/{account}/{newbookName}")
    public String[] addGroup(@PathVariable String account, @PathVariable String newbookName){
        return bookService.addBook(account,newbookName);
    }

    /**
     *删除分组
     **/
    @GetMapping("/deleteBook/{account}/{newbookName}")
    public String[] deleteBook(@PathVariable String account, @PathVariable String newbookName){
        return bookService.deleteBook(account,newbookName);
    }
    /*将错题添加到错题本*/
    @PostMapping("/addBooks")
    public void addBook(@RequestBody RequestData requestData ){
      bookService.addBooks(requestData.getList(),requestData.getBookname());
    }
    /**
     * 条件获取用户错题（用于列表显示
     *
     * @return 分页结果
     */
    @PostMapping("/getBook/{currentPage}/{pageSize}")
    public IPage<Notes> getNotes(@PathVariable long currentPage, @PathVariable long pageSize, @RequestBody Map<String,Object> map) {
        String account = (String) map.get("account");
        Map<String,String> condition = (Map<String, String>) map.get("condition");
        int order = (int) map.get("order");
        String orderCondition = (String) map.get("orderCondition");
        log.info("查询错题成功!");
        log.info("[getNotes] condition = {}", condition);
        return bookService.getBook(currentPage,pageSize,account,condition,order,orderCondition);
    }
    //删除
    @DeleteMapping("/deleteBook/{notesId}")
    public boolean deleteNotes(@PathVariable Integer notesId) {
        return bookService.deletebook(notesId);
    }

}
