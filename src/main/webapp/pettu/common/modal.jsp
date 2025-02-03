<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/common/css/modal.css" />
</head>

<div id="commonModal" class="modal">
    <div class="modal-content">
        <div id="modal-body"></div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $(".openModal").click(function() {
            const page = $(this).data("page");
            const width = $(this).data("width") || "fit-content";
            const height = $(this).data("height") || "50vh";

            $("#modal-body").load("/modal?page=" + page);

            $(".modal-content").css({
                "width": width,
                "height": height
            });

            $("#commonModal").show();
        });
    });

    $("#commonModal").click(function() {
        $(this).hide();
    });

    $(".modal-content").click(function(event) {
        event.stopPropagation();
    });
</script>