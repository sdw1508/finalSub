package controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import controller.utils.Const;
import controller.utils.HttpResponse;
import domain.BeautyTip;
import domain.Cosmetic;

@Controller
@RequestMapping("myPouch")
public class MyPouchController {
	
	private static int customerNo =-1;
	
	
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String pouchShowAll(HttpServletRequest req,Model model) throws ClientProtocolException, IOException {
		
		String loginUser = null;
		
		HttpSession session = req.getSession(false); // false세션정보 없으면 만들지 않음
		System.out.println(session);
		if (session != null && session.getAttribute("loginedCustomer") != null) {
			loginUser = (String)session.getAttribute("loginedCustomer");
			customerNo = (int)session.getAttribute("customerNo");
			System.out.println(customerNo);
			//request.setAttribute("loginUser", loginUser);
		}
		else{
			return "/customer/customerForm.jsp";
		}
		//처음 파우치 접근 시 실행
//		HttpSession session = request.getSession(false); // false세션정보 없으면 만들지 않음
//		if (session != null) {
//			customerNo = (String)session.getAttribute("customerNo");
//			request.setAttribute("customerNo", customerNo);
//			return customerNo;
//		}
//		else{
//			return "redirect:list"; //로그인 페이지로
//		}
	
		//**** COSMETIC /BEAUTYTIP / ITEM 한번에 ****
		String url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/cosmetic/find";
		HttpGet httpGet = new HttpGet(url); 
 
		CloseableHttpClient httpClient = HttpClients.createDefault();
		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로 던짐
		
		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		String responseContent = HttpResponse.getInstance().getResponseContent(response);
 
		System.out.println(responseStatusCode);
		System.out.println("concon" + responseContent);
 
		TypeToken<List<Cosmetic>> typeToken = new TypeToken<List<Cosmetic>>() {};
 
		Type type = typeToken.getType();
		List<Cosmetic> list = new Gson().fromJson(responseContent, type);
		
		/////////////////////////////////////////////////////////////////////////////////////
		url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/beauty/find";
		httpGet = new HttpGet(url); 
 
		httpClient = HttpClients.createDefault();
		response = httpClient.execute(httpGet); // 예외 바깥으로 던짐
		
		responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		responseContent = HttpResponse.getInstance().getResponseContent(response);
 
		System.out.println(responseStatusCode);
		System.out.println("concon" + responseContent);
 
		TypeToken<List<BeautyTip>> typeToken2 = new TypeToken<List<BeautyTip>>() {};
 
		type = typeToken2.getType();
		List<BeautyTip> blist = new Gson().fromJson(responseContent, type);
		///////////////////////////////////////////////////////////////////////////////////
		
		url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/recommend/find";
		httpGet = new HttpGet(url); 
 
		httpClient = HttpClients.createDefault();
		response = httpClient.execute(httpGet); // 예외 바깥으로 던짐
		
		responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		responseContent = HttpResponse.getInstance().getResponseContent(response);
 
		System.out.println(responseStatusCode);
		System.out.println("concon" + responseContent);
 
		TypeToken<List<Cosmetic>> typeToken3 = new TypeToken<List<Cosmetic>>() {};
 
		type = typeToken3.getType();
		List<Cosmetic> rlist = new Gson().fromJson(responseContent, type);
		
 
		response.close();
 
		
		model.addAttribute("list", list);
		model.addAttribute("blist", blist);
		model.addAttribute("rlist", rlist);
		return "/pouch/myPouchList.jsp";
	}
	
	@RequestMapping(value = "cosmeticClear.do", method = RequestMethod.GET)
	public String cosmeticClear(HttpServletRequest req) throws ClientProtocolException, IOException {

		
		// remove
		int removeNo = Integer.parseInt(req.getParameter("cosmeticNo"));
		String url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/cosmetic/remove/cosmeticNo/"+removeNo;// get

		HttpGet httpGet = new HttpGet(url);

		CloseableHttpClient httpClient = HttpClients.createDefault();
		CloseableHttpResponse response = httpClient.execute(httpGet);

		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		System.out.println(responseStatusCode);
		System.out.println("concon" + responseContent);

		response.close();

		return "redirect:/myPouch/list.do";
	}
	
	@RequestMapping(value = "beautyTipClear.do", method = RequestMethod.GET)
	public String beautyTipClear(HttpServletRequest req,RedirectAttributes redirectAttributes) throws ClientProtocolException, IOException {

		
		// remove
		int removeNo = Integer.parseInt(req.getParameter("beautyTipNo"));
		String url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/beauty/remove/beautyTipId/"+removeNo;// get


		HttpGet httpGet = new HttpGet(url);

		CloseableHttpClient httpClient = HttpClients.createDefault();
		CloseableHttpResponse response = httpClient.execute(httpGet);

		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		System.out.println(responseStatusCode);
		System.out.println("concon" + responseContent);
		redirectAttributes.addFlashAttribute("tab", "1");
		response.close();

		return "redirect:/myPouch/list.do";
	}
	
