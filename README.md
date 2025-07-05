# 🐾 Pettu Pettu

<p align="center">
  <img src="https://user-images.githubusercontent.com/12345678/your-logo-image-url.png" alt="Pettu Pettu Logo" width="200"/>
</p>

<p align="center">
  <strong>반려동물과 함께하는 즐거운 라이프스타일을 위한 모든 것</strong>
</p>

<br>

## 📝 프로젝트 개요

**Pettu Pettu**는 반려동물과 함께하는 삶을 더욱 풍요롭게 만들기 위한 웹 애플리케이션입니다. 반려동물 동반 가능 장소 추천부터 실시간 핫딜 정보, 사용자들의 생생한 리뷰, 그리고 재미로 보는 반려동물 성향 테스트(PETBTI)까지 다양한 기능을 제공하여 반려인들에게 유용한 정보와 즐거움을 선사합니다.

<br>

## 🛠️ 기술 스택

### Backend
<p>
  <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white" alt="Java"/>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white" alt="Spring"/>
  <img src="https://img.shields.io/badge/Spring%20Security-6DB33F?style=for-the-badge&logo=spring-security&logoColor=white" alt="Spring Security"/>
  <img src="https://img.shields.io/badge/MyBatis-000000?style=for-the-badge&logo=mybatis&logoColor=white" alt="MyBatis"/>
  <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white" alt="Oracle"/>
  <img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white" alt="Maven"/>
</p>

### Frontend
<p>
  <img src="https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white" alt="JSP"/>
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5"/>
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS3"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript"/>
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white" alt="jQuery"/>
</p>

### 기타
<p>
  <img src="https://img.shields.io/badge/Log4j-C71A36?style=for-the-badge&logo=apache&logoColor=white" alt="Log4j"/>
  <img src="https://img.shields.io/badge/Jackson-292929?style=for-the-badge&logo=json&logoColor=white" alt="Jackson"/>
  <img src="https://img.shields.io/badge/Lombok-DC3545?style=for-the-badge&logo=lombok&logoColor=white" alt="Lombok"/>
  <img src="https://img.shields.io/badge/Apache%20HttpClient-5A9934?style=for-the-badge&logo=apache&logoColor=white" alt="Apache HttpClient"/>
</p>

<br>

## 📂 프로젝트 구조

```
.
├── pom.xml                # Maven 의존성 및 빌드 설정
├── src
│   ├── main
│   │   ├── java           # Java 소스 코드
│   │   │   └── com/spring/pettu
│   │   │       ├── admin      # 관리자 기능
│   │   │       ├── auth       # 인증 및 권한 (Spring Security, OAuth)
│   │   │       ├── common     # 공통 모듈 (예외 처리, 페이징)
│   │   │       ├── hotdeal    # 핫딜 정보
│   │   │       ├── main       # 메인 페이지
│   │   │       ├── mypage     # 마이페이지
│   │   │       ├── myreview   # 내 리뷰 관리
│   │   │       ├── petbti     # PETBTI (반려동물 성향 테스트)
│   │   │       ├── review     # 리뷰 기능
│   │   │       └── spot       # 장소 추천
│   │   ├── resources      # 설정 파일
│   │   │   ├── mapper     # MyBatis 매퍼 XML
│   │   │   └── ...
│   │   └── webapp         # 웹 리소스 (JSP, CSS, JS)
│   │       ├── WEB-INF
│   │       │   └── spring # Spring 설정
│   │       └── pettu      # JSP 뷰 파일
└── ...
```

<br>

## 🚀 설치 및 실행 방법

1.  **저장소 복제**
    ```bash
    git clone https://github.com/your-username/pettu_pettu-main.git
    ```

2.  **환경 변수 설정**
    - `src/main/resources/mybatis-context.xml` 파일에서 본인의 Oracle DB 정보에 맞게 `dataSource` 설정을 수정합니다.
    ```xml
    <property name="driver" value="oracle.jdbc.driver.OracleDriver" />
    <property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" />
    <property name="username" value="your-db-username" />
    <property name="password" value="your-db-password" />
    ```

3.  **Maven 빌드**
    ```bash
    mvn clean install
    ```

4.  **WAS (Tomcat 등) 배포**
    - 생성된 `target/sdemo.war` 파일을 사용 중인 WAS에 배포하여 실행합니다.

<br>



<br>

## 🗺️ API 엔드포인트 (주요 기능)

| 기능 | HTTP Method | URL | 설명 |
| --- | --- | --- | --- |
| **사용자 관리** | | | |
| 회원가입 | `POST` | `/user/register` | 신규 사용자 등록 |
| 로그인 | `POST` | `/user/login` | 사용자 로그인 |
| 마이페이지 | `GET` | `/user/my-page` | 사용자 정보 조회 |
| **소셜 로그인** | | | |
| 구글 로그인 | `GET` | `/oauth/google` | Google 계정으로 로그인 |
| 카카오 로그인 | `GET` | `/oauth/kakao` | Kakao 계정으로 로그인 |
| 네이버 로그인 | `GET` | `/oauth/naver` | Naver 계정으로 로그인 |
| **장소** | | | |
| 장소 목록 | `GET` | `/spot/list` | 전체 장소 목록 조회 |
| 장소 상세 | `GET` | `/spot/detail/{spotId}` | 특정 장소 상세 정보 |
| **핫딜** | | | |
| 핫딜 목록 | `GET` | `/hotdeal/list` | 전체 핫딜 목록 조회 |
| 핫딜 상세 | `GET` | `/hotdeal/detail/{hotdealId}` | 특정 핫딜 상세 정보 |
| **리뷰** | | | |
| 리뷰 작성 | `POST` | `/review/create` | 새로운 리뷰 작성 |
| 장소별 리뷰 | `GET` | `/review/list/{spotId}` | 특정 장소의 모든 리뷰 |
| **PETBTI** | | | |
| PETBTI 시작 | `GET` | `/petbti/start` | 반려동물 성향 테스트 시작 |
| 결과 제출 | `POST` | `/petbti/submit` | 테스트 결과 제출 및 확인 |
| **관리자** | | | |
| 사용자 관리 | `GET` | `/admin/users` | 전체 사용자 목록 조회 |
| 장소 관리 | `GET` | `/admin/places` | 장소 정보 관리 |
| 핫딜 관리 | `GET` | `/admin/hotdeals` | 핫딜 정보 관리 |

<br>

