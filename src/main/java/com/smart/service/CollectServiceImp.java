package com.smart.service;

import com.smart.bean.Collect;
import com.smart.dao.CollectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectServiceImp implements CollectService{
    @Autowired
    CollectDao collectDao;

    public boolean CollectAdd(Collect collect) {
        boolean isSuccess = false;
        collectDao.CollectAdd(collect);
        isSuccess = true;
        return isSuccess;
    }

    public boolean CollectDel(int id) {
        boolean isSuccess = false;
        collectDao.CollectDel(id);
        isSuccess = true;
        return isSuccess;
    }

    //显示收藏
    public List<Collect> showCollect(String email) {
        List<Collect> list = collectDao.showCollect(email);
        return list;
    }
}
