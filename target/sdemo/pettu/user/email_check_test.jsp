<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Email Check</title>
</head>
<body>
<h2>이메일 전송</h2>
<form>
  <label for="email">Email:</label>
  <input type="text" id="email">
  <button type="button" onclick="sendEmail()">전송하기</button>
</form>

<h2>인증번호 검증</h2>
<form>
  <label for="userNumber">UserNumber:</label>
  <input type="text" id="userNumber">
  <label for="authNumber">AuthNumber:</label>
  <input type="text" id="authNumber">
  <button type="button" onclick="verifyEmail()">검증하기</button>
</form>

<script>
  function sendEmail() {
    const emailValue = document.getElementById('email').value;
    fetch('/main/send', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(emailValue)
    })
            .then(response => response.json())
            .then(data => {
              alert(data.message + ' / 인증번호: ' + data.AuthNumber);
            })
            .catch(error => console.error(error));
  }

  function verifyEmail() {
    const userNumber = document.getElementById('userNumber').value;
    const authNumber = document.getElementById('authNumber').value;
    fetch(`/main/verify?userNumber=${userNumber}&authNumber=${authNumber}`, {
      method: 'POST'
    })
            .then(response => {
              if (!response.ok) {
                return response.text().then(text => { throw new Error(text); });
              }
              return response.text();
            })
            .then(data => {
              alert(data);
            })
            .catch(error => {
              alert(error.message);
            });
  }
</script>
</body>
</html>
