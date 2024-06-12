package com.moshu.trainplatform.controller.api;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/api/download")
public class ApiDownloadController {

    @Value("${file_temporary_path}")
    private String fileTemporaryPath;

    /**
     * 下载临时文件
     */
    @GetMapping("/downloadTemporary")
    @ResponseBody
    public byte[] downloadTemporary(@RequestParam("fileName")String fileName){
        byte[] fileContent = null;
        try {
            // 从文件系统或者其他地方获取文件内容
            Path path = Paths.get(fileTemporaryPath + fileName);
            fileContent = Files.readAllBytes(path);
            //删除当前文件
            File file = new File(fileTemporaryPath + fileName);
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileContent;
    }

}
