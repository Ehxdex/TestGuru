document.addEventListener('turbo:load', function () {
  const timerControl = document.querySelector('#timer')
  const formControl = document.querySelector('#answer_form')

  if (timerControl) {
    let duration = timerControl.dataset.duration
    let t = duration_to_time(duration)
    timerControl.innerHTML = t.hours + ':' + t.minutes + ':' + t.seconds

    let timer = setTimeout(function tick() {
      t = duration_to_time(duration--)
      timerControl.innerHTML = t.hours + ':' + t.minutes + ':' + t.seconds

      if (duration == 0) { formControl.submit() }
      timer = setTimeout(tick, 1000)
    }, 1000)
  }
})

function duration_to_time(duration) {
  let seconds = Math.floor((duration) % 60)
  let minutes = Math.floor((duration / 60) % 60)
  let hours = Math.floor((duration * 60 * 60) % 24)

  if (minutes < 10) { minutes = "0" + minutes }
  if (seconds < 10) { seconds = "0" + seconds }

  return {
    'total': duration,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  }
}
