package com.notes.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.notes.domain.Notes;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


@Mapper
public interface NotesMapper extends BaseMapper<Notes> {
    @Update("update t_notes set notes_group='' where notes_group=#{groupName}")
    void deleteGroup(String groupName);
    @Update("update t_notes set proficiency= #{proficiency} where notes_id =#{notesId}")
    void ShowAnswers(Notes notes);

    void addBook(List<Integer> addNotesId, String bookname);
    @Update("update t_notes set errorbook_name=#{bookname} where notes_id=#{integer}")
    void update(Integer integer, String bookname);
    @Select("select * from t_notes where promulgator =#{account} and errorbook_name =#{bookname} limit 10;")
    List<Notes> shengcheng(String account, String bookname);
    @Update("update t_notes set errorbook_name=null where notes_id=#{cleanId}")
    void clean(Integer cleanId);

}