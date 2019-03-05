package com.smart.controller;

import com.smart.bean.Collect;
import com.smart.exception.CustomException;
import com.smart.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class AdminController {
    @Autowired
    private CollectService collectService;

    //增加收藏
    @RequestMapping(value = "/addCollect")
    @ResponseBody
    public Map<String,Object> addCollect(Collect collect) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();

        boolean isSuccess = collectService.CollectAdd(collect);
        if(isSuccess){
            map.put("tip", "success");
        }
        else{
            map.put("tip", "error");
        }
        return map;
    }

    //删除收藏
    @RequestMapping(value = "/delCollect")
    @ResponseBody
    public Boolean delCollect(int id){
        Boolean result = false;
        collectService.CollectDel(id);
        result = true;
        return result;
    }

    //通过email显示收藏
    @RequestMapping(value = "/findCollect")
    @ResponseBody
    public Map<String,Object> findCollect(String email) throws Exception {
        Map<String ,Object> map = new HashMap<String,Object>();
        try{
            List<Collect> list = collectService.showCollect(email);
            map.put("list",list);
        }catch (Exception e){
            throw new CustomException("未知错误");
        }
        return map;
    }
}
