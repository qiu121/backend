package com.github.qiu121.library.service.common;

import com.github.qiu121.library.constant.exception.BizException;
import com.github.qiu121.library.constant.exception.EmBizError;
import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;


public class CommonService {
    public static void saveFile(MultipartFile file, String filePath) throws BizException {
        File staticFile = new File(filePath);
        staticFile.getParentFile().mkdirs();
        try (InputStream inputStream = file.getInputStream();
             OutputStream fileOutputStream = new FileOutputStream(staticFile)) {
            if (staticFile.getParentFile() != null || !staticFile.getParentFile().isDirectory()) {
                IOUtils.copy(inputStream, fileOutputStream);
            }
        } catch (IOException ex) {
            throw new BizException(EmBizError.FILE_UPLOAD_ERROR, EmBizError.FILE_UPLOAD_ERROR.getErrMsg());
        }
    }
}
