document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById('globalModal');
    var closeBtn = document.querySelector('.modal-close');

    function openModal(title, contentUrl) {
      fetch(contentUrl)
        .then(response => response.text())
        .then(data => {
          document.getElementById('modalTitle').innerText = title;
          document.getElementById('modalBody').innerHTML = data;
          modal.style.display = 'block';
        });

      closeBtn.onclick = function() {
        modal.style.display = 'none';
      }

      window.onclick = function(event) {
        if (event.target === modal) {
          modal.style.display = 'none';
        }
      }
    }

    // Expose the openModal function globally
    window.openGlobalModal = openModal;
});
