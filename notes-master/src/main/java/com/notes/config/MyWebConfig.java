package com.notes.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.FileNotFoundException;

@Configuration
public class MyWebConfig implements WebMvcConfigurer {
    // addResourceHandler: 访问映射路径
    // addResourceLocations: 资源绝对路径
    @Value("${file.uploadPath}")
    private String uploadPath;

    // 添加图片资源虚拟路径映射
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        try {
            ApplicationHome h = new ApplicationHome(getClass());
            String dirPath = h.getSource().getParentFile().getParentFile().toString();
            String aPath = dirPath+"\\src\\main\\resources\\" + uploadPath;
            registry.addResourceHandler("/imgFile/**").addResourceLocations(
                    "file:" + aPath
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
