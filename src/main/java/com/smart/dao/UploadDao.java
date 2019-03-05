package com.smart.dao;

import com.smart.bean.Pic;

import java.util.List;

public interface UploadDao {
    //添加勤工助学记录
    public int picAdd(Pic pic);

    //显示公司勤工助学记录
    public List<Pic> showPicByEmail(String email);

    //后台所有勤工助学记录
    public List<Pic> showPic(Pic pic);

    //Pass记录
    public void passPic(int id);

    //DisPass用户
    public void dispassPic(int id);
}
