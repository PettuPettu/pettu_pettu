$(document).ready(function () {
    $('.sort-by').on('change', function (e) {
        const sortBy = e.target.value;
        // 정렬 로직 구현
    });

    $('.delete-btn').on('click', function () {
        if (confirm('리뷰를 삭제하시겠습니까?')) {
            // 삭제 로직 구현
        }
    });
});
