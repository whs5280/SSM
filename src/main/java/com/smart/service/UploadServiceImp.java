package com.smart.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smart.bean.Pic;
import com.smart.dao.UploadDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UploadServiceImp implements UploadService {
    @Autowired
    UploadDao uploadDao;

    //添加记录
    public boolean addPic(Pic pic){
        boolean isSuccess = false;
        System.out.println("开始");
        uploadDao.picAdd(pic);
        System.out.println("成功添加纪录");
        isSuccess = true;
        return isSuccess;
    }

    //查询列表
    public PageInfo<Pic> pageUser(Pic pic, Integer pageNum, Integer pageSize) {
        PageInfo<Pic> page = null;

        PageHelper.startPage(pageNum, pageSize);
        List<Pic> plist = uploadDao.showPic(pic);
        page = new PageInfo<Pic>(plist);
        return page;
    }

    //Pass记录
    public boolean passPic(int id) {
        boolean isSuccess = false;
        uploadDao.passPic(id);
        isSuccess = true;
        return isSuccess;
    }

    //DisPass用户
    public boolean dispassPic(int id) {
        boolean isSuccess = false;
        uploadDao.dispassPic(id);
        isSuccess = true;
        return isSuccess;
    }

    public String fileUpload(MultipartFile file, String address) throws IOException {
        System.out.println("fileName："+file.getOriginalFilename());
        String path= address + new Date().getTime()+file.getOriginalFilename();

        File newFile=new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);
        return path;
    }

    public String upload(MultipartFile file, Pic pic, ModelMap map) throws IOException{

        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "F:\\upload";
        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = UUID.randomUUID() + originalFilename;
        // 封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        file.transferTo(targetFile);

        // 保存到数据库
        pic.setPic(newFileName);
        uploadDao.picAdd(pic);
        return "success";

        //String address = httpServletRequest.getSession().getServletContext().getRealPath("/upload/");

        //String path = uploadService.fileUpload(file, address);
    }

    public void insertFile(String comEmail, String pic, String mark){
        Pic image = new Pic(comEmail, pic, mark);
        uploadDao.picAdd(image);
    }
}
