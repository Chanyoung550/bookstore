package org.zerock.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.KakaoPayVO;
import org.zerock.service.KakaoPayService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class KakaoPayController {
	
	@Autowired
	private KakaoPayService payservice;
	
	@RequestMapping("/kakaopay")
	@ResponseBody
	public String kakaopay(Model model, KakaoPayVO vo) {
		try {
			String userid = vo.getUserid();//파라미터로 넘겨받은 유저 아이디.
			int pointCharge = vo.getPointCharge();//파라미터로 넘겨받은 충전해야하는 포인트
			int point = vo.getPoint();//파라미터로 넘겨받은 충전 후 유저가 보유한 포인트
			log.info("userid : "+userid);
			log.info("point : "+pointCharge);
			log.info("point : " + point);
			
			URL pay = new URL("https://kapi.kakao.com/v1/payment/ready");//서버와 통신
			HttpURLConnection connect = (HttpURLConnection) pay.openConnection();
			connect.setRequestMethod("POST");//포스트방식
			connect.setRequestProperty("Authorization", "KakaoAK 0a6319489b0b97c1f5ba06e04f9687d1");//kakao Admin key
			connect.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connect.setDoOutput(true);
			String parameter = "cid=TC0ONETIME&"
					+ "partner_order_id=partner_order_id&"
					+ "partner_user_id="+userid+"&"//결제하는 유저 아이디.
					+ "item_name=point&"//결제하는것의 이름.
					+ "quantity=1&"//수량
					+ "total_amount="+pointCharge+"&"//결제금액
					+ "vat_amount=0&"//수수료
					+ "tax_free_amount=0&"
					+ "approval_url=http://localhost:8080/mypage/paylist&"//충전을 성공하면 이동하는 url
					+ "fail_url=http://localhost:8080/point&"//충전을 실패하면 이동하는 url
					+ "cancel_url=http://localhost:8080/point";//충전 중 에러가 나면 이동하는 url
			OutputStream output = connect.getOutputStream();
			DataOutputStream putData = new DataOutputStream(output);
			putData.writeBytes(parameter);
			putData.flush();
			putData.close();
			
			int result = connect.getResponseCode();
			
			InputStream input;
			
			if(result == 200) {//서버와 통신 후 성공하면 실행
				input = connect.getInputStream();
				log.info("input : "+input);
				payservice.insert(vo);//가져온 유저아이디와 충전된 전체포인트를 업데이트
				payservice.pointupdate(vo);//유저아이디와 충전된포인트와 충전 후 포인트를 데이터베이스에 저장.
			}
			else {//서버와 통신 후 실패하면 실행
				input = connect.getErrorStream();//error메세지 전달
				log.info("input : "+input);
			}
			InputStreamReader reader = new InputStreamReader(input);
			BufferedReader changer = new BufferedReader(reader);
			return changer.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
