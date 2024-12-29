package com.notes.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 错题本
 */
@Data
@TableName("t_errorbook")
@AllArgsConstructor
@NoArgsConstructor
public class Errorbook {
    @TableId(type = IdType.ASSIGN_ID)
    private int id; // 错题本编号
    private String bookName; //错题标题
    private String promulgator; //发布者账号
}
