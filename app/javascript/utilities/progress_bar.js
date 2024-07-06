document.addEventListener('turbo:load', function() {
  const progressBar = document.querySelector('.progress-bar')
  
  if (progressBar) {
    const progressBarValue = progressBar.dataset.progress
    progressBar.style.width = progressBarValue + "%"
    progressBar.innerHTML = progressBarValue + "%"
  }
})
