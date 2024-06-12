package com.moshu.trainplatform.utils.pdf;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class PdfUtil {

    private static String fileTemporaryPath;

    @Value("${file_temporary_path}")
    public void setFileTemporaryPath(String fileTemporaryPath) {
        PdfUtil.fileTemporaryPath = fileTemporaryPath;
    }

    private static BaseFont baseFont;

    private static Font titleFont;

    private static Font contentFont;

    /**
     * 字体初始化
     */
    public static void fontInitialize() {
        try {
            baseFont = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
            // 标题
            titleFont = new Font(baseFont, 7, Font.NORMAL);
            titleFont.setColor(BaseColor.BLACK);
            // 内容
            contentFont = new Font(baseFont, 6, Font.NORMAL);
            contentFont.setColor(BaseColor.BLACK);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}