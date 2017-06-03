package controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.Consts;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.utils.Const;
import controller.utils.DateDeserializer;
import controller.utils.HttpResponse;
import domain.BeautyTip;
import domain.BeautyTipCategory;
import domain.Customer;

@Controller
@RequestMapping("beautyTip")
public class BeautyTipController {

	private final String loadPath = "http://localhost:8080/BeautyMate/resources/img/save/"; //불러오는 곳에..
	
	@RequestMapping(value = "showDetail.do", method = RequestMethod.GET)
	public String beautyTipShowDetail(int beautyTipNo, Model model) throws ClientProtocolException, IOException {

		String url = Const.getOriginpath() + "beautyTip/find/id/" + beautyTipNo;// get

		// apache lib
		HttpGet httpGet = new HttpGet(url); // <-> HttpPost

		// HttpClient
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// os에 붙음
		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로

		// 상태코드확인
		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		// 내용을 json으로 받는다(stream으로)
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		// 상태체크해서 처리 해줘야 됨
		// System.out.println(responseStatusCode);

		// json(String) to object
		// gson lib
		// TypeToken은 생성자가 없기 때문에 바로 {}닫아 줌

		TypeToken<BeautyTip> typeToken = new TypeToken<BeautyTip>() {
		};

		// java.lang.reflect.type, import
		Type type = typeToken.getType();

		// 객체에 Date타입 필드가 있는 경우
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.registerTypeAdapter(Date.class, new DateDeserializer());
		BeautyTip beautyTip = gsonBuilder.create().fromJson(responseContent, type);

		// BeautyTip beautyTip = new Gson().fromJson(responseContent, type);

		model.addAttribute("beautyTip", beautyTip); // 이안에 이미 매퍼에서 받아온 댓글들이
													// 들어있어야 함

		//
		response.close();
		httpClient.close();

		return "/beautyTip/detail.jsp";
	}

	@RequestMapping(value = "registForm.do", method = RequestMethod.GET)
	public String beautyTipRegistForm(HttpSession session) {

		// session체크(로그인)

		//
		return "redirect:/beautyTip/registForm.jsp";
	}

	@RequestMapping(value = "regist.do", method = RequestMethod.POST)
	public String beautyTipRegist(HttpServletRequest request)
			throws ClientProtocolException, IOException {

		String url = Const.getOriginpath() + "beautyTip/insert";

		//이미지, 제목, 컨텐츠 셋팅..
		BeautyTip beautyTip = upImg(request);
		//beautyTip.setVideo(this.upVideo(request));

		//
		beautyTip.setCategory(BeautyTipCategory.makeupInformation); // 선택..s
		//beautyTip.setVideo("vvv");
		
		//
		beautyTip.setCustomer(new Customer(1)); // session에서

		// form태그로 완성된 객체가 옴
		// req, jsp에서 받아온 값으로 beautyTip객체 생성
		// BeautyTip beautyTip = new BeautyTip(0, "cbeautyTipTitle", "cimage",
		// "cbeautyTipContent", "cvideo",
		// new Customer(1, "cid", "cpassword", "cname", "m", null, "email",
		// null),
		// BeautyTipCategory.makeupInformation, null);

		//
		HttpPost httpPost = new HttpPost(url);
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// form(데이터) 집어넣어서 보내기
		// user객체를 json으로..
		StringEntity entity = new StringEntity(new Gson().toJson(beautyTip), Consts.UTF_8); // throw
		httpPost.setEntity(entity);
		httpPost.setHeader("Content-type", "application/json"); // data가
																// json이다(os에
																// noti)

		CloseableHttpResponse response = httpClient.execute(httpPost); // throw

		int responseStatus = HttpResponse.getInstance().getResponseStatus(response);
		String responseContent = HttpResponse.getInstance().getResponseContent(response);
		// System.out.println(responseStatus);

		// true/false

		//
		response.close();
		httpClient.close();

		// // 이전페이지(form jsp)에서 넘어온 값으로 BeautyTipCategory를 지정
		// String category = ;
		// category = "makeupInformation"; // 나중에 jsp완성되면 지울 정보
		return "redirect:/beautyTip/list.do?category=" + beautyTip.getCategory();
	}

