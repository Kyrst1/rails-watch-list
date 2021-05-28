import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Change your life", "Watch good movies", "And make lists"],
    typeSpeed: 55,
    loop: true
  });
}

export { loadDynamicBannerText };