	@RequestMapping(value = "recommendClear.do", method = RequestMethod.GET)
	public String recommendClear(HttpServletRequest req,RedirectAttributes redirectAttributes) throws ClientProtocolException, IOException {

	
		// remove
		int removeNo = Integer.parseInt(req.getParameter("cosmeticNum"));
		String url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/recommend/remove/cosmeticNo/"+removeNo;// get


		HttpGet httpGet = new HttpGet(url);

		CloseableHttpClient httpClient = HttpClients.createDefault();
		CloseableHttpResponse response = httpClient.execute(httpGet);

		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
		String responseContent = HttpResponse.getInstance().getResponseContent(response);

		System.out.println(responseStatusCode);
		System.out.println("concon" + responseContent);
		String tab = req.getParameter("tabChecked");
		
		redirectAttributes.addFlashAttribute("tab", tab);
		response.close();

		return "redirect:/myPouch/list.do";
	}
	
//	@RequestMapping(value = "cosmeticNameList.do", method = RequestMethod.GET)
//	public String pouchCosmeticShowName(String cosmeticName,Model model) throws ClientProtocolException, IOException {
//		
//
//		String url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/cosmetic/find/cosmeticName/"+cosmeticName;
//		HttpGet httpGet = new HttpGet(url); 
// 
//		CloseableHttpClient httpClient = HttpClients.createDefault();
//		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로 던짐
//		
//		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
//		String responseContent = HttpResponse.getInstance().getResponseContent(response);
// 
//		System.out.println(responseStatusCode);
//		System.out.println("concon" + responseContent);
// 
//		TypeToken<List<Cosmetic>> typeToken = new TypeToken<List<Cosmetic>>() {};
// 
//		Type type = typeToken.getType();
//		List<Cosmetic> list = new Gson().fromJson(responseContent, type);
//		
//		
// 
//		response.close();
//		
// 
//		
//		model.addAttribute("list", list);
//		return "/myPouchList.jsp";
//	}
//	
//	@RequestMapping(value = "beautyTipNameList.do", method = RequestMethod.GET)
//	public String pouchBeautyTipShowName(HttpServletRequest req,String beautyTipTitle,Model model) throws ClientProtocolException, IOException {
//		
//
//		String url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/beauty/find/beautyTipTitle/"+beautyTipTitle;
//		HttpGet httpGet = new HttpGet(url); 
// 
//		CloseableHttpClient httpClient = HttpClients.createDefault();
//		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로 던짐
//		
//		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
//		String responseContent = HttpResponse.getInstance().getResponseContent(response);
// 
//		System.out.println(responseStatusCode);
//		System.out.println("concon" + responseContent);
// 
//		TypeToken<List<BeautyTip>> typeToken = new TypeToken<List<BeautyTip>>() {};
// 
//		Type type = typeToken.getType();
//		List<BeautyTip> blist = new Gson().fromJson(responseContent, type);
////		String tab = req.getParameter("tabChecked");
////		req.setAttribute("tab", tab);
//		response.close();
// 
//		model.addAttribute("tab", 1);
//		model.addAttribute("blist", blist);
//		return "/myPouchList.jsp";
//	}
//	
//	@RequestMapping(value = "recommendNameList.do", method = RequestMethod.GET)
//	public String pouchRecommendCosmeticShowName(String cosmeticName,Model model) throws ClientProtocolException, IOException {
//		
//
//		String url = Const.getOriginpath() + "myPouch/customerNo/"+customerNo+"/recommend/find/cosmeticName/"+cosmeticName;
//		HttpGet httpGet = new HttpGet(url); 
// 
//		CloseableHttpClient httpClient = HttpClients.createDefault();
//		CloseableHttpResponse response = httpClient.execute(httpGet); // 예외 바깥으로 던짐
//		
//		int responseStatusCode = HttpResponse.getInstance().getResponseStatus(response);
//		String responseContent = HttpResponse.getInstance().getResponseContent(response);
// 
//		System.out.println(responseStatusCode);
//		System.out.println("concon" + responseContent);
// 
//		TypeToken<List<Cosmetic>> typeToken = new TypeToken<List<Cosmetic>>() {};
// 
//		Type type = typeToken.getType();
//		List<Cosmetic> rlist = new Gson().fromJson(responseContent, type);
//		
//		
// 
//		response.close();
//		
// 
//		model.addAttribute("tab", 2);
//		model.addAttribute("rlist", rlist);
//		return "/myPouchList.jsp";
//	}
	
	
	

}
