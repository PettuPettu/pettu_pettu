function toggleDropdown(event) {
    // Close any open dropdowns first
    document.querySelectorAll('.dropdown.open').forEach(openDropdown => {
        openDropdown.classList.remove('open');
    });

    // Toggle the clicked dropdown
    const dropdown = event.target.closest('.dropdown');
    dropdown.classList.toggle('open');
}

// Close dropdowns when clicking outside
document.addEventListener('click', function(event) {
    if (!event.target.closest('.dropdown')) {
        document.querySelectorAll('.dropdown.open').forEach(openDropdown => {
            openDropdown.classList.remove('open');
        });
    }
});

function handleCheckboxChange(event) {
    const checkbox = event.target;
    const value = checkbox.value;
    alert("checkbox"+checkbox + "value:"+ value);
    const tagContainer = document.querySelector('.tags');

    if (checkbox.checked) {
        // Create a new tag div
        const newTag = document.createElement('div');
        newTag.className = 'tag';
        newTag.innerHTML = `#`+ value+`<span onclick="removeTag(event)">✕</span>`;
        tagContainer.appendChild(newTag);
    } else {
        // Remove the corresponding tag
        const existingTag = Array.from(tagContainer.children).find(tag =>
            tag.textContent.trim().startsWith(`#`+ value)
        );
        if (existingTag) {
            existingTag.remove();
        }
    }
}

function removeTag(event) {
    const tag = event.target.closest('.tag');
    if (tag) {
        const value = tag.textContent.trim().replace('✕', '').trim().substring(1);
        const checkbox = document.querySelector(`input[type="checkbox"][value="`+ value+`"]`);
        if (checkbox) {
            checkbox.checked = false;
        }
        tag.remove();
    }
}