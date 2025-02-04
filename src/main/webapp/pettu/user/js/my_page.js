// 닉네임 수정 버튼 클릭 이벤트
$(document).on('click', '.edit-btn', function() {
    const infoRow = $(this).closest('.info-row');
    const nicknameInput = infoRow.find('.nickname-input');
    const originalValue = nicknameInput.val();

    // 입력 필드를 편집 가능하게 변경
    nicknameInput.prop('readonly', false);
    nicknameInput.focus();

    // 수정 버튼 숨기고 저장/취소 버튼 표시
    $(this).hide();
    infoRow.find('.nickname-buttons').show();

    // 저장 버튼 클릭 이벤트
    infoRow.find('.save-nickname-btn').off('click').on('click', function() {
        const newNickname = nicknameInput.val();

        // 닉네임 유효성 검사
        if (newNickname.trim() === '') {
            alert('닉네임을 입력해주세요.');
            nicknameInput.focus();
            return;
        }

        if (newNickname.length < 2) {
            alert('닉네임은 2글자 이상이어야 합니다.');
            nicknameInput.focus();
            return;
        }

        if (newNickname.includes(' ')) {
            alert('닉네임에 공백을 포함할 수 없습니다.');
            nicknameInput.focus();
            return;
        }

        // 유효성 검사 통과 후 Ajax 요청
        $.ajax({
            url: '/mypage/user/nickname/'+userSeq,
            type: 'POST',
            data: {
                nickname: newNickname
            },
            success: function(response) {
                alert('닉네임이 변경되었습니다.');
                nicknameInput.prop('readonly', true);
                infoRow.find('.nickname-buttons').hide();
                infoRow.find('.edit-btn').show();
            },
            error: function(xhr) {
                if (xhr.responseText === "duplicate") {
                    alert('이미 사용 중인 닉네임입니다.');
                } else {
                    alert('닉네임 변경에 실패했습니다.');
                }
                nicknameInput.val(originalValue);
            }
        });
    });

    // 취소 버튼 클릭 이벤트
    infoRow.find('.cancel-nickname-btn').off('click').on('click', function() {
        nicknameInput.val(originalValue);
        nicknameInput.prop('readonly', true);
        infoRow.find('.nickname-buttons').hide();
        infoRow.find('.edit-btn').show();
    });
});


function togglePetForm(formId) {
    const form = document.getElementById(formId);
    const petCard = form.closest('.pet-card');
    const changeImageBtn = petCard.querySelector('.change-image-btn');

    // 다른 모든 폼을 닫습니다
    document.querySelectorAll('.pet-form').forEach(petForm => {
        if (petForm.id !== formId) {
            petForm.style.display = 'none';
            petForm.closest('.pet-card').querySelector('.change-image-btn').style.display = 'none';
        }
    });

    // 선택된 폼을 토글합니다
    if (form.style.display === 'none' || form.style.display === '') {
        form.style.display = 'block';
        changeImageBtn.style.display = 'block';
    } else {
        form.style.display = 'none';
        changeImageBtn.style.display = 'none';
    }
}

let selectedImage = null; // 선택된 이미지 파일을 저장할 변수


function savePetForm(formId) {
    const form = document.getElementById(formId);
    const petCard = form.closest('.pet-card');
    const petSeq = petCard.dataset.petSeq;
    const editBtn = petCard.querySelector('.edit-btn');

    const petData = {
        petSeq: petSeq,
        petName: form.querySelector('input[name="petName"]').value,
        petType: form.querySelector('input[name="petType"]').value,
        petDetailType: form.querySelector('input[name="petDetailType"]').value,
        petBirth: form.querySelector('input[name="petBirth"]').value,
        petGender: petCard.querySelector('.pet-name').textContent.includes('♂') ? 1 : 2,
        userSeq: userSeq
    };

    const formData = new FormData();
    formData.append('petData', new Blob([JSON.stringify(petData)], {type: 'application/json'}));

    if (selectedImage) {
        formData.append('image', selectedImage);
    }

    $.ajax({
        url: '/mypage/pet/update/' + userSeq,
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            refreshPetList();
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
            alert('저장에 실패했습니다.');
        }
    });
}

// 이미지 변경 버튼 클릭 이벤트
$(document).on('click', '.change-image-btn', function (e) {
    e.stopPropagation();
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.click();

    const petCard = $(this).closest('.pet-card');

    input.onchange = function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = petCard.find('.pet-image img');
                if (!img.attr('data-original')) {
                    img.attr('data-original', img.attr('src'));
                }
                img.attr('src', e.target.result);
                selectedImage = file; // 새로운 이미지로 교체
            };
            reader.readAsDataURL(file);
        }
    };
});

