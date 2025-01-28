document.addEventListener('DOMContentLoaded', () => {
    const sections = Array.from(document.getElementsByClassName('main-slide-section'));

    sections.forEach(section => {
        const slideFragment = section.querySelector('.main-slide-card-fragment');
        const buttons = Array.from(section.querySelectorAll('.main-slide-btn'));
        const slideCards = Array.from(section.getElementsByClassName('main-slide-card'));
        const cardWidth = slideCards[0].offsetWidth + 30; // 카드 너비 + gap (30px)
        const totalSlides = slideCards.length;
        const visibleSlides = Math.floor(slideFragment.offsetWidth / cardWidth);
        let currentIndex = 0;

        const updateButtonVisibility = () => {
            const leftButton = buttons.find(button => button.dataset.direction === 'left');
            const rightButton = buttons.find(button => button.dataset.direction === 'right');

            if (currentIndex === 0) {
                leftButton.style.display = 'none';
            } else {
                leftButton.style.display = 'block';
            }

            if (currentIndex >= totalSlides - visibleSlides) {
                rightButton.style.display = 'none';
            } else {
                rightButton.style.display = 'block';
            }
        };

        updateButtonVisibility();

        buttons.forEach(button => {
            button.addEventListener('click', () => {
                const direction = button.dataset.direction;

                if (direction === 'left' && currentIndex > 0) {
                    currentIndex--;
                } else if (direction === 'right' && currentIndex < totalSlides - visibleSlides) {
                    currentIndex++;
                }

                const offset = -currentIndex * cardWidth;
                slideFragment.style.transform = `translateX(${offset}px)`;

                updateButtonVisibility();
            });
        });
    });
});