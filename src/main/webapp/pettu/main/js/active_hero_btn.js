document.addEventListener("DOMContentLoaded", () => {
    const buttons = document.getElementsByClassName("hero-btn");
    const spans = document.getElementsByClassName("hero-span");

    for (let i = 0; i < buttons.length; i++) {
        const button = buttons[i];
        const span = spans[i];

        button.addEventListener("click", () => {
            const isActive = button.getAttribute("data-active") === "true";

            if (!isActive) {
                button.setAttribute("data-active", "true");
                span.setAttribute("data-active", "true");

                for (let j = 0; j < buttons.length; j++) {
                    const otherButton = buttons[j];
                    if (otherButton !== button && otherButton.getAttribute("data-active") === "true") {
                        otherButton.setAttribute("data-active", "false");
                    }

                    const otherSpan = spans[j];
                    if (otherSpan !== span && otherSpan.getAttribute("data-active") === "true") {
                        otherSpan.setAttribute("data-active", "false");
                    }
                }
            }
        });
    }
});