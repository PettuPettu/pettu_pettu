<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API 데이터 불러오기</title>

    <!-- CSS 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_api_modal.css">

</head>
<body>

<!-- 모달 -->
    <h2>API 데이터 검색</h2>

    <!-- 옵션 선택 (Select 태그) -->
    <label for="category">검색 옵션:</label>
    <select id="category">
        <option value="강아지 사료">강아지 사료</option>
        <option value="고양이 사료">고양이 사료</option>
        <option value="강아지 간식">강아지 간식</option>
        <option value="고양이 간식">고양이 간식</option>
        <option value="강아지 장난감">강아지 장난감</option>
        <option value="고양이 장난감">고양이 장난감</option>
        <option value="강아지 옷">강아지 옷</option>
        <option value="고양이 옷">고양이 옷</option>
        <option value="강아지 배변패드">강아지 배변패드</option>
        <option value="고양이 모래">고양이 모래</option>
    </select>

    <!-- 개수 입력 -->
    <div>
        <label for="limit">검색 개수:</label>
        <span>최대 100개 까지 가능</span>
    </div>
    <input type="number" id="limit" min="1" max="100" value="10">

    <!-- API 요청 버튼 -->
    <button id="fetchApiData">검색</button>

    <button class="close">닫기</button>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".close").click(function() {
                $("#commonModal").hide();
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $("#fetchApiData").click(function () {
                const category = $("#category").val();
                const limit = $("#limit").val();

                if (!limit || limit <= 0 || limit > 100) {
                    alert("검색 개수를 1~100 사이로 입력하세요.");
                    return;
                }

                // FormData를 사용하여 데이터를 전송
                const formData = new URLSearchParams();
                formData.append("keyword", category);
                formData.append("limit", limit);

                fetch("/apiData/insertData", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('서버 오류가 발생했습니다!');
                });
            });
        });

    </script>
</body>
</html>
