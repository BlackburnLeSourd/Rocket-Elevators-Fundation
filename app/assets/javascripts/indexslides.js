const panels = document.querySelectorAll('.panel-slide')

panels.forEach((panel) => {
    panel.addEventListener('click', () => {
        alert('click')
    })
})
