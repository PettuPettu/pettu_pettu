package com.spring.pettu.hotdeal.service;

import com.spring.pettu.hotdeal.vo.HistoryVO;
import com.spring.pettu.hotdeal.vo.HotdealVO;
import com.spring.pettu.mapper.HotdealMapper;
import org.apache.http.client.methods.CloseableHttpResponse;  // HTTP 응답 객체
import org.apache.http.client.methods.HttpGet;  // GET 요청 객체
import org.apache.http.impl.client.CloseableHttpClient;  // HttpClient 인터페이스
import org.apache.http.impl.client.HttpClients;  // HttpClient 객체 생성
import org.apache.http.util.EntityUtils;  // 응답을 String으로 변환
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ApiCallerServiceImpl implements ApiCallerService {

    @Autowired
    private HotdealMapper hotdealMapper;

    private static final String API_URL = "https://openapi.naver.com/v1/search/shop.json";
    private static final String CLIENT_ID = System.getenv("API_ID"); //환경변수에 저장한 값
    private static final String CLIENT_SECRET = System.getenv("API_SECRET"); // 환경변수에 저장한 값

    @Override
    public JsonNode getApiData(String query, int displayCount) {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            String API_URL_Option = API_URL + "?query=" + query + "&display=" + displayCount;
            HttpGet request = new HttpGet(API_URL_Option);

            request.setHeader("X-Naver-Client-Id", CLIENT_ID);
            request.setHeader("X-Naver-Client-Secret", CLIENT_SECRET);
            request.setHeader("Accept", "application/json");

            CloseableHttpResponse response = client.execute(request);
            String jsonResponse = EntityUtils.toString(response.getEntity()); // JSON 데이터 반환

            // Json 파싱해서 JsonNode로 변환
            ObjectMapper mapper = new ObjectMapper();
            return mapper.readTree(jsonResponse);
        } catch (Exception e) {
            throw new RuntimeException("API 요청 실패", e);
        }
    }

    //수정해야 함!!!
    @Override
    public List<HotdealVO> setHotdealData(JsonNode jsonNode) {

        ObjectMapper mapper = new ObjectMapper();
        List<HotdealVO> list = new ArrayList<HotdealVO>();

        if (jsonNode.has("item") && jsonNode.get("item").isArray()) {
            for (JsonNode item : jsonNode.get("item")) {
                try {
                    HotdealVO hotdealVO = mapper.treeToValue(item, HotdealVO.class);
                    list.add(hotdealVO);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public void insertHotdealDataList(HotdealVO hotdealVO, HistoryVO historyVO) {

        for (HotdealVO h : setHotdealData(getApiData("강아지 사료", 100))) {
            hotdealMapper.insertHotdealData(h, historyVO);
        }
    }


}
