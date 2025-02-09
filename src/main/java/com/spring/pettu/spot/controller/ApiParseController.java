package com.spring.pettu.spot.controller;

import com.spring.pettu.spot.service.SpotServiceImpl;
import com.spring.pettu.spot.vo.SpotVO;
import lombok.RequiredArgsConstructor;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping(value = "/api/parse")
@RequiredArgsConstructor
public class ApiParseController {

    private final SpotServiceImpl spotServiceImpl;

//    @Value("${dataGoKr.api.url}")
    private String API_URL;

    @GetMapping
    @Transactional
    public void test() throws IOException {
        String serviceKey = API_URL; // 서비스키

        List<SpotVO> spotList = new ArrayList<>();

        // API 요청 URL
        StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorPetTourService/areaBasedList");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("arrange", "UTF-8") + "=" + URLEncoder.encode("C", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("listYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        // 파싱
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(sb.toString());

        JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

        System.out.println("itemsNode size: " + itemsNode.size());

        // 아이템 배열을 순회하면서 각 관광지 데이터를 객체로 변환 후 리스트에 추가
        for (JsonNode itemNode : itemsNode) {
            SpotVO spotVO = mapItemToSpotVO(itemNode);
            spotList.add(spotVO);
        }

        // 전체 데이터를 한번에 DB에 저장
        int result = spotServiceImpl.saveSpotList(spotList);

        System.out.println(result + " : 모든 데이터가 DB에 저장되었습니다.");
    }

    private SpotVO mapItemToSpotVO(JsonNode itemNode) {
        SpotVO spotVO = new SpotVO();

        spotVO.setSpotName(getTextValue(itemNode, "title"));
        spotVO.setSpotLocation(getTextValue(itemNode, "addr1"));
        spotVO.setSpotSubLocation(getTextValue(itemNode, "addr2"));
        spotVO.setSpotSigunguCode(getLongValue(itemNode, "sigungucode"));
        spotVO.setSpotAreaCode(getLongValue(itemNode, "areacode"));
        spotVO.setSpotPicture(getTextValue(itemNode, "firstimage"));
        spotVO.setSpotSubPicture(getTextValue(itemNode, "firstimage2"));
        spotVO.setSpotOpenDate(parseDate(getTextValue(itemNode, "createdtime")));
        spotVO.setSpotOpenApiId(getLongValue(itemNode, "contentid"));
        spotVO.setCategorySeq(getLongValue(itemNode,"contenttypeid"));
        return spotVO;
    }

    // JsonNode에서 텍스트 값을 가져오는 메소드
    private String getTextValue(JsonNode node, String fieldName) {
        return node.path(fieldName).isMissingNode() ? null : node.path(fieldName).asText();
    }

    // JsonNode에서 Long 값을 가져오는 메소드
    private Long getLongValue(JsonNode node, String fieldName) {
        return node.path(fieldName).isMissingNode() ? 0L : node.path(fieldName).asLong();
    }

    // String을 Date로 변환하는 메소드
    private Date parseDate(String dateStr) {
        if (dateStr != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            try {
                return sdf.parse(dateStr);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
}
