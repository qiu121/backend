package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.moshu.trainplatform.entity.Conference;
import com.moshu.trainplatform.entity.ModuleAttachment;
import com.moshu.trainplatform.service.ConferenceService;
import com.moshu.trainplatform.service.ModuleAttachmentService;
import com.moshu.trainplatform.service.common.CommonService;
import com.moshu.trainplatform.template.IResponse;
import com.moshu.trainplatform.template.SuccessResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;


/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/22
 */
@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/conference")
public class ApiConferenceController {

    @Value("${file.location}")
    private String fileLocation;

    private final ConferenceService conferenceService;

    private final ModuleAttachmentService moduleAttachmentService;

    /**
     * 查询所有会议
     *
     * @return Response
     */
    @GetMapping("/get")
    public SuccessResponse getAll() {

        List<Conference> conferences = conferenceService.list();

        // 将有关的附件一并查询返回
        List<Conference> conferenceList = conferences.stream()
                .peek(conference -> {
                    LambdaQueryWrapper<ModuleAttachment> wrapper = new LambdaQueryWrapper<>();
                    wrapper.eq(ModuleAttachment::getPId, conference.getId());
                    List<ModuleAttachment> moduleAttachmentList = moduleAttachmentService.list(wrapper);
                    conference.setModuleList(moduleAttachmentList);
                }).collect(Collectors.toList());

        SuccessResponse response = new SuccessResponse(200);
        response.put("result", conferenceList);
        return response;

    }

    /**
     * 根据 id 查询
     *
     * @param ids id数组
     * @return R
     */
    @GetMapping("/getRewardById")
    public SuccessResponse getById(@RequestParam List<String> ids) {
        SuccessResponse sr = new SuccessResponse(200);
        sr.put("result", conferenceService.listByIds(ids));
        return sr;
    }


    /**
     * 删除会议
     *
     * @param id 会议id
     * @return
     */
    @DeleteMapping("/del/{id}")
    public SuccessResponse del(@PathVariable String id) {
        boolean remove = conferenceService.removeById(id);
        // FIXME 不管是否操作成功，一律返回200？？？(操作成功前端联调标识)
        SuccessResponse response = new SuccessResponse(200);
        response.put("result", remove);
        return response;
    }

    /**
     * 更新 会议
     *
     * @param conference
     * @return
     */
    @PutMapping("/update")
    public SuccessResponse update(@RequestBody Conference conference) {
        boolean remove = conferenceService.updateById(conference);
        SuccessResponse response = new SuccessResponse(200);
        response.put("result", remove);
        return response;

    }

    /**
     * 新增会议
     *
     * @param conference
     * @return
     */
    @PostMapping("/add")
    public SuccessResponse add(@RequestBody Conference conference) {
        String conferenceId = UUID.randomUUID().toString();
        conference.setId(conferenceId);
        conferenceService.save(conference);
        return new SuccessResponse(200);
    }

    // @PostMapping("/upload")
    // public SuccessResponse upload(@RequestParam("file") MultipartFile file, String name, String pId) throws BizException {
    //
    //
    //     String fileLocation = "src/main/resources/upload";
    //     String fileName = file.getOriginalFilename();
    //     String dbPath = File.separator + fileName;
    //
    //     String absoluteFilePath = fileLocation + File.separator + "conference" + File.separator + pId + dbPath;
    //     CommonService.saveFile(file, absoluteFilePath);
    //     return new SuccessResponse(200);
    // }

    /**
     * 上传附件
     *
     * @param file 文件
     * @param name 文件名称
     * @param pId  关联对象ID
     * @return R
     * @throws Exception
     */
    @PostMapping("/upload")
    public IResponse uploadCourseCover(@RequestParam("file") MultipartFile file, String name, String pId) throws Exception {

        // 0.prepare path
        String fileName = file.getOriginalFilename();
        // /xx.jpg
        String dbPath = File.separator + fileName;
        ModuleAttachment attachment = new ModuleAttachment();
        attachment.setId(UUID.randomUUID().toString());
        attachment.setName(name);
        attachment.setPId(pId);
        attachment.setUrl(fileName);
        attachment.setType("conference");
        moduleAttachmentService.save(attachment);
        // /home/user/files/xxx.jpg
        String absoluteFilePath = fileLocation + File.separator + "conference" + File.separator + pId + dbPath;
        CommonService.saveFile(file, absoluteFilePath);
        SuccessResponse sr = new SuccessResponse(200);
        sr.put("result", fileName);
        return sr;
    }

    /**
     * 移除附件
     *
     * @param moduleAttachment 附件类
     * @return R
     */
    @DeleteMapping("/delAttachment")
    public SuccessResponse delAttachment(@RequestBody ModuleAttachment moduleAttachment) {
        SuccessResponse sr = new SuccessResponse(200);

        String id = moduleAttachment.getId();
        String pId = moduleAttachment.getPId();
        String url = moduleAttachment.getUrl();
        String absoluteFilePath = fileLocation + File.separator + "conference" + File.separator + pId + File.separator + url;
        File file = new File(absoluteFilePath);
        boolean remove = moduleAttachmentService.removeById(id);
        boolean delete = file.delete();

        log.error("remove:{}", remove);
        log.error("delete:{}", delete);

        return sr;
    }

}
