$(document).ready(function() {

    reviewListRestAPI();

    createModalOpen();



});

function createModalOpen() {
    $(".openModal").click(function() {
        const page = $(this).data("page");
        $("#modal-body").load(page);
        $("#commonModal").show();
    });
}

// -----------------UI 동작 관려 JS-------------------
function scrollToSecondSection() {
    const targetElement = document.getElementById("move-second-section");

    // div로 스크롤 이동
    window.scrollTo({
        top: targetElement.offsetTop - 60,
        behavior: 'smooth',
    });

}
// ------------------------------------------------



// 작성 후 review 리스트 업데이트
function reviewListRestAPI(){

    const storeId = document.getElementById('spot-detail-spotSeq').value;

    $.ajax({
        url: '/rest/review/list/' + storeId,  // 서버의 API URL
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            console.log(response);

            var reviewTotalCount = response.reviewTotalCount;

            alert("reviewListRestAPI >>> "+reviewTotalCount);

        },
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
        }
    });
}