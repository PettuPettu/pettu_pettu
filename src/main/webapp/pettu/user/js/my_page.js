function togglePetForm(formId) {
    const form = document.getElementById(formId);
    const petCard = form.closest('.pet-card');
    const changeImageBtn = petCard.querySelector('.change-image-btn');

    document.querySelectorAll('.pet-form').forEach(petForm => {
        petForm.style.display = 'none';
        petForm.closest('.pet-card').querySelector('.change-image-btn').style.display = 'none';
    });

    if (form.style.display === 'none' || form.style.display === '') {
        form.style.display = 'block';
        changeImageBtn.style.display = 'block';
    } else {
        form.style.display = 'none';
        changeImageBtn.style.display = 'none';
    }
}

function savePetForm(formId) {
    const form = document.getElementById(formId);
    const petCard = form.closest('.pet-card');
    const changeImageBtn = petCard.querySelector('.change-image-btn');

    form.style.display = 'none';
    changeImageBtn.style.display = 'none';
}

function cancelPetForm(formId) {
    const form = document.getElementById(formId);
    const petCard = form.closest('.pet-card');
    const changeImageBtn = petCard.querySelector('.change-image-btn');
    const originalImage = petCard.querySelector('.pet-image img').getAttribute('data-original');

    if (originalImage) {
        petCard.querySelector('.pet-image img').src = originalImage;
    }

    form.style.display = 'none';
    changeImageBtn.style.display = 'none';
}

// 이벤트 위임을 사용한 이미지 변경 처리
$(document).on('click', '.change-image-btn', function (e) {
    e.stopPropagation();
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.click();

    const imageContainer = $(this).closest('.pet-image-container');

    input.onchange = function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = imageContainer.find('img');
                if (!img.attr('data-original')) {
                    img.attr('data-original', img.attr('src'));
                }
                img.attr('src', e.target.result);
                imageContainer.find('.image-buttons').show();
            };
            reader.readAsDataURL(file);
        }
    };
});

// 이미지 저장 버튼
$(document).on('click', '.image-buttons .save-btn', function (e) {
    e.stopPropagation();
    const imageButtons = $(this).closest('.image-buttons');
    // 여기에 서버로 이미지를 전송하는 AJAX 코드를 추가할 수 있습니다
    imageButtons.hide();
});

// 이미지 취소 버튼
$(document).on('click', '.image-buttons .cancel-btn', function (e) {
    e.stopPropagation();
    const imageContainer = $(this).closest('.pet-image-container');
    const img = imageContainer.find('img');
    const originalSrc = img.attr('data-original');
    if (originalSrc) {
        img.attr('src', originalSrc);
    }
    $(this).closest('.image-buttons').hide();
});

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

// 프로필 이미지 저장/취소 버튼
$(document).on('click', '.profile-image-buttons .save-btn', function (e) {
    e.stopPropagation();
    $(this).parent().hide();
});

$(document).on('click', '.profile-image-buttons .cancel-btn', function (e) {
    e.stopPropagation();
    const img = $('.profile-image img');
    const originalSrc = img.attr('data-original');
    if (originalSrc) {
        img.attr('src', originalSrc);
    }
    $(this).parent().hide();
});
