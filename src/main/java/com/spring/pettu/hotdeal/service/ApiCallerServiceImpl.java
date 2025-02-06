package com.spring.pettu.hotdeal.service;

import com.spring.pettu.common.exception.BusinessException;
import com.spring.pettu.hotdeal.vo.HotdealDTO;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import static com.spring.pettu.common.exception.ErrorCode.MISS_PARSSING;

@Service
public class ApiCallerServiceImpl implements ApiCallerService {

    @Autowired
    private HotdealMapper hotdealMapper;

    @Value("${naver.api.client-id}")
    private String CLIENT_ID;

    @Value("${naver.api.client-secret}")
    private String CLIENT_SECRET;

    @Value("${naver.api.url}")
    private String API_URL;

    @Override
    public JsonNode getApiData(String query,  int displayCount) {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            CategoryMapper categoryMapper = new CategoryMapper();
            String category = categoryMapper.getCategory3(query);

            String encodingQuery = URLEncoder.encode(query, "UTF-8");
            String category2 = URLEncoder.encode("반려동물", "UTF-8");
            String category3 = URLEncoder.encode(category, "UTF-8");

            String API_URL_Option = API_URL + "?query=" + encodingQuery + "&category2" + category2 + "&category3" + category3 + "&sort=sim&display=" + displayCount;
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

    @Override
    public List<HotdealDTO> setHotdealData(JsonNode jsonNode) {

        ObjectMapper mapper = new ObjectMapper();
        List<HotdealDTO> list = new ArrayList<HotdealDTO>();

        if (jsonNode.has("items") && jsonNode.get("items").isArray()) {
            for (JsonNode item : jsonNode.get("items")) {
                try {
                    HotdealDTO hotdealDTO = mapper.treeToValue(item, HotdealDTO.class);
                    list.add(hotdealDTO);
                } catch (Exception e) {
                    throw new BusinessException(MISS_PARSSING);
                }
            }
        } else {
            throw new BusinessException(MISS_PARSSING);
        }

        if (list.isEmpty()){
            throw new BusinessException(MISS_PARSSING);
        }

        return list;
    }

    @Transactional
    public void saveHotdealToDB(List<HotdealDTO> hlist) {

        for (HotdealDTO h : hlist) {

            int count = hotdealMapper.checkProductId(h.getProductId());
            HotdealVO hvo = null;

            if (count > 0) {
                hvo = hotdealMapper.selectByProductId(h.getProductId());
                if (hotdealMapper.checkRegitDate(hvo) >= 1) {
                    hotdealMapper.updateHistory(h, hvo);
                } else {
                    hotdealMapper.insertHistoryData(h, hvo);
                }
            } else {
                hotdealMapper.insertHotdealData(h);
                hvo = hotdealMapper.selectByProductId(h.getProductId());
                hotdealMapper.insertHistoryData(h, hvo);
            }
        }
    }
}
