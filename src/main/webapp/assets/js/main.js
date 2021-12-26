/* ======== HEADER ======== */
const headerToggle = document.getElementById('header-toggle'),
      headerClose = document.getElementById('nav-close'),
      nav = document.getElementById('nav')

if(headerToggle){
    headerToggle.addEventListener('click', () => {
        nav.classList.add('show')
    })
}

if(headerClose){
    headerClose.addEventListener('click', () => {
        nav.classList.remove('show')
    })
}

/* ======== ABOUT MODAL ======== */
const aboutInfo = document.querySelectorAll('.about-card')
const aboutClose = document.querySelectorAll('.about-modal-close')
const aboutModal = document.querySelectorAll('.about-modal')
const aboutModalContent = document.querySelectorAll('.about-modal-content')

const { body, documentElement } = document;
let { scrollTop } = document.documentElement;

function disableScroll() {
  scrollTop = documentElement.scrollTop;
  body.style.top = `-${scrollTop}px`;
  body.classList.add("scroll-disabled");
}

function enableScroll() {
    body.classList.remove("scroll-disabled");
    documentElement.style.scrollBehavior = "auto";
    documentElement.scrollTop = scrollTop;
    documentElement.style.removeProperty("scroll-behavior");
    body.style.removeProperty("top");
  }

aboutInfo.forEach((link, index) => {
    link.addEventListener('click', () => {
        aboutModal.forEach((project) => {
            project.classList.remove('active-modal')
        })

        aboutModal[index].classList.add('active-modal')
        disableScroll()
    })
})

aboutClose.forEach((closeBtn) => {
    closeBtn.addEventListener('click', () => {
        aboutModal.forEach((project) => {
            project.classList.remove('active-modal')
        })
        enableScroll()
    })
})

aboutModal.forEach((project) => {
    project.addEventListener('click', (e) => {
        if(e.target.classList.contains('about-modal-content')){
            return;
        }
        if(e.target.classList.contains('about-modal')){
            project.classList.remove('active-modal');
        }
        enableScroll()
    })
})

/* ======== CONTACT VALIDATION ======== */
const contactEmail = document.getElementById('contact-email')
const contactName = document.getElementById('contact-name')
const contactSubject = document.getElementById('contact-subject')
const contactMessage = document.getElementById('contact-message')
const contactSubmit = document.getElementById('contact-submit')

function validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

if(contactSubmit){
    contactSubmit.addEventListener('click', (e) => {

        if(validateEmail(contactEmail.value) === false){
            contactEmail.classList.add('wrong-input')
            contactEmail.nextElementSibling.classList.add('show-error')
            e.preventDefault()
        }
        else{
            contactEmail.classList.remove('wrong-input')
            contactEmail.nextElementSibling.classList.remove('show-error')
        }

        if(contactName.value === '' || contactName.value.length < 2){
            contactName.classList.add('wrong-input')
            contactName.nextElementSibling.classList.add('show-error')
            e.preventDefault()
        }
        else{
            contactName.classList.remove('wrong-input')
            contactName.nextElementSibling.classList.remove('show-error')
        }

        if(contactSubject.value === '' || contactSubject.value.length < 5){
            contactSubject.classList.add('wrong-input')
            contactSubject.nextElementSibling.classList.add('show-error')
            e.preventDefault()
        }
        else{
            contactSubject.classList.remove('wrong-input')
            contactSubject.nextElementSibling.classList.remove('show-error')
        }

        if(contactMessage.value === '' || contactMessage.value.length < 5){
            contactMessage.classList.add('wrong-input')
            contactMessage.nextElementSibling.classList.add('show-error')
            e.preventDefault()
        }
        else{
            contactMessage.classList.remove('wrong-input')
            contactMessage.nextElementSibling.classList.remove('show-error')
        }
    })
}

/* ======== TIPSY PROJECTS ======== */
tippy('.menu-item-button', {
    content: 'Click to add to cart',
});

