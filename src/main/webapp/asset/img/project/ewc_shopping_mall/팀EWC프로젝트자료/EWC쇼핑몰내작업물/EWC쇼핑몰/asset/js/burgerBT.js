const hamburgerBtn = document.querySelector('.hamburger-btn');
const sidebar = document.querySelector('.sidebar');
const closeBtn = document.querySelector('.close-btn');
const category1 = document.querySelector('.category[data-category="1"]');
const category2 = document.querySelector('.category[data-category="2"]');
const category3 = document.querySelector('.category[data-category="3"]');
const category4 = document.querySelector('.category[data-category="4"]');
const category5 = document.querySelector('.category[data-category="5"]');

hamburgerBtn.addEventListener('click', () => {
  sidebar.classList.toggle('active');
});

closeBtn.addEventListener('click', () => {
  sidebar.classList.remove('active');
});

category1.addEventListener('click', () => {
  showProductsForCategory(1);
});

category2.addEventListener('click', () => {
  showProductsForCategory(2);
});

category3.addEventListener('click', () => {
  showProductsForCategory(3);
});

category4.addEventListener('click', () => {
  showProductsForCategory(4);
});

category5.addEventListener('click', () => {
  showProductsForCategory(5);
});

const productList = document.querySelector('.product-list');

function showProductsForCategory(categoryNumber) {
  productList.innerHTML = '아쿠아타이머 '+' 오토메틱';

  const imageContainer = document.getElementById('imageContainer');

  const imageUrls = {
    1:'/image/category1.png',
    2:'/image/category2.png',
    3:'/image/category3.png',
    4:'/image/category4.png',
    5:'/image/category5.png',
  };

  const categoryImge = document.createElement('img');
  categoryImage.src = imageUrls[categoryNumber];

  imageContainer.innerHTML = '';
  imageContainer.appendChild(categoryImge);

  for (let i = 1; i <= 4; i++) {
    const productItem = document.createElement('li');
    productItem.textContent = `카테고리${categoryNumber} 상품 ${i}`;
    productList.appendChild(productItem);
  }

}