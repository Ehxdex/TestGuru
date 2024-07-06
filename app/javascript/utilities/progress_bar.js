document.addEventListener('turbo:load', function() {
  const progressBar = document.querySelector('.progress-bar')
  const progressBarValue = progressBar.dataset.progress

  if (progressBar) {
    progressBar.style.width = progressBarValue + "%"
    progressBar.innerHTML = progressBarValue + "%"
  }
})
