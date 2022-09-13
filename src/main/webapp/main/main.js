/**
 * 
 */
 
 
const toggleBtn = document.querySelector('.navbar__toggleBtn');
const menu = document.querySelector('.navbar-menu');
const icons = document.querySelector('.navbar-icons');


toggleBtn.addEventListener('click', ()=> {
	menu.classList.toggle('active');
	icons.classList.toggle('active');
});
// 변수명.addEventListener('click', function() {
// 	변수명.classList.toggle('클래스 명');
// }
 
 
 
 
 
 
 