function cancelPetForm(formId) {
    const form = document.getElementById(formId);
    const petCard = form.closest('.pet-card');
    const changeImageBtn = petCard.querySelector('.change-image-btn');
    const editBtn = petCard.querySelector('.edit-btn');  // 수정 버튼 요소 선택
    const img = petCard.querySelector('.pet-image img');
    const originalImage = img.getAttribute('data-original');

    if (originalImage) {
        img.src = originalImage;
        selectedImage = null; // 취소 시 이미지 초기화
    }

    form.style.display = 'none';
    changeImageBtn.style.display = 'none';
    editBtn.style.display = 'block';  // 수정 버튼 다시 표시
}





// 프로필 이미지 전역 변수 예시
let profileUploadFile = null;

// 프로필 이미지 변경 처리
$(document).on('click', '.profile-image-change-btn', function (e) {
    e.stopPropagation();
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.click();

    input.onchange = function (e) {
        const file = e.target.files[0];
        if (file) {
            profileUploadFile = file; // 선택된 파일을 전역 변수에 저장

            const reader = new FileReader();
            reader.onload = function (e) {
                const img = $('.profile-image img');
                if (!img.attr('data-original')) {
                    img.attr('data-original', img.attr('src'));
                }
                img.attr('src', e.target.result);
                $('.profile-image-buttons').show();
            };
            reader.readAsDataURL(file);
        }
    };
});

// 프로필 이미지 저장 버튼
$(document).on('click', '.profile-image-buttons .save-btn', function (e) {
    e.stopPropagation();

    if (!profileUploadFile) {
        alert("업로드할 파일이 없습니다.");
        return;
    }

    const formData = new FormData();
    formData.append("file", profileUploadFile);

    $.ajax({
        url: "/mypage/user/file/upload/" + userSeq,  // 실제 업로드를 처리할 Controller 매핑
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function () {
            alert("프로필 이미지가 업로드되었습니다.");
            $('.profile-image-buttons').hide();
        },
        error: function () {
            alert("업로드 중 오류가 발생했습니다.");
        }
    });
});

// 프로필 이미지 취소 버튼
$(document).on('click', '.profile-image-buttons .cancel-btn', function (e) {
    e.stopPropagation();
    const img = $('.profile-image img');
    const originalSrc = img.attr('data-original');
    if (originalSrc) {
        img.attr('src', originalSrc);
    }
    $('.profile-image-buttons').hide();
    profileUploadFile = null; // 선택했던 파일 정보도 초기화
});


// 반려동물 삭제
function deletePet(petSeq) {
    if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '/mypage/pet/delete/' + petSeq,
            type: 'DELETE',
            success: function(response) {
                alert('삭제되었습니다.');
                refreshPetList();
            },
            error: function(xhr, status, error) {
                alert('삭제에 실패했습니다.');
            }
        });
    }
}




// 모달 열기
$(document).on('click', '.add-pet-btn', function() {
    $('#addPetModal').show();
});

// 모달 닫기
function closeModal() {
    $('#addPetModal').hide();
    $('#addPetForm')[0].reset();
}


$(document).on('click', '#savePetBtn', function(e) {
    e.preventDefault();

    const modal = $('#addPetModal');

    // 필드 검증
    const petName = modal.find('input[name="petName"]').val().trim();
    const petBirth = modal.find('input[name="petBirth"]').val().trim();
    const petType = modal.find('input[name="petType"]').val().trim();
    const petDetailType = modal.find('input[name="petDetailType"]').val().trim();
    const petGender = modal.find('select[name="petGender"]').val();

    // 빈 값 검증
    if (!petName) {
        alert('반려동물의 이름을 입력해주세요.');
        modal.find('input[name="petName"]').focus();
        return;
    }

    if (!petBirth) {
        alert('반려동물의 생일을 선택해주세요.');
        modal.find('input[name="petBirth"]').focus();
        return;
    }

    if (!petType) {
        alert('반려동물의 품종을 입력해주세요.');
        modal.find('input[name="petType"]').focus();
        return;
    }

    if (!petDetailType) {
        alert('반려동물의 상세종류를 입력해주세요.');
        modal.find('input[name="petDetailType"]').focus();
        return;
    }

    // 이름 길이 검증
    if (petName.length > 20) {
        alert('반려동물의 이름은 20자를 초과할 수 없습니다.');
        modal.find('input[name="petName"]').focus();
        return;
    }

    // 생일 날짜 검증
    const birthDate = new Date(petBirth);
    const today = new Date();
    if (birthDate > today) {
        alert('생일은 오늘 이후의 날짜를 선택할 수 없습니다.');
        modal.find('input[name="petBirth"]').focus();
        return;
    }

    // 품종과 상세종류 길이 검증
    if (petType.length > 50) {
        alert('품종은 50자를 초과할 수 없습니다.');
        modal.find('input[name="petType"]').focus();
        return;
    }

    if (petDetailType.length > 50) {
        alert('상세종류는 50자를 초과할 수 없습니다.');
        modal.find('input[name="petDetailType"]').focus();
        return;
    }

    const formData = {
        petName: petName,
        petBirth: petBirth,
        petType: petType,
        petDetailType: petDetailType,
        petGender: petGender,
        userSeq: userSeq
    };

    $.ajax({
        url: '/mypage/pet/save',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success: function(response) {
            alert('반려동물이 등록되었습니다.');
            closeModal();
            refreshPetList();
            // 폼 초기화
            modal.find('form')[0].reset();
        },
        error: function(xhr, status, error) {
            alert('등록에 실패했습니다.');
            console.error('Error:', error);
        }
    });
});

