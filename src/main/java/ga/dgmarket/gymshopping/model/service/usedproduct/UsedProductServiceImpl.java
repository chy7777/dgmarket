package ga.dgmarket.gymshopping.model.service.usedproduct;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;
import ga.dgmarket.gymshopping.domain.UsedProductImg;
import ga.dgmarket.gymshopping.domain.UsedTag;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.exception.UploadException;
import ga.dgmarket.gymshopping.model.common.file.FileManager;
import ga.dgmarket.gymshopping.model.repository.usedproduct.MybatisUsedTagDAO;
import ga.dgmarket.gymshopping.model.repository.usedproduct.UsedProductDAO;
import ga.dgmarket.gymshopping.model.repository.usedproduct.UsedProductImgDAO;

@Service
public class UsedProductServiceImpl implements UsedProductService{

	@Autowired
	private UsedProductDAO usedProductDAO;
	@Autowired
	private UsedProductImgDAO usedProductImgDAO;
	@Autowired
	private MybatisUsedTagDAO mybatisUsedTagDAO;
	@Autowired
	private FileManager fileManager;

	//중고거래 상품을 등록. 상품만을 등록 외에도 사진, Tag도 insert 해야됨 
	//매개변수 1[usedProduct].중고상품 정보가 담겨있는 usedProduct 객체
	//매개변수 2[context].파일의 경로를 가져올 수 있는 context
	//매개변수 3[multipartFiles].등록할 이미지들이 담겨있는 객체를 담은 List
	//매개변수 4[tags].등록할 tag들이 담겨있는 List
	//from.성일
	public void regist(HttpServletRequest request, UsedProduct usedProduct) throws DMLException, UploadException{
		
		//상품을 먼저 insert 상품을 넣으면서 생기는 id를 리턴 받고 그 값을 이용해 img와, tag들 DB에 넣기
		ServletContext context = request.getServletContext();
		UsedProduct result = usedProductDAO.insert(usedProduct);
		System.out.println("used_product_id : "+result.getUsed_product_id());
		
		//이미지 배열에 담아서 돌리기
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		MultipartFile mainImg = usedProduct.getMainImg();
		MultipartFile subImg = usedProduct.getSubImg();
		if(mainImg.getOriginalFilename() != null && mainImg.getOriginalFilename() != "") multipartFiles.add(mainImg);
		if(subImg.getOriginalFilename() != null && subImg.getOriginalFilename() != "") multipartFiles.add(subImg);
		
		for(int i = 0; i < multipartFiles.size(); i++) {
			MultipartFile multipartFile = multipartFiles.get(i);
			String filename = fileManager.saveFile(context, multipartFile, "used/product/img"); //여기서 새로 저장될 파일명을 반환하고 그 파일명을 디비에 넣어야 함
			UsedProductImg usedProductImg = new UsedProductImg(); //VO 채워 넣기
			usedProductImg.setUsed_product_id(result.getUsed_product_id());
			usedProductImg.setUsed_img(filename);
			usedProductImg.setUsed_img_index(i);
			
			usedProductImgDAO.insert(usedProductImg); //디비에 넣기
		}
		//태그 디비에 넣기
		String tag = usedProduct.getTag();
		String[] tags = tag.split(",");
		for(String obj : tags) {
			UsedTag usedTag = new UsedTag();
			usedTag.setUsed_product_id(result.getUsed_product_id());
			usedTag.setTag_name(obj);
			mybatisUsedTagDAO.insert(usedTag);
		}
		System.out.println("등록 완료");
	}
	
	//메인 화면에 보여줄 상품들을 조회하기
	//세션에 있는 member_id을 통해 조회할 예정
	public List selectAll(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member mem = (Member)session.getAttribute("member");
		return usedProductDAO.selectAll(mem.getMember_id());
	}	
	
