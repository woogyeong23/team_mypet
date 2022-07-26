package com.jeonju.mypet.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.jeonju.mypet.service.CommunityService;
import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.CommunityVo;

@Controller
public class CommunityController {
	
	private CommunityService commuService;
	
	@Autowired
	public CommunityController (CommunityService commuService) {
		this.commuService = commuService;
	}
	
	@GetMapping("/CBList.do")
	public String CBList(Model model) {
		
		List<CommunityVo> commuList = commuService.getCommuList();
		model.addAttribute("commuList", commuList);
	
		return "Community/CBList";
	}
	
	@GetMapping("/CBInsert.do")
	public String CBInsert() {
		return "Community/CBInsert";
	}
	
	@PostMapping("/CBInsertProcess.do")
	public String CBInsertProcess(@RequestParam("cm_subject") String cm_subject,
			@RequestParam("uploadImg") MultipartFile uploadImg,
			@RequestParam("cm_content") String cm_content, 
			@RequestParam("midx") int midx, 
			@RequestParam("cm_writer") String cm_writer, Model model, HttpServletRequest request) 
					throws IllegalStateException, IOException{
		
		String cm_origin_img = uploadImg.getOriginalFilename();
		
		int dot_idx = cm_origin_img.lastIndexOf(".");
		String fileName1 = cm_origin_img.substring(0, dot_idx);
		String extension = cm_origin_img.substring(dot_idx+1);
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String cm_img = fileName2+"."+extension;
		
		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		String upload_dir = "resources/Community/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		//지정된 경로에 파일 저장
				//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
				String fullPath = realPath+cm_img;
				uploadImg.transferTo(new File(fullPath));
				
				if(cm_subject.length() == 0) cm_subject = null;
				if(cm_content.length() == 0) cm_content= null;
				
				int result=0;//0:입력 실패
				
				CommunityVo communityVo = new CommunityVo();
				communityVo.setCm_subject(cm_subject);
				communityVo.setMidx(midx);
				communityVo.setCm_writer(cm_writer);
			    communityVo.setCm_content(cm_content);
				communityVo.setCm_img(cm_img);
				communityVo.setCm_origin_img(cm_origin_img);
				
				result = commuService.InsertCB(communityVo);
				
				String viewPage = "Community/CBInsert";
				
				if(result == 1) {
					model.addAttribute("subject", cm_subject);
					model.addAttribute("content", cm_content);
					model.addAttribute("writer", cm_writer);
					model.addAttribute("img", cm_img);
					
					viewPage = "Community/InsertCB_result";	
				}

				return viewPage;
	}
	
	
	@GetMapping("/CBView.do")
	public String CBView( @RequestParam("cm_idx") int cm_idx, Model model, HttpServletRequest request) {
		
		CommunityVo communityVo = commuService.getCBView(cm_idx);
		
		List<Commu_CommentVo> ccmList = commuService.getCcmList(cm_idx);
		
		model.addAttribute("communityVo", communityVo);
		model.addAttribute("ccmList", ccmList);
		
		
		return "Community/CBView";
	
	}
	
	 // 이미지 업로드
    // product_edit페이지에서 맵핑되는 메소드
    @RequestMapping("imageUpload.do")
    // 이미지를 저장하고, 불러오고, 업로드하기위해 매개변수를 선언
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
//MultipartFile 타입은 ckedit에서 upload란 이름으로 저장하게 된다
    throws Exception {
    	
    	response.setCharacterEncoding("utf-8");
    	
    	response.setContentType("text/html; charset=utf-8");
    	
    	String fileName = upload.getOriginalFilename();
    	
    	byte[] bytes = upload.getBytes();
    	
    	String uploadPath = "C:\\Users\\MYCOM\\git\\team_mypet\\team_mypet\\src\\main\\webapp\\WEB-INF\\views\\Community\\images";
    	
    	OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
    	
    	// 서버로 업로드
        // write메소드의 매개값으로 파일의 총 바이트를 매개값으로 준다.
        // 지정된 바이트를 출력 스트립에 쓴다 (출력하기 위해서)
        out.write(bytes);
        
     // 클라이언트에 결과 표시
        String callback = request.getParameter("CKEditorFuncNum");
        
     // 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
        PrintWriter printWriter = response.getWriter();
        String fileUrl = request.getContextPath() + "/Community/images/" + fileName;
        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
                + "','이미지가 업로드되었습니다.')" + "</script>");
        printWriter.flush();
    	
    	
    }
	

	
	
	
	
	
	
	
	
	
	
	
}
