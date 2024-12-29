package com.notes.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Question {
    private String question;
    private String correctAnswer;
    private String answer;  // 用户输入的答案
    private boolean showAnswer;  // 是否显示正确答案
    private boolean loading;  // 用于显示加载状态
    private String errorbookname;//随机问题对应的作业本标识
    private Integer id;
}
