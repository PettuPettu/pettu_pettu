document.addEventListener("DOMContentLoaded", function () {
    const loadingSpinner = document.getElementById("loading-spinner");
    let loadingTimeout = null;

    function showLoading() {
        loadingTimeout = setTimeout(() => {
            loadingSpinner.style.display = "flex";
        }, 500);
    }

    function hideLoading() {
        clearTimeout(loadingTimeout);
        loadingSpinner.style.display = "none";
    }

    const originalOpen = XMLHttpRequest.prototype.open;
    XMLHttpRequest.prototype.open = function () {
        this.addEventListener("loadstart", showLoading);
        this.addEventListener("loadend", hideLoading);
        originalOpen.apply(this, arguments);
    };

    const originalFetch = window.fetch;
    window.fetch = function () {
        showLoading();
        return originalFetch.apply(this, arguments).finally(hideLoading);
    };
});
