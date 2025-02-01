const saveImage=()=>{
    var captureElement = document.getElementById("petbti-result-fragment");

    html2canvas(captureElement).then(function (canvas) {
        var dataURL = canvas.toDataURL("image/png");

        var link = document.createElement("a");
        link.href = dataURL;
        link.download = "captured_image.png";
        link.click();
    });
}