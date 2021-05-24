const toggleButton = document.getElementsByClassName('menu-toggle')[0]
const enlaces = document.getElementsByClassName("menu")[0]

toggleButton.addEventListener('click', ()=> {
    enlaces.classList.toggle('active');
});