	private BeautyTip upImg(HttpServletRequest request) {

		String beautyTipTitle = null;
		String beautyTipContent = null;
		String imgStr = "";
		List<String> imgStrList = new ArrayList<>();
		String vStr = "";

		//String imagePath = "c:\\yorizori";
		//String imagePath = "http://localhost:8080/BeautyMate/resources/img/save";
		//C:\\Users\\kosta\\workSpace(final)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\BeautyMateSub\\resources\\img\\save
		//String imagePath = "C:\\Users\\kosta\\git\\finalSub\\BeautyMateSub\\WebContent\\resources\\img\\save";
		
		//이클립스에서 새로고침해야 반영되는 이유
		//이클립스가 소스변겨잉 감지 되면 자동으로 톰캣 배포 경로로 소스를 복사(배포) -> 배포경로에서 소스 실행
		//실제 톰캣 배포 경로..
		String savePath = "C:\\Users\\kosta\\workSpace(final)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\BeautyMateSub\\resources\\img\\save";
		int fileSize = 50 * 1024 * 1024; //50mb 
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, fileSize, "utf-8",
					new DefaultFileRenamePolicy());

			
			Enumeration<Object> params = multi.getParameterNames();

			while (params.hasMoreElements()) {
				String name = (String) params.nextElement();
				if (name.equals("beautyTipTitle")) {
					beautyTipTitle = multi.getParameter(name);
				} else if (name.equals("beautyTipContent")) {
					beautyTipContent = multi.getParameter(name);
				}
			}

			int fileIdx = 0;
			Enumeration<Object> fileParams = multi.getFileNames();
			while (fileParams.hasMoreElements()) {
				String name = (String) fileParams.nextElement();
				String value = multi.getFilesystemName(name);
				String contentType = multi.getContentType(name);
				
				System.out.println(contentType);
				
				if(contentType.equals("image/jpg") || contentType.equals("image/png")){
					imgStrList.add(value);
				}else{ // video/mp4
					vStr = value;
				}
				
				/*if(fileIdx++ == 0){
					imgStr = value;
				}
				else{
					vStr = value;
				}*/
				
				//String contentType = multi.getContentType(name);
				//imgStr += contentType;

			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//불러올 경로(db저장 경로)
		//String loadPath = "http://localhost:8080/BeautyMate/resources/img/save/"; //불러오는 곳에..
		//파일이름붙이기..(중복된 파일이름의 경우 자동으로 1, 2, 3..의 숫자를 붙여준다.
		String imgPath = "";
		for(String s : imgStrList){
			System.out.println(s);
			
			imgPath += s + "§"; //구분자, ㅁ4
		}
		imgPath = imgPath.substring(0, imgPath.length() - 1);
		
		System.out.println(imgPath);
		
		String vPath = loadPath + vStr;
		
		
		//
		BeautyTip beautyTip = new BeautyTip();//0, beautyTipTitle, imgPath, beautyTipContent, "vv", new Customer(1), BeautyTipCategory.makeupInformation, null);
		beautyTip.setBeautyTipNo(0);
		beautyTip.setBeautyTipContent(beautyTipContent);
		beautyTip.setBeautyTipTitle(beautyTipTitle);
		beautyTip.setImage(imgPath);
		beautyTip.setVideo(vPath);
		
		return beautyTip;
	}
	
