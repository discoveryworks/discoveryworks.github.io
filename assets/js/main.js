// Mobile navigation toggle
document.addEventListener('DOMContentLoaded', function() {
  const navToggle = document.querySelector('.nav__toggle');
  const navMenu = document.querySelector('.nav__menu');

  if (navToggle && navMenu) {
    navToggle.addEventListener('click', function() {
      navMenu.classList.toggle('nav__menu--open');
      navToggle.classList.toggle('nav__toggle--open');
    });
  }

  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });

  // Header scroll effect
  const header = document.querySelector('.site-header');
  let lastScrollTop = 0;

  window.addEventListener('scroll', function() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    if (scrollTop > lastScrollTop && scrollTop > 100) {
      header.style.transform = 'translateY(-100%)';
    } else {
      header.style.transform = 'translateY(0)';
    }

    lastScrollTop = scrollTop;
  });

  // Randomize hero gradient start color
  const hero = document.querySelector('.hero');
  if (hero) {
    const heroClasses = ['hero--pink', 'hero--blue', 'hero--yellow', 'hero--green'];
    const randomClass = heroClasses[Math.floor(Math.random() * heroClasses.length)];
    hero.classList.add(randomClass);
  }
});

// Copy installation command to clipboard
function copyInstallCommand(button, command) {
  navigator.clipboard.writeText(command).then(function() {
    // Store original text
    const originalText = button.textContent;
    
    // Change button text and style
    button.textContent = 'Copied!';
    button.classList.add('installation-notice__copy--copied');
    
    // Reset after 2 seconds
    setTimeout(function() {
      button.textContent = originalText;
      button.classList.remove('installation-notice__copy--copied');
    }, 2000);
  }).catch(function(err) {
    console.error('Failed to copy text: ', err);
  });
}