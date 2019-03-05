package com.smart.service;

import com.smart.bean.Collect;

import java.util.List;

public interface CollectService {
    //添加收藏
    public boolean CollectAdd(Collect collect);
    //删除收藏
    public boolean CollectDel(int id);
    //显示收藏
    public List<Collect> showCollect(String email);
}