	//키워드를 통해 각기 다른 결과 반환
	//두번 째 매개변수로 넘어온 [type]에 따라 검색 조건이 달라지며,
	//세번 째 매개변수로 넘어온 [keyword] 가 검색하는 키가 됨.  from.성일
	public List selectByKeyword(HttpServletRequest request, String type, String keyword) {
		//현재 세션에 있는 멤버 id 구해오기
		HttpSession session  = request.getSession();
		Member member = (Member)session.getAttribute("member");
		int member_id = member.getMember_id();
		
		List<UsedProductExtend> list = null;
		UsedProductExtend productExtend = null;
		UsedTag usedTag = null;
		
		switch(type) {
			case "product_name": //상품명으로 검색했을 때
				productExtend = new UsedProductExtend();
				productExtend.setUsed_product_name(keyword);
				productExtend.setMember_id(member_id);
				
				list = usedProductDAO.selectByProductName(productExtend);
				break;
				
			case "tag_name": //태그명으로 검색했을 때
				usedTag = new UsedTag();
				usedTag.setUsed_product_id(member_id);
				usedTag.setTag_name(keyword);
				list = usedProductDAO.selectByTagName(usedTag);
				break;
				
			case "store_name": //상점이름으로 검색했을 때
				productExtend = new UsedProductExtend();
				productExtend.setStorename(keyword);
				productExtend.setMember_id(member_id);
				
				list = usedProductDAO.selectByStoreName(productExtend);
				break;
				
			case "store_id": //상점 id로 검색했을 때
				productExtend = new UsedProductExtend();
				productExtend.setStorename(keyword); //원래라면 store_id를 넣어줘야 됐지만 꼼수 씀...
				productExtend.setMember_id(member_id);
				
				list = usedProductDAO.selectByStoreId(productExtend);
				
				break;
				
			case "max_price": //최대 금액으로 검색했을 때
				productExtend = new UsedProductExtend();
				productExtend.setUsed_product_price(Integer.parseInt(keyword));
				productExtend.setMember_id(member_id);
				
				list = usedProductDAO.selectByMaxPrice(productExtend);
				break;
				
			case "min_price": //최소 금액으로 검색 했을 때 
				productExtend = new UsedProductExtend();
				productExtend.setUsed_product_price(Integer.parseInt(keyword));
				productExtend.setMember_id(member_id);
				
				list = usedProductDAO.selectByMinPrice(productExtend);
				break;
		}
		return list;
	}
	
	//현재 사용자가 찜한 상품 목록 보기
	public List selectByFavorites(int member_id){
		return usedProductDAO.selectByFavorites(member_id);
	}
	
	//상품의 상세보기 요청을 했을 때
	//used_product+storename+favorites_id+tag 꺼내오기
	//product_img 가져오기
	// 가져오기
	//favorites[count] 가져오기
	@Override
	public Map getDetail(HttpServletRequest request, int used_product_id) {
		
		UsedProductExtend productExtend = new UsedProductExtend();
		Member member = (Member)request.getSession().getAttribute("member");
		
		productExtend.setMember_id(member.getMember_id());
		productExtend.setUsed_product_id(used_product_id);
		
		//맵에 담을 애들
		UsedProductExtend usedProductExtend = usedProductDAO.getDetail(productExtend); //상품정보+찜 정보 가져오기
		UsedFavorites usedFavorites =usedProductDAO.getFavoritesCount(used_product_id); //찜 갯수가져오기
		List<UsedProductImg> imgList = usedProductImgDAO.getProductImg(used_product_id);//이미지 가져오기
		
		sessionAddProduct(request, imgList.get(0)); //세션에 방금 본 상품의 정보 담기
		
		addSessionProduct(request, imgList.get(0)); //세션에 상품 정보 넣기		
		
		List<UsedTag> tagList = usedProductDAO.getProductTag(used_product_id);//태그 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usedProductExtend", usedProductExtend);
		map.put("usedFavorites", usedFavorites);
		map.put("imgList", imgList);
		map.put("tagList", tagList);
		
		
		return map;
	}
	
	//사용자가 제품 상세보기를 했을 때 세션에 상품 정보 담아두기!
	public void sessionAddProduct(HttpServletRequest request, UsedProductImg obj) {
		HttpSession session = request.getSession();	
		String img1 = (String) session.getAttribute("img1");
		String img2 = (String) session.getAttribute("img2");
		String img3 = (String) session.getAttribute("img3");
		String img = obj.getUsed_img();
		int id = obj.getUsed_product_id();
		
		if(img1 == null || img1 == "") { //첫번째 이미지가 비었다면 채워주기
			session.setAttribute("img1", img); //이미지
			session.setAttribute("id1", id); //이미지 클릭 시 상품 상세보기로 이동할 id
		}else if(img2 == null || img2 == "") { //두 번째 이미지가 비었다면 채워주기
			//이미 들어있는 이미지가 중복되지 않을 때만 이미지 넣기
			if(!img1.equals(img)) {
				session.setAttribute("img2", img);
				session.setAttribute("id2", id);
			}
		}else if(img3 == null || img3 == "") { //세 번째 이미지가 비었다면 채워주기
			if(img1.equals(img)) { //만약 맨 밑 이미지가 지금 가져온 이미지와 같다면 위로 올려주기
				session.setAttribute("img1", session.getAttribute("img2"));
				session.setAttribute("id1", session.getAttribute("id2"));
				
				session.setAttribute("img2", img);
				session.setAttribute("id2", id);
			}else if(img2.equals(img)) { //이미 있는 이미지가 맨 위라면 아무 동작 ㄴㄴ
			}else { //이미지가 중복 되지 않는다면 맨 위로 올리기
				session.setAttribute("img3", img);
				session.setAttribute("id3", id);
			}
		}else { //꽉 찼다면 채워주기
			if(img3.equals(img)) { //이미 이미지가 가장 위에 있다면 아무 작업 하지 않기
			}else if(img2.equals(img)) { //이미지가 2번째에 이미 있다면 3번째와 교체
				session.setAttribute("img2", session.getAttribute("img3"));
				session.setAttribute("id2", session.getAttribute("id3"));
				
				session.setAttribute("img3", img);
				session.setAttribute("id3", id);
			}else if(img1.equals(img)) {
				session.setAttribute("img1", session.getAttribute("img2"));
				session.setAttribute("id1", session.getAttribute("id2"));
				
				session.setAttribute("img2", session.getAttribute("img3"));
				session.setAttribute("id2", session.getAttribute("id3"));
				
				session.setAttribute("img3", img);
				session.setAttribute("id3", id);
			}else {
				session.setAttribute("img1", session.getAttribute("img2"));
				session.setAttribute("img2", session.getAttribute("img3"));
				session.setAttribute("img3", img);
				
				session.setAttribute("id1", session.getAttribute("id2"));
				session.setAttribute("id2", session.getAttribute("id3"));
				session.setAttribute("id3", id);
				
			}
		}
	}
	
