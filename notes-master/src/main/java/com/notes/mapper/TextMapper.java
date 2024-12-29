package com.notes.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.notes.domain.Notes;
import org.apache.ibatis.annotations.Update;

public interface TextMapper extends BaseMapper<Notes> {
    @Update("update t_notes set notes_group='' where notes_group=#{groupName}")
    void deleteGroup(String groupName);
}
