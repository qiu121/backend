package com.moshu.trainplatform.utils.pdf;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

public class PdfReportM1HeaderFooter extends PdfPageEventHelper {

    /**
     * 文档字体大小，页脚页眉最好和文本大小一致
     */
    public int presentFontSize = 9;

    public PdfTemplate pdfTemplate;
    // 基础字体对象
    public BaseFont bf = null;

    // 利用基础字体生成的字体对象，一般用于生成中文文字
    public Font fontDetail = null;


    /**
     * TODO 文档打开时创建模板
     *
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onOpenDocument(com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onOpenDocument(PdfWriter writer, Document document) {
        pdfTemplate = writer.getDirectContent().createTemplate(100, 20);// 共 页 的矩形的长宽高
    }


    /**
     * TODO 关闭每页的时候，写入页眉，写入'第几页共'这几个字。
     *
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onEndPage(com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onEndPage(PdfWriter writer, Document document) {
        try {
            bf = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", false);
            fontDetail = new Font(bf, presentFontSize, Font.NORMAL);// 数据体字体
            // 1.写入页眉
            ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_LEFT, new Phrase("润通航运服务有限公司", fontDetail), document.left(), document.top() + 10, 0);
            // 2.写入前半部分的 第 X页/共
            int pageS = writer.getPageNumber();
            String foot1 = "第 " + pageS + " 页 /共";
            Phrase footer = new Phrase(foot1, fontDetail);
            // 3.计算前半部分的foot1的长度，后面好定位最后一部分的'Y页'这俩字的x轴坐标，字体长度也要计算进去 = len
            float len = bf.getWidthPoint(foot1, presentFontSize);
            // 4.拿到当前的PdfContentByte
            PdfContentByte cb = writer.getDirectContent();
            // 5.写入页脚1，x轴就是(右margin+左margin + right() -left()- len)/2.0F 再给偏移20F适合人类视觉感受，否则肉眼看上去就太偏左了 ,y轴就是底边界-20,否则就贴边重叠到数据体里了就不是页脚了；注意Y轴是从下往上累加的，最上方的Top值是大于Bottom好几百开外的。
            ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, footer, (document.rightMargin() + document.right() + document.leftMargin() - document.left() - len) / 2.0F + 20F, document.bottom() - 15, 0);
            // 6.写入页脚2的模板（就是页脚的Y页这俩字）添加到文档中，计算模板的和Y轴,X=(右边界-左边界 - 前半部分的len值)/2.0F + len ， y 轴和之前的保持一致，底边界-20
            cb.addTemplate(pdfTemplate, (document.rightMargin() + document.right() + document.leftMargin() - document.left()) / 2.0F + 20F, document.bottom() - 15); // 调节模版显示的位置

            PdfContentByte waterMar = writer.getDirectContentUnder();
            waterMar.beginText();
            // 7、生成水印
            // 设置水印透明度
            PdfGState gs = new PdfGState();
            // 设置填充字体不透明度为0.4f
            gs.setFillOpacity(0.2f);
            // 设置水印字体参数及大小                                  (字体参数，字体编码格式，是否将字体信息嵌入到pdf中（一般不需要嵌入），字体大小)
            waterMar.setFontAndSize(bf, 60);
            // 设置透明度
            waterMar.setGState(gs);
            // 设置水印对齐方式 水印内容 X坐标 Y坐标 旋转角度
            waterMar.showTextAligned(Element.ALIGN_RIGHT, "润通航运服务有限公司", 550, 600, 45);
            // 设置水印颜色
            waterMar.setColorFill(BaseColor.GRAY);

            waterMar.endText();
            waterMar.stroke();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * TODO 关闭文档时，替换模板，完成整个页眉页脚组件
     *
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onCloseDocument(com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onCloseDocument(PdfWriter writer, Document document) {
        try {
            // 7.最后一步了，就是关闭文档的时候，将模板替换成实际的 Y 值,至此，page x of y 制作完毕，完美兼容各种文档size。
            pdfTemplate.beginText();
            pdfTemplate.setTextMatrix(0, 0);
            pdfTemplate.setFontAndSize(bf, presentFontSize);// 生成的模版的字体、颜色
            String foot2 = " " + (writer.getPageNumber()) + " 页";
            pdfTemplate.showText(foot2);// 模版显示的内容
            pdfTemplate.endText();
            pdfTemplate.closePath();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
