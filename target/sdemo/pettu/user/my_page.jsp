<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <style>
    body {
      background-color: #eef1f0;
      font-family: 'Noto Sans KR', sans-serif;
    }

    .container {
      display: flex;
      padding: 20px;
    }

    .sidebar {
      width: 200px;
      background: white;
      border-radius: 10px;
      padding: 20px;
      height: fit-content;
    }

    .sidebar-item {
      display: flex;
      align-items: center;
      margin: 10px 0;
      gap: 10px;
    }

    .main-content {
      flex: 1;
      margin-left: 20px;
    }

    .profile-card {
      background: white;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
    }

    .profile-form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .input-group {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .input-group input {
      flex: 1;
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .edit-btn {
      background: #ffb6b6;
      border: none;
      padding: 5px 15px;
      border-radius: 5px;
      color: white;
      cursor: pointer;
    }

    .pet-section {
      margin-top: 20px;
    }

    .pet-section h2 {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .add-pet-btn {
      background: #ffb6b6;
      border: none;
      padding: 3px 10px;
      border-radius: 5px;
      font-size: 14px;
    }

    .pet-card {
      background: white;
      border-radius: 10px;
      padding: 20px;
      margin-top: 10px;
    }

    .pet-card.edit-mode {
      background: #e7f1ff;
    }

    .pet-info {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .pet-image {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
    }

    .save-btn {
      background: #92a8d1;
      border: none;
      padding: 5px 15px;
      border-radius: 5px;
      color: white;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="sidebar">
    <div class="sidebar-item">
      <img src="user-icon.png" alt="사용자 정보" width="24">
      <span>내 정보</span>
    </div>
    <div class="sidebar-item">
      <img src="pets-icon.png" alt="반려동물" width="24">
      <span>내 반려동물</span>
    </div>
  </div>

  <div class="main-content">
    <div class="profile-card">
      <h2>xxx님의 페이지</h2>
      <form class="profile-form">
        <div class="input-group">
          <input type="text" placeholder="이름">
          <button type="button" class="edit-btn">수정</button>
        </div>
        <div class="input-group">
          <input type="text" placeholder="닉네임">
          <button type="button" class="edit-btn">수정</button>
        </div>
        <div class="input-group">
          <input type="text" placeholder="아이디">
          <button type="button" class="edit-btn">수정</button>
        </div>
        <div class="input-group">
          <input type="password" placeholder="비밀번호">
          <button type="button" class="edit-btn">수정</button>
        </div>
      </form>
    </div>

    <div class="pet-section">
      <h2>
        내 반려동물
        <button class="add-pet-btn">추가</button>
      </h2>

      <div class="pet-card">
        <div class="pet-info">
          <img src="pet-image.jpg" class="pet-image" alt="복순이">
          <div>
            <h3>복순이 ♀</h3>
            <p>종류: 개 / 미르치와 2개월 3kg</p>
            <p>mbti: 귀염 반장님</p>
            <button class="edit-btn">수정</button>
          </div>
        </div>
      </div>

      <div class="pet-card edit-mode" style="display: none;">
        <form>
          <div class="pet-info">
            <img src="pet-image.jpg" class="pet-image" alt="복순이">
            <div>
              <input type="text" value="복순이">
              <input type="text" value="미르치와 2개월 3kg">
              <input type="text" value="귀염 반장님">
              <div>
                <button type="submit" class="save-btn">저장</button>
                <button type="button" class="edit-btn">취소</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  document.querySelectorAll('.edit-btn').forEach(button => {
    button.addEventListener('click', function() {
      const viewCard = this.closest('.pet-card');
      const editCard = viewCard.nextElementSibling;

      if (editCard && editCard.classList.contains('edit-mode')) {
        if (editCard.style.display === 'none') {
          editCard.style.display = 'block';
          viewCard.style.display = 'none';
        } else {
          editCard.style.display = 'none';
          viewCard.style.display = 'block';
        }
      }
    });
  });
</script>
</body>
</html>
