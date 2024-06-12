package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.moshu.trainplatform.aop.BussinessLog;
import com.moshu.trainplatform.aop.LogType;
import com.moshu.trainplatform.constant.exception.EmBizError;
import com.moshu.trainplatform.entity.FileInfo;
import com.moshu.trainplatform.service.FileInfoService;
import com.moshu.trainplatform.template.SuccessResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/api/fileInfo")
public class ApiFileInfoController {

    @Autowired
    private FileInfoService fileInfoService;

    // @Value("${file_path}")
    @Value("C:/Users/geek/Desktop/filePath")
    private String filePath;

    /**
     * 新增文件
     * @return
     */
    @PostMapping("/addFileInfo")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    @BussinessLog(module = LogType.FILE_UPLOAD)
    public SuccessResponse addFileInfo(@RequestBody(required = true) MultipartFile file,
                                       @RequestParam(required = true) String module,
                                       @RequestParam(required = true) String commonId) {
        // 判断模块目录是否存在，不存在就创建
        String modulePath = filePath + module;
        File moduleFile = new File(modulePath);
        if (!moduleFile.exists()) moduleFile.mkdirs();

        // 判断文件文件夹是否存在
        String commonIdPath = modulePath + "/" + commonId;
        File idFile = new File(commonIdPath);
        if (!idFile.exists()) idFile.mkdirs();

        // 判断文件是否存在
        String filePath = modulePath + "/" + commonId + "/" + file.getOriginalFilename();
        File newFile = new File(filePath);
        if (newFile.exists()) return new SuccessResponse(EmBizError.FILE_ALREADY_EXISTS_ERROR);

        try {
            byte[] uploadByteArray = file.getBytes();
            //保存文件
            FileOutputStream out = new FileOutputStream(filePath);
            out.write(uploadByteArray);
            out.close();
            // 插入记录
            FileInfo fileInfo = new FileInfo();
            fileInfo.setFileId(UUID.randomUUID().toString());
            fileInfo.setFileName(file.getOriginalFilename());
            fileInfo.setCommonId(commonId);
            fileInfo.setModule(module); // 所属模块
            fileInfo.setFilePath(module + "/" + commonId + "/" + file.getOriginalFilename()); // 文件地址
            fileInfoService.save(fileInfo);
            return new SuccessResponse(200);
        } catch (IOException ioException) {
            return new SuccessResponse(EmBizError.FILE_UPLOAD_ERROR);
        }
    }

    /**
     * 删除文件
     * @return
     */
    @GetMapping("/delFileInfoById")
    @BussinessLog(module = LogType.FILE_DELETION)
    @ResponseBody
    public SuccessResponse delFileInfoById(@RequestParam String fileId) {
        // 获取文件
        FileInfo fileInfo = fileInfoService.getById(fileId);
        try {
            // 删除文件
            File file = new File(filePath + fileInfo.getFilePath());
            file.delete();
            // 删除信息
            fileInfoService.removeById(fileInfo.getFileId());
        } catch (Exception e) {
            return new SuccessResponse(EmBizError.UNKNOWN_ERROR.getErrCode());
        }
        return new SuccessResponse(200);
    }

    /**
     * 根据公共id
     * 获取文件列表
     */
    @GetMapping("getAllFileInfoByCommonId")
    @BussinessLog(module = LogType.GET_FILE_LIST)
    @ResponseBody
    public SuccessResponse getAllFileInfoByCommonId(@RequestParam String commonId) {
        LambdaQueryWrapper<FileInfo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(FileInfo::getCommonId, commonId);
        queryWrapper.orderByDesc(FileInfo::getCreateTime);
        List<FileInfo> fileInfos = fileInfoService.list(queryWrapper);
        SuccessResponse sr = new SuccessResponse(200);
        sr.put("fileInfos", fileInfos);
        return sr;
    }

    /**
     * 下载文件
     * @param fileId
     * @param response
     */
    @GetMapping("/download")
    @BussinessLog(module = LogType.DOWNLOAD_FILE)
    public void downloadFile(@RequestParam String fileId, HttpServletResponse response) {
        FileInfo fileInfo = fileInfoService.getById(fileId);
        // 设置文件下载的响应头
        try {
            response.setHeader("Content-Type", "application/octet-stream;charset=utf-8"); // 告诉浏览器输出内容为流
            response.setHeader("Content-Disposition",
                    "attachment;filename=" + URLEncoder.encode(fileInfo.getFileName(), "UTF-8"));;
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        // 获取文件输入流并写入响应
        try (BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(filePath + fileInfo.getFilePath()))) {
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[1024];
            int length;
            while ((length = inputStream.read(buffer))!= -1) {
                outputStream.write(buffer, 0, length);
            }
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
