const petCards = document.getElementsByClassName('petbti-select-card-fragment');

for (const card of petCards) {
    card.addEventListener('click', () => {
        for (const item of petCards) {
            item.setAttribute('data-select', 'false');
        }
        card.setAttribute('data-select', 'true');
    });
}