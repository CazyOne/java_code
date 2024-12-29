package com.notes.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/file")
public class FileController {
    @Value("${file.uploadPath}")
    private String uploadPath;

    // 文件上传
    @PostMapping("/upload")
    public Map<String, Object> upload(@RequestParam("imgFile") MultipartFile file,
                                      HttpServletResponse response) throws Exception {
        // 获取原始文件名
        String orgName = file.getOriginalFilename();
        // 获取后缀
        String suffix = orgName.substring(orgName.lastIndexOf("."));
        // 使用UUID生成文件名 防止文件名重复造成文件名覆盖
        String newName = UUID.randomUUID().toString() + suffix;

        ApplicationHome h = new ApplicationHome(getClass());
        String dirPath = h.getSource().getParentFile().getParentFile().toString();
        String aPath = dirPath+"\\src\\main\\resources\\" + uploadPath;

        // String aPath = ResourceUtils.getURL("classpath:static").getPath().substring(1) + "/upload/";
        System.out.println(aPath);

        // 判断目录是否存在
        File dir = new File(aPath);
        if (!dir.exists()) dir.mkdir();

        // 写文件
        try {
            byte[] bytes = file.getBytes();
            FileOutputStream fos = new FileOutputStream(new File(aPath + newName));
            fos.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 返回图片映射地址
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("url", "http://localhost:8080/imgFile/" + newName);
        return result;
    }


}
