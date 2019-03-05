package com.smart.service;

import com.github.pagehelper.PageInfo;
import com.smart.bean.Pic;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface UploadService{
    //添加记录
    public boolean addPic(Pic pic);

    //查询列表
    public PageInfo<Pic> pageUser(Pic pic, Integer pageNum, Integer pageSize);

    //Pass记录
    public boolean passPic(int id);

    //DisPass用户
    public boolean dispassPic(int id);

    //图片上传
    public String fileUpload(MultipartFile file, String address) throws IOException;

    //upload
    public String upload(MultipartFile file, Pic pic, ModelMap map) throws IOException;

    //
    public void insertFile(String comEmail, String pic, String mark);
}