	private String upVideo(HttpServletRequest request) {

		String video = "";
		
		//이클립스에서 새로고침해야 반영되는 이유
		//이클립스가 소스변겨잉 감지 되면 자동으로 톰캣 배포 경로로 소스를 복사(배포) -> 배포경로에서 소스 실행
		//실제 톰캣 배포 경로..
		String vSavePath = "C:\\Users\\kosta\\workSpace(final)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\BeautyMateSub\\resources\\video";
		int vFileSize = 10 * 1024 * 1024; //10mb 
		try {
			MultipartRequest multi = new MultipartRequest(request, vSavePath, vFileSize, "utf-8",
					new DefaultFileRenamePolicy());

			Enumeration<Object> fileParams = multi.getFileNames();
			while (fileParams.hasMoreElements()) {
				String name = (String) fileParams.nextElement();
				String value = multi.getFilesystemName(name);
				video = value;
				//String contentType = multi.getContentType(name);

			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//불러올 경로(db저장 경로)
		String vPath = "http://localhost:8080/BeautyMate/resources/video/";
		//파일이름붙이기..(중복된 파일이름의 경우 자동으로 1, 2, 3..의 숫자를 붙여준다.
		vPath += video;
		
		//
		return vPath;
	}

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String beautyTipList(BeautyTipCategory category, Model model) throws ClientProtocolException, IOException {

		// findAll
		String url = Const.getOriginpath() + "beautyTip/find/category/" + category;// get

		// apache lib
		HttpGet httpGet = new HttpGet(url); // <-> HttpPost

		// HttpClient
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// os에 붙음
		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로

		// 상태코드확인
		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		// 내용을 json으로 받는다(stream으로)
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		// 상태체크해서 처리 해줘야 됨
		// System.out.println(responseStatusCode);

		// json(String) to object
		// gson lib
		// TypeToken은 생성자가 없기 때문에 바로 {}닫아 줌
		TypeToken<List<BeautyTip>> typeToken = new TypeToken<List<BeautyTip>>() {
		};

		// java.lang.reflect.type, import
		Type type = typeToken.getType();

		// 객체에 Date타입 필드가 있는 경우
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.registerTypeAdapter(Date.class, new DateDeserializer());
		List<BeautyTip> beautyTipList = gsonBuilder.create().fromJson(responseContent, type);

		// BeautyTip beautyTip = new Gson().fromJson(responseContent, type);

		model.addAttribute("beautyTipList", beautyTipList);
		model.addAttribute("category", category.toString());
		model.addAttribute("loginedId", "id2");
		model.addAttribute("loadPath", loadPath);

		response.close();
		httpClient.close();

		return "/beautyTip/beautyTipList.jsp";
	}

	// 수정
	@RequestMapping(value = "editForm.do", method = RequestMethod.GET)
	public String beautyTipEditForm(int beautyTipNo, HttpSession session, Model model)
			throws ClientProtocolException, IOException {

		// session체크(로그인)

		//
		BeautyTip beautyTip = this.getSrcForEdit(beautyTipNo);

		model.addAttribute("beautyTip", beautyTip);

		//
		return "/beautyTip/editForm.jsp"; // 디스패쳐방식으로 수정할 beautyTip을 들고 감
	}

	private BeautyTip getSrcForEdit(int beautyTipNo) throws ClientProtocolException, IOException {

		String url = Const.getOriginpath() + "beautyTip/find/id/" + beautyTipNo;// get

		// apache lib
		HttpGet httpGet = new HttpGet(url); // <-> HttpPost

		// HttpClient
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// os에 붙음
		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로

		// 상태코드확인
		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		// 내용을 json으로 받는다(stream으로)
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		// 상태체크해서 처리 해줘야 됨
		// System.out.println(responseStatusCode);

		// json(String) to object
		// gson lib
		// TypeToken은 생성자가 없기 때문에 바로 {}닫아 줌

		TypeToken<BeautyTip> typeToken = new TypeToken<BeautyTip>() {
		};

		// java.lang.reflect.type, import
		Type type = typeToken.getType();

		// 객체에 Date타입 필드가 있는 경우
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.registerTypeAdapter(Date.class, new DateDeserializer());
		BeautyTip beautyTip = gsonBuilder.create().fromJson(responseContent, type);

		// BeautyTip beautyTip = new Gson().fromJson(responseContent, type);

		//
		response.close();
		httpClient.close();

		return beautyTip;
	}

	// form태그로 객체 가져오는 것...test필요
	@RequestMapping(value = "edit.do", method = RequestMethod.POST)
	public String beautyTipEdit(HttpServletRequest req) throws ClientProtocolException, IOException {

		// 원본객체필요없음
		// req.get...
		int beautyTipNo = 4; // post방식으로 넘길때 번호 알아와야 함
		// BeautyTip srcTip = this.getSrcForEdit(beautyTipNo);

		BeautyTip srcTip = new BeautyTip(beautyTipNo, "4editbeautyTipTitle", "4editimage", "4editbeautyTipContent",
				"video", new Customer(2, "2id", "2password", "name", "m", null, "email", null),
				BeautyTipCategory.makeupInformation, null);

		//
		String url = Const.getOriginpath() + "beautyTip/modify";

		// req, jsp에서 받아온 값으로 beautyTip객체 수정
		srcTip.setBeautyTipContent("수정합니다");

		//
		HttpPost httpPost = new HttpPost(url);
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// form(데이터) 집어넣어서 보내기
		// user객체를 json으로..
		StringEntity entity = new StringEntity(new Gson().toJson(srcTip)); // throw
		httpPost.setEntity(entity);
		httpPost.setHeader("Content-type", "application/json"); // data가
																// json이다(os에
																// noti)

		CloseableHttpResponse response = httpClient.execute(httpPost); // throw

		int responseStatus = HttpResponse.getInstance().getResponseStatus(response);
		String responseContent = HttpResponse.getInstance().getResponseContent(response);
		// System.out.println(responseStatus);

		// true/false

		//
		response.close();
		httpClient.close();

		// req -> 이전페이지(form jsp)에서 넘어온 값으로 BeautyTipCategory를 지정
		String category = req.getParameter("category");
		category = "makeupInformation"; // 나중에 jsp완성되면 지울 정보
		return "redirect:/beautyTip/list.do?category=" + BeautyTipCategory.valueOf(category);
	}

	// 삭제
	@RequestMapping(value = "clear.do", method = RequestMethod.GET)
	public String beautyTipClear(HttpServletRequest req) throws ClientProtocolException, IOException {

		// remove
		int removeNo = Integer.parseInt(req.getParameter("beautyTipNo"));
		String url = Const.getOriginpath() + "beautyTip/remove/" + removeNo;// get

		// apache lib
		HttpGet httpGet = new HttpGet(url); // <-> HttpPost

		// HttpClient
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// os에 붙음
		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로

		// 상태코드확인
		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		// 내용을 json으로 받는다(stream으로)
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		// 상태체크해서 처리 해줘야 됨
		// System.out.println(responseStatusCode);

		response.close();
		httpClient.close();

		// req -> 이전페이지(form jsp)에서 넘어온 값으로 BeautyTipCategory를 지정
		String category = req.getParameter("category");
		category = "makeupInformation"; // 나중에 jsp완성되면 지울 정보
		return "redirect:/beautyTip/list.do?category=" + BeautyTipCategory.valueOf(category);
	}

	// 작성자 검색
	@RequestMapping(value = "showByAuthor.do", method = RequestMethod.GET)
	public String showByAuthor(HttpServletRequest req, Model model) throws ClientProtocolException, IOException {

		// findByAuthor
		String authorId = req.getParameter("authorId");
		String category = req.getParameter("category");
		String url = Const.getOriginpath() + "beautyTip/find/author/" + authorId;// get

		// apache lib
		HttpGet httpGet = new HttpGet(url); // <-> HttpPost

		// HttpClient
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// os에 붙음
		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로

		// 상태코드확인
		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		// 내용을 json으로 받는다(stream으로)
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		// 상태체크해서 처리 해줘야 됨
		// System.out.println(responseStatusCode);

		// json(String) to object
		// gson lib
		// TypeToken은 생성자가 없기 때문에 바로 {}닫아 줌

		TypeToken<List<BeautyTip>> typeToken = new TypeToken<List<BeautyTip>>() {
		};

		// java.lang.reflect.type, import
		Type type = typeToken.getType();

		// 객체에 Date타입 필드가 있는 경우
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.registerTypeAdapter(Date.class, new DateDeserializer());
		List<BeautyTip> beautyTipList = gsonBuilder.create().fromJson(responseContent, type);

		// BeautyTip beautyTip = new Gson().fromJson(responseContent, type);

		model.addAttribute("beautyTipList", beautyTipList);
		model.addAttribute("category", category.toString());

		response.close();
		httpClient.close();

		return "/beautyTip/beautyTipList.jsp";
		// return "/beautyTip/list.jsp";
	}

	// title 검색
	@RequestMapping(value = "showByTitle.do", method = RequestMethod.GET)
	public String showByTitle(HttpServletRequest req, Model model) throws ClientProtocolException, IOException {

		// findByTitle
		String title = req.getParameter("title"); // 검색어
		String category = req.getParameter("category");
		String url = Const.getOriginpath() + "beautyTip/find/title/" + title;// get

		// apache lib
		HttpGet httpGet = new HttpGet(url); // <-> HttpPost

		// HttpClient
		CloseableHttpClient httpClient = HttpClients.createDefault();

		// os에 붙음
		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로

		// 상태코드확인
		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		// 내용을 json으로 받는다(stream으로)
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		// 상태체크해서 처리 해줘야 됨
		// System.out.println(responseStatusCode);

		// json(String) to object
		// gson lib
		// TypeToken은 생성자가 없기 때문에 바로 {}닫아 줌

		TypeToken<List<BeautyTip>> typeToken = new TypeToken<List<BeautyTip>>() {
		};

		// java.lang.reflect.type, import
		Type type = typeToken.getType();

		// 객체에 Date타입 필드가 있는 경우
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.registerTypeAdapter(Date.class, new DateDeserializer());
		List<BeautyTip> beautyTipList = gsonBuilder.create().fromJson(responseContent, type);

		// BeautyTip beautyTip = new Gson().fromJson(responseContent, type);

		model.addAttribute("beautyTipList", beautyTipList);
		model.addAttribute("category", category.toString());

		response.close();
		httpClient.close();

		return "/beautyTip/beautyTipList.jsp";
		/* return "/beautyTip/list.jsp"; */
	}
}