// 입력 필드에 대한 실시간 유효성 검사
$('#addPetModal input[name="petName"]').on('input', function() {
    const maxLength = 20;
    if (this.value.length > maxLength) {
        this.value = this.value.slice(0, maxLength);
        alert(`이름은 ${maxLength}자를 초과할 수 없습니다.`);
    }
});

$('#addPetModal input[type="text"]').on('input', function() {
    const maxLength = 50;
    if (this.value.length > maxLength) {
        this.value = this.value.slice(0, maxLength);
        alert(`입력값은 ${maxLength}자를 초과할 수 없습니다.`);
    }
});



// 반려동물 리스트 다 불러오기
function refreshPetList() {
    $.ajax({
        url: '/mypage/pet/list/' + userSeq,
        type: 'GET',
        success: function(pets) {
            const petsContainer = $('.pets-section');
            const header = petsContainer.find('.pets-header').clone();
            petsContainer.empty().append(header);

            if (!pets || pets.length === 0) {
                petsContainer.append('<div class="no-pets-message">반려동물이 없어요</div>');
                return;
            }

            pets.forEach(pet => {
                petsContainer.append(renderPetCard(pet));
            });
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('반려동물 목록을 불러오는데 실패했습니다.');
        }
    });
}



// ESC 키로 모달 닫기
$(document).on('keydown', function(e) {
    if (e.keyCode === 27) {
        closeModal();
    }
});

// 모달 외부 클릭시 닫기
$(document).on('click', '.modal', function(e) {
    if ($(e.target).is('.modal')) {
        closeModal();
    }
});

// 날짜 형식 변환(년월일)
function formatDate(timestamp) {
    // 타임스탬프가 밀리초 단위인지 확인하고 변환
    const date = new Date(Number(timestamp));
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    console.log(year);
    console.log(month);
    console.log(day);
    return `${year}년 ${month}월 ${day}일`;
}

// 날짜 형식 변환( - )
function formatDateDay(timestamp) {
    // 타임스탬프가 밀리초 단위인지 확인하고 변환
    const date = new Date(Number(timestamp));
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    console.log(year);
    console.log(month);
    console.log(day);
    return `${year}-${month}-${day}`;
}


function renderPetCard(pet) {

    return `
        <div class="pet-card" data-pet-seq="${pet.petSeq}">
            <div class="pet-header">
                <div class="pet-image-container">
                    <div class="pet-image">
                        <img src="${pet.fileVO?.sysName ? '/images/' + pet.fileVO.sysName : 'assets/layout/logo.svg'}" 
                             alt="${pet.fileVO?.sysName ? '펫 사진' : '기본 펫 사진'}">
                    </div>
                    <button class="change-image-btn">이미지 변경</button>
                </div>  
                <div class="pet-info">
                    <div class="pet-name">${pet.petName} ${pet.petGender == 1 ? '♂' : '♀'}
                    </div>
                    <div class="pet-details">
                        품종 : ${pet.petType} - ${pet.petDetailType}<br>
                        생일 : ${formatDate(pet.petBirth)}<br>
                        mbti: ${pet.petMbti ? pet.petMbti : '검사 필요해요. <a href="/petbti">검사하러 가기</a>'}
                    </div>
                </div>
                <div class="button-group">
                    <button class="edit-btn" onclick="togglePetForm('petForm${pet.petSeq}')">수정</button>
                    <button class="delete-btn" onclick="deletePet(${pet.petSeq})">삭제</button>
                </div>
            </div>
            <div id="petForm${pet.petSeq}" class="pet-form">
                <div class="form-row">
                    <label>이름:</label>
                    <input type="text" name="petName" value="${pet.petName}">
                </div>
                <div class="form-row">
                    <label>종류:</label>
                    <input type="text" name="petType" value="${pet.petType}">
                </div>
                <div class="form-row">
                    <label>품종:</label>
                    <input type="text" name="petDetailType" value="${pet.petDetailType}">
                </div>
                <div class="form-row">
                    <label>생일:</label>
                    <input type="date" name="petBirth" value="${formatDateDay(pet.petBirth)}">
                </div>  
                <div class="form-buttons">
                    <button class="save-btn" onclick="savePetForm('petForm${pet.petSeq}')">저장</button>
                    <button class="cancel-btn" onclick="cancelPetForm('petForm${pet.petSeq}')">취소</button>
                </div>
            </div>
        </div>
    `;
}

