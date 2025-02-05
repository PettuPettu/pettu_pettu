$(document).ready(function() {
    $(".delete-button").click(function() {
        if (!confirm("삭제하시겠습니까?")) {
            return;
        }

        let spotSeq = $(this).data("spot-id");
        console.log("seq", spotSeq);
        $.ajax({
            type: "POST",
            url: "/admin/place/delete",
            data: { spotSeq: spotSeq },

            success: function(response) {
                alert("장소가 삭제되었습니다.");
                location.reload();
            },
            error: function(xhr) {
                alert("삭제 중 오류가 발생했습니다: " + xhr.responseText);
            }
        });
    });
});