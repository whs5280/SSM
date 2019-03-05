package com.smart.controller;

import com.github.pagehelper.PageInfo;
import com.smart.bean.Pic;
import com.smart.exception.CustomException;
import com.smart.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class UploadController {
    @Autowired
    private UploadService uploadService;

    @RequestMapping(value="/picIndex")
    public ModelAndView picIndex() {
        return new ModelAndView("/picIndex");
    }


    //查询列表
    @RequestMapping("/listPic.do")
    @ResponseBody
    public Map<String,Object> listPic(Pic pic, Integer pageNum, Integer pageSize)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        try{
            //获取分页信息
            if (pageNum == null || pageNum == 0) {
                pageNum = 1;
            }
            if (pageSize == null) {
                pageSize = 5;
            }
            /*if (pic.getState() != null) {
                pic.setState("%" + pic.getState() + "%");
            }*/
            PageInfo<Pic> page = uploadService.pageUser(pic, pageNum, pageSize);
            map.put("page", page);
        }catch (Exception e){
            throw new CustomException("未知错误");
        }
        return map;
    }

    // 通过
    @RequestMapping("/passPic.do")
    @ResponseBody
    public Map<String, Object> passPic(Integer id) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;
        isSuccess = uploadService.passPic(id);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //不通过
    @RequestMapping("/dispassPic.do")
    @ResponseBody
    public Map<String, Object> dispassPic(Integer id){
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;
        isSuccess = uploadService.dispassPic(id);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    @RequestMapping("/addPic.do")
    @ResponseBody
    public Map<String,Object> addPic(HttpServletRequest httpServletRequest, Pic pic) throws Exception{

        Map<String,Object> map = new HashMap<String,Object>();
        System.out.println("success in");
        MultipartHttpServletRequest mulReq=(MultipartHttpServletRequest)httpServletRequest;
//获取上传的文件
        CommonsMultipartFile file = (CommonsMultipartFile) mulReq.getFile("pic");

        String address = httpServletRequest.getSession().getServletContext().getRealPath("/upload/");
        System.out.println(address);

        String path = uploadService.fileUpload(file, address);
        System.out.println(path);
        pic.setPic(path);

        boolean isSuccess = uploadService.addPic(pic);
        if(isSuccess){
            map.put("tip", "success");
        }
        else{
            map.put("tip", "error");
        }
        return map;
    }

    @PostMapping("/upload")
    public String upload(@RequestParam("pic")MultipartFile pictureFile, @RequestParam("mark")String mark, @RequestParam("comEmail")String comEmail,HttpServletRequest httpServletRequest ) throws Exception {

        //String FILEPATH = "F:\\upload\\";
        String FILEPATH = httpServletRequest.getSession().getServletContext().getRealPath("/upload/");
        System.out.println(FILEPATH);

        File fileUrl=new File(FILEPATH);

        //如果当前项目里不存在upload文件夹，就创建文件夹
        if(!fileUrl.exists()){
            fileUrl.mkdir();
        }

        String originalFilename = "";
        String newFileName = "";

        //进行图片的上传
        if (pictureFile!=null && pictureFile.getOriginalFilename()!=null && pictureFile.getOriginalFilename().length()>0) {
            //图片上传成功后，将图片的地址写到数据库
            originalFilename = pictureFile.getOriginalFilename();

            newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));

            //新文件
            File file = new File(FILEPATH + newFileName);

            File file1 = new File(FILEPATH + newFileName);

            //将内存中的文件写入磁盘
            pictureFile.transferTo(file);
        }

        //System.out.println(comEmail + ";" + newFileName + ";" + mark);
        //uploadService.insertFile(comEmail, FILEPATH+newFileName, mark);

        return "index";
    }
}
