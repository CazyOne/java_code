package com.notes.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.notes.domain.Notes;
import com.notes.domain.Question;
import com.notes.mapper.NotesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TextService {
    @Autowired
    NotesMapper notesMapper;

    /**
     * 更新Notes
     */
    public Notes update(Notes notes) {
        try {
            //TODO
            notesMapper.updateById(notes);
            return notes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
    public IPage<Notes> getNotes(long currentPage, long pageSize,
                                 String account, Map<String, String> condition,
                                 int order, String orderCondition) {
        try {
            if(condition.isEmpty()){
                QueryWrapper<Notes> wrapper = new QueryWrapper<>();
                wrapper.eq("promulgator",account);
                wrapper.eq("deleted", false);
                wrapper.orderByAsc("proficiency");
                IPage<Notes> page = new Page<>(currentPage, pageSize);
                notesMapper.selectPage(page,wrapper);
                return page;
            }
            else {
                QueryWrapper<Notes> wrapper = new QueryWrapper<>();
                wrapper.orderByAsc("proficiency");
                wrapper.eq("promulgator",account);
                wrapper.eq("deleted", false);
                wrapper.orderByAsc("proficiency");
                if (!condition.get("priority").isEmpty())
                    wrapper.eq("priority", condition.get("priority"));
                if (!condition.get("notesGroup").isEmpty())
                    wrapper.eq("notes_group", condition.get("notesGroup"));
                if (!condition.get("content").isEmpty())
                    wrapper.like("notes_title", "%"+condition.get("content")+"%");
                IPage<Notes> page = new Page<>(currentPage, pageSize);
                notesMapper.selectPage(page,wrapper);
                return page;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }




    /**
     * 获取错题详情（需要切换图片源）
     *
     * @param notesId 笔记Id
     * @return 是否插入成功
     */
    public Notes getNotesById(int notesId) {
        try {
            return notesMapper.selectById(notesId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //显示答案增加熟练度
    public Notes ShowAnswers(Notes notes) {
        try {
            //TODO
            notesMapper.ShowAnswers(notes);
            return notes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Question> shengcheng(String account, String bookname) {
        List<Notes> notes=notesMapper.shengcheng(account,bookname);
        List<Question> questionList = new ArrayList<>();
        for (Notes note : notes) {
            // 创建一个新的 Question 对象
            Question question = new Question();

            // 将 Notes 的属性值赋给 Question
            question.setQuestion(note.getSubject());
            question.setCorrectAnswer(note.getAnswer());
            question.setErrorbookname(note.getErrorbookName());
            question.setId(note.getNotesId());
            // 将新的 Question 对象添加到 questionList 中
            questionList.add(question);

        }
        return questionList;
    }

    public void clean(List<Question> questions) {
        for (Question question:questions){
            //创建一个新的Notes对象
            Notes notes=new Notes();
            //获取测试题的id来修改数据库
            Integer cleanId=question.getId();
            notesMapper.clean(cleanId);
        }
    }
}
