package com.notes.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.notes.domain.Notes;
import com.notes.domain.Question;
import com.notes.service.TextService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/text")
@Slf4j
public class TextController {
    @Autowired
    TextService textService;
    /**
     * 条件获取用户错题（用于列表显示
     *
     * @return 分页结果
     */
    @PostMapping("/getText/{currentPage}/{pageSize}")
    public IPage<Notes> getNotes(@PathVariable long currentPage, @PathVariable long pageSize, @RequestBody Map<String,Object> map) {
        String account = (String) map.get("account");
        Map<String,String> condition = (Map<String, String>) map.get("condition");
        int order = (int) map.get("order");
        String orderCondition = (String) map.get("orderCondition");
        log.info("查询错题成功!");
        log.info("[getNotes] condition = {}", condition);
        return textService.getNotes(currentPage,pageSize,account,condition,order,orderCondition);
    }

    /**
     * 提交修改
     */
    @PutMapping("/updateText")
    public Notes updateNotes(@RequestBody Notes notes) {
        notes.setProficiency(notes.getProficiency()+5);
        return textService.update(notes);
    }

    /**
     * 显示答案
     */
    @PutMapping("/ShowAnswers")
    public Notes ShowAnswers(@RequestBody Notes notes) {
        notes.setProficiency(notes.getProficiency()+5);
        return textService.ShowAnswers(notes);
    }
    @GetMapping("/getTest/{account}/{bookname}")
    public List<Question> GetText(@PathVariable String account, @PathVariable String bookname){
        return textService.shengcheng(account,bookname);
    }
    @PutMapping("/clean")
    public void CleanTest(@RequestBody List<Question> questions){
            textService.clean(questions);
    }

}
