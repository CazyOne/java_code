package com.notes.controller;

import com.notes.service.NotesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

// 数据统计控制器

@Slf4j
@RestController
@RequestMapping("/statistic")
public class StatisticController {
    @Autowired
    private NotesService notesService;

    // 获取题目总数
    @GetMapping("/totalNum")
    public Integer getTotalNumStatistic() {
        log.info("[getTotalNumStatistic]");
        return notesService.getTotalNumStatistic();
    }

    // 获取根据标签分组统计出来的题目数据 (notes_group)
    @GetMapping("/notesGroup/{account}")
    public Map<Object, Object> getNotesGroupStatistic(@PathVariable String account) {
        log.info("[getNotesGroupStatistic]");
        return notesService.getNotesGroupStatistic(account);
    }

    // 获取根据优先级分组统计出来的题目数据
    @GetMapping("/notesPriority/{account}")
    public Map<Object, Object> getNotesPriorityStatistic(@PathVariable String account) {
        log.info("[getNotesPriorityStatistic]");
        return notesService.getNotesPriorityStatistic(account);
    }

    // 获取根据日期分组统计出来的题目数据 (用户个人向)
    @GetMapping("/notesPublishDate")
    public String getNotesPublishDateStatistic(@RequestParam("promulgator") String promulgator,
                                               @RequestParam(value = "count", required = false) Integer count) {
        log.info("[getNotesPriorityStatistic] promulgator = {}", promulgator);
        return notesService.getNotesPublishDateStatistic(promulgator, count);
    }

}