	//제품 상세보기를 할 때 최근 본 목록을 처리하는 메서드
	public void addSessionProduct(HttpServletRequest request, UsedProductImg productImg){
		HttpSession session = request.getSession();
		List<Map> historyList = null;
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("used_product_id", Integer.toString(productImg.getUsed_product_id()));
		map.put("used_img", productImg.getUsed_img());
		
		//만약에 세션에 historyList가 없다면 생성하고 있다면 받아오자
		 if((List)session.getAttribute("historyList") == null) {
			 historyList  = new ArrayList<Map>();
		 }else {
			 historyList = (List)session.getAttribute("historyList");
		 }
		 
		 //최근 본 상품은 3개 까지 조회 가능하게 만들 것이므로, 배열의 길이가 3보다 작으면 그냥 add하고
		 //3보다 같거나 크다면 첫번 째 값을 지우고 add하자
		 if(historyList.size() < 3) {
			 historyList.add(map);
		 }else {
			 historyList.remove(0);
			 historyList.add(map);
		 }
		 session.setAttribute("historyList", historyList);
	}
	

	/*상품 한 건 삭제를 처리하는 서비스
	상품이미지 삭제[디비, 파일]
	상품태그삭제
	상품찜
	상품주문삭제*/
	public void delete(HttpServletRequest request, int used_product_id) {
		//세션에 상품이 들어있다면 삭제
		HttpSession session = request.getSession();
		if((int)session.getAttribute("id1") == used_product_id) {
			session.setAttribute("id1", null);
			session.setAttribute("img1", null);
		}else if((int)session.getAttribute("id2") == used_product_id) {
			session.setAttribute("id2", null);
			session.setAttribute("img2", null);
		}else if((int)session.getAttribute("id3") == used_product_id) {
			session.setAttribute("id3", null);
			session.setAttribute("img3", null);
		}
		
		
		
		ServletContext context = request.getServletContext();
		
		//이미지 삭제처리 [폴더 내의 이미지 삭제]
		List<UsedProductImg> imgList = usedProductImgDAO.getProductImg(used_product_id);
		for(UsedProductImg productImg : imgList) {
			File file = new File(context.getRealPath("/resources/data/used/product/img/")+productImg.getUsed_img());
			if(file.delete()) {
				System.out.println("이미지 삭제 완료 : "+productImg.getUsed_img());
			}else {
				System.out.println("이미지 삭제 실패 : "+productImg.getUsed_img());
			}
		}
		
		//상품 이미지 삭제
		usedProductImgDAO.delete(used_product_id);
		//상품 태그 삭제
		mybatisUsedTagDAO.delete(used_product_id);
		//상픔 찜 정보 삭제
		usedProductDAO.deleteFavorites(used_product_id);
		//상품 삭제
		usedProductDAO.deleteProduct(used_product_id);	
	}

	//상품의 상태를 판매완료로 변경함
	public void soldout(HttpServletRequest request, int used_product_id) {
		usedProductDAO.soldout(used_product_id);
	}
	
	//상품 찜하기
	public int addFavorites(HttpServletRequest request, UsedFavorites usedFavorites) throws DMLException{
		return usedProductDAO.insertFavorites(usedFavorites);
	}
	
	//찜 한 건 삭제하기
	public void delFavorites(HttpServletRequest request, int used_favorites_id) throws DMLException{
		usedProductDAO.deleteFavoritesOne(used_favorites_id);
	}

	//메인화면에 나올 최신순위 4개 리스트 from.도균
	public List selectMainList() {
		return usedProductDAO.selectMainList();
	}
}














