package com.notes.domain;

import java.util.List;

public class RequestData {
    private List<Integer> list;
    private String bookname;

    // Getters and Setters
    public List<Integer> getList() {
        return list;
    }

    public void setList(List<Integer> list) {
        this.list = list;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }
}

