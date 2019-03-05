package com.smart.dao;

import com.smart.bean.Collect;
import com.smart.bean.Record;

import java.util.List;

public interface CollectDao {
    //添加收藏
    public void CollectAdd(Collect collect);
    //删除收藏
    public void CollectDel(int id);
    //显示收藏
    public List<Collect> showCollect(String email);

    //条件统计
    public List<Record> allInfo();
}
