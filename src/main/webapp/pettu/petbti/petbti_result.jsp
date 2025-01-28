<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_result.css" />
</head>
<body>
<div class="petbti-container">
    <div class="petbti-title">
        <h1>ENFJ</h1>
        <h3 class="petbti-result-subtitle">사교적인 리더, 따뜻한 안내자</h3>
    </div>
    <img class="petbti-result-img" src="${pageContext.request.contextPath}/assets/layout/github.svg"/>
    <p class="petbti-result-tag">#따뜻함 #이타주의 #배려</p>
    <div class="petbti-result-desc">
        <strong>ENFJ</strong> 성향을 가진 길동이은<br/>
        사자와 같은 따뜻하고 리더십 있는 존재입니다.<br/><br/>
        이 동물은 항상 주변을 살피며 무리를 이끄는 데 탁월합니다. 자신감 넘치는 태도와 부드러운 배려심을 겸비해, 누구든 이 동물에게서 안전과 안정을 느낍니다.<br/><br/>
        <strong>사교적이고 배려심이 많아요</strong><br/>ENFJ 동물은 무리의 분위기를 읽고, 모두가 어울릴 수 있도록 중재합니다. 새로운 동물에게도 거리낌 없이 다가가며, 늘 협력과 조화를 우선시합니다.<br/><br/>
        <strong>천부적인 리더</strong><br/>이 동물은 자연스럽게 앞장서서 방향을 제시합니다. 그러나 강압적이지 않고, 모두의 의견을 들으면서도 명확한 결정을 내릴 줄 아는 현명함을 가지고 있습니다.<br/><br/>
        <strong>타인의 성장을 돕는 멘토</strong><br/>ENFJ 동물은 다른 동물들이 잠재력을 발휘할 수 있도록 격려합니다. 항상 긍정적이고, 자신감과 희망을 심어주려 노력합니다.
    </div>

    <div class="petbti-btn-fragment">
        <jsp:include page="petbti_btn.jsp">
            <jsp:param name="value" value="다시하기" />
        </jsp:include>
        <jsp:include page="petbti_btn.jsp">
            <jsp:param name="value" value="이미지 저장" />
        </jsp:include>
    </div>
</div>
</body>
