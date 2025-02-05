$(document).ready(function() {
    // 리뷰 삭제 기능
    $(".delete-button").click(function() {
        if (!confirm("삭제하시겠습니까?")) {
            return;
        }

        let reviewSeq = $(this).data("review-id");
        let userSeq = $(this).data("user-id");

        $.ajax({
            type: "POST",
            url: "/admin/user/detail/review/delete",
            data: {
                reviewSeq: reviewSeq,
                userSeq: userSeq
            },
            success: function(response) {
                alert("리뷰가 삭제되었습니다.");
                location.reload();
            },
            error: function(xhr) {
                alert("삭제 중 오류가 발생했습니다");
            }
        });
    });

    // 사용자 상태 변경 기능 (활성화 / 비활성화)
    $(".deactivate-user, .activate-user").click(function() {
        if (!confirm("정말로 변경하시겠습니까?")) {
            return;
        }

        let userSeq = $(this).data("user-id"); // 사용자 ID
        let userStatus = $(this).data("user-status"); // 현재 상태 (1=활성, 0=비활성)
        let newStatus = (userStatus === 1) ? 0 : 1; // 변경할 상태
        let actionText = (newStatus === 1) ? "활성화" : "비활성화";

        $.ajax({
            type: "POST",
            url: "/admin/user/detail/status/update",
            data: {
                userSeq: userSeq,
                userStatus: newStatus
            },
            success: function(response) {
                alert("사용자가 " + actionText + "되었습니다.");
                location.reload(); // 페이지 새로고침
            },
            error: function(xhr) {
                alert("유저 상태 변경에 실패하였습니다.");
            }
        });
    });
});
