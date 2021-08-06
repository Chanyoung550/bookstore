package org.zerock.controller;

import java.io.File;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.PaginationPD;
import org.zerock.domain.SearchPD;
import org.zerock.service.BookStoreService;
import org.zerock.utils.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
   


   @Autowired
   private BookStoreService service;
   
   @Resource(name="uploadPath") //컨트롤러에 servlet-context.xml에서 설정했던 uploadPath를 추가
   private String uploadPath;
   
   
   @GetMapping("/product")
   public String register() {
      return "admin/product";
   }
   
   @GetMapping("/memberList") //회원목록 출력 - paging 처리 및 검색 기능 추가
   public String memberList(Model model
         ,@RequestParam(required = false, defaultValue = "1") int page
         ,@RequestParam(required = false, defaultValue = "1") int range
         ,@RequestParam(required = false, defaultValue = "userID") String searchType
         ,@RequestParam(required = false) String keyword
         )throws Exception {
      
      SearchPD search = new SearchPD(); // paging 객체 생성
      search.setSearchType(searchType); // 전달 받은 searchType 파라미터 입력
      search.setKeyword(keyword); // 전달 받은 keyword 파라미터 입력

      
      int listCnt = service.memberListCnt(search); // paging 처리를 위한 결과 개수 설정
      
      search.pageInfo(page, range, listCnt); // paging 정보 설정
      
      model.addAttribute("pagination", search);  // model 이용 View로 paging 정보 전달 
      model.addAttribute("list", service.memberList(search)); // model 이용 View로 출력 List 정보 전달 
      
      
      return "admin/memberList";
   }
   
   @GetMapping("/orderList") // 주문목록 출력 - paging 처리 및 검색 기능 추가
   public String orderList(Model model
         ,@RequestParam(required = false, defaultValue = "1") int page
         ,@RequestParam(required = false, defaultValue = "1") int range
         ,@RequestParam(required = false, defaultValue = "orderNum") String searchType
         ,@RequestParam(required = false) String keyword
         )throws Exception {
      
      SearchPD search = new SearchPD();
      search.setSearchType(searchType);
      search.setKeyword(keyword);
      
      int listCnt = service.orderListCnt(search);
      
      search.pageInfo(page, range, listCnt);
      
      model.addAttribute("pagination", search);   
      model.addAttribute("list", service.orderList(search));
      
      return "admin/orderList";
   }
   
  
   @GetMapping("/productList") // 도서리스트 출력 - paging 처리 및 검색 기능 추가
   public String list(Model model
         ,@RequestParam(required = false, defaultValue = "1") int page
         ,@RequestParam(required = false, defaultValue = "1") int range
         ,@RequestParam(required = false, defaultValue = "title") String searchType
         ,@RequestParam(required = false) String keyword
         )throws Exception {
      
      SearchPD search = new SearchPD();
      search.setSearchType(searchType);
      search.setKeyword(keyword);
      
      //전체 게시글 개수
      int listCnt = service.productListCnt(search);
      
      //Pagination 객체생성
      
      search.pageInfo(page, range, listCnt);
      
      model.addAttribute("pagination", search);
      model.addAttribute("list", service.productList(search));
      
      log.info(search);
      return "admin/productList";
   }
   
   
   
   @PostMapping("/bregister") // 도서 등록 - 북커버 이미지 저장 기능 추가( MultipartFile file 사용 )
   public String register(Bs_BookVO vo, MultipartFile file) throws   Exception {
      
      
      log.info(file.getOriginalFilename());
      
      String imgUploadPath = uploadPath + File.separator + "imgUpload";
      String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
      String fileName = null;
      
      if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
         fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
      } else {
         fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
      }
      
      //파일용 인풋박스에 등록된 파일의 정보를 가져오고, UploadFileUtils.java를 통해 폴더를 생성한 후 원본 파일과 썸네일을 저장한 뒤
      //이 경로를 데이터 베이스에 전하기 위해 Bs_BookVO에 입력(set)
      vo.setBk_pictureUrl(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
      vo.setBk_thumbUrl(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
      
      service.register(vo);
      
      return "redirect:productList";
   }
   
   // 도서 재고 추가 ajax
   @RequestMapping(value = "/stockAdd", method = RequestMethod.GET) 
   @ResponseBody
   public void stockAdd(@RequestParam("stockAdd") int stockAdd,
                  @RequestParam("bk_num") int bkNum) throws   Exception  {
      
      
       
      log.info(stockAdd);
      log.info(bkNum);
      
      // 재고추가 - 전달 받은 도서번호 및 재고추가개수 사용 
      service.stockAdd(stockAdd, bkNum);
       
    
      
   }
   
   // 배송 확인 ajax
   @RequestMapping(value = "/delivery", method = RequestMethod.GET) 
   @ResponseBody
   public void delivery(@RequestParam("cNum") int cNum,
                  @RequestParam("oNum") int oNum) throws Exception  {
      
      
       
      log.info(cNum);
      log.info(oNum);
      
      // 0 - 배송준비(기본값) / 1 - 배송중 / 2 - 배송완료
      // 기본적으로 화면에는 0(배송준비)상태이며 사용자가 버튼 클릭시 이벤트 발생
      // 동시에 기본값인 '0'이 파라미터로 전달되고 if 로직을 통하여 '1'로 데이터베이스 저장 -> 이후 화면은 1(배송중) 상태로 변경 
      if(cNum == 0) {
         cNum++;
         service.delivery(cNum, oNum);
      }else if(cNum == 1) {
         cNum++;
         service.delivery(cNum, oNum);
      } 
      
   }
   
   // 도서리스트 도서 삭제
   @RequestMapping(value = "/delBook", method = RequestMethod.GET) 
   @ResponseBody
   public void delivery(@RequestParam("bk_num") int bkNum) throws Exception  {
      
      
       
      log.info(bkNum);
      // 도서번호를 전달 받고 도서삭제
      service.delBook(bkNum);
   
      
   }
   

   
   
}
   
 
