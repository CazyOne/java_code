package com.notes.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.notes.domain.Notes;
import com.notes.service.NotesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/notes")
@Slf4j
public class NotesController {

    @Autowired
    NotesService notesService;

    /**
     * 获取错题详情（需要切换图片源）
     *
     * @param notesId 笔记Id
     * @return 是否插入成功
     */
    @GetMapping("/getNotesById/{notesId}")
    public Notes getNotesById(@PathVariable String notesId) {
        return notesService.getNotesById(Integer.parseInt(notesId));
    }

    /**
     * 条件获取用户错题（用于列表显示
     *
     * @return 分页结果
     */
    @PostMapping("/getNotes/{currentPage}/{pageSize}")
    public IPage<Notes> getNotes(@PathVariable long currentPage, @PathVariable long pageSize,@RequestBody Map<String,Object> map) {
        String account = (String) map.get("account");
        Map<String,String> condition = (Map<String, String>) map.get("condition");
        int order = (int) map.get("order");
        String orderCondition = (String) map.get("orderCondition");
        log.info("查询错题成功!");
        log.info("[getNotes] condition = {}", condition);
        return notesService.getNotes(currentPage,pageSize,account,condition,order,orderCondition);
    }

//    /**
//     * 条件获取回收站里的用户错题（用于列表显示
//     *
//     * @return 分页结果
//     */
//    @PostMapping("/getNotes2/{currentPage}/{pageSize}")
//    public IPage<Notes> getNotes2(@PathVariable long currentPage, @PathVariable long pageSize,@RequestBody Map<String,Object> map) {
//        String account = (String) map.get("account");
//        Map<String,String> condition = (Map<String, String>) map.get("condition");
//        int order = (int) map.get("order");
//        String orderCondition = (String) map.get("orderCondition");
//        log.info("[getNotes] condition = {}", condition);
//        return notesService.getNotes2(currentPage,pageSize,account,condition,order,orderCondition);
//    }

    /**
     * 插入数据
     *
     * @param notes   待插入的笔记
     * @return 是否插入成功
     */
    @PostMapping("/addNotes")
    public boolean addNotes(@RequestBody Notes notes) {
        log.info("account--->"+notes.getPromulgator());
        System.out.println(notes);
        return notesService.insert(notes);
    }

    /**
     * 更新Notes
     */
    @PutMapping("/updateNotes")
    public Notes updateNotes(@RequestBody Notes notes) {
        return notesService.update(notes);
    }


    // 查看错题
    @GetMapping("/increaseProficiency/{notesId}")
    public boolean increaseProficiency(@PathVariable int notesId){
        Notes notes = notesService.getNotesById(notesId);
        notes.setProficiency(notes.getProficiency()+5);
        notesService.update(notes);
        return true;
    }

    /**
     * 删除错题
     *
     * @return 是否删除成功
     */
    @DeleteMapping("/deleteNotes/{notesId}")
    public boolean deleteNotes(@PathVariable Integer notesId) {
        return notesService.delete(notesId);
    }

    /**
     * 批量删除错题(调用delete方法,用于删除缓存）
     *
     * @param selectedNotesId 要删除的notesId集合
     * @return 是否删除成功
     */
    @DeleteMapping("/multiDeleteNotes")
    public boolean multiDeleteNotes(@RequestBody List<Integer> selectedNotesId) {
        return notesService.delete(selectedNotesId);
    }

//    /**
//     * 彻底删除错题
//     *
//     * @return 是否删除成功
//     */
//    @DeleteMapping("/reallyDeleteNotes/{notesId}")
//    public boolean reallyDeleteNotes(@PathVariable Integer notesId) {
//        return notesService.reallyDelete(notesId);
//    }
//
//    /**
//     * 彻底批量删除错题(调用delete方法,用于删除缓存）
//     *
//     * @param selectedNotesId 要删除的notesId集合
//     * @return 是否删除成功
//     */
//    @DeleteMapping("/multiReallyDeleteNotes")
//    public boolean multiReallyDeleteNotes(@RequestBody List<Integer> selectedNotesId) {
//        return notesService.reallyDelete(selectedNotesId);
//    }
//
//    /**
//     * 还原错题
//     *
//     * @return 是否还原成功
//     */
//    @PutMapping("/restoreNotes/{notesId}")
//    public boolean restoreNotes(@PathVariable Integer notesId) {
//        return notesService.restore(notesId);
//    }
//
//    /**
//     * 批量删除还原错题(调用restore方法）
//     *
//     * @return 是否还原成功
//     */
//    @PutMapping("/multiRestoreNotes")
//    public boolean multiRestoreNotes(@RequestBody List<Integer> selectedNotesId) {
//        return notesService.restore(selectedNotesId);
//    }
}
