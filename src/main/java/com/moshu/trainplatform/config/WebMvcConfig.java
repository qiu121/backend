package com.moshu.trainplatform.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.util.UrlPathHelper;

import java.nio.charset.StandardCharsets;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

//    @Value("${staticDirector}")
//    private String staticDirector;
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/static/**")
//                .addResourceLocations(staticDirector);
//    }

//    @Override
//    public void configurePathMatch(PathMatchConfigurer configurer) {
//        UrlPathHelper urlPathHelper=new UrlPathHelper();
//        urlPathHelper.setUrlDecode(false);
//        urlPathHelper.setDefaultEncoding(StandardCharsets.UTF_8.name());
//        configurer.setUrlPathHelper(urlPathHelper);
//    }

    @Value("${file.location}")
    String fileLocation;  // 这两个是路径
    @Value("${file.path}")
    String filepath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //匹配到resourceHandler,将URL映射至location,也就是本地文件夹
        registry
//                .addResourceHandler(filepath)
                .addResourceHandler("/staticFile/**")
                .addResourceLocations("file:" + fileLocation + "/");//这里最后一个/不能不写
    }



}
