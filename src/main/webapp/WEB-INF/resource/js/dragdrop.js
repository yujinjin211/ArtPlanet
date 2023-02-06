/**
 * 
 */

const dropBox = document.querySelector('.dropBox');
const previews = document.querySelector('.image-box');
const fileDOM = document.querySelector('#uploadFile');

//박스 안에 drag 하고 있을 때
dropBox.addEventListener('dragover', function (e) {
  e.preventDefault();
  this.style.backgroundColor = 'rgb(13 110 253 / 25%)';
});

//박스 밖으로 drag가 나갈 때
dropBox.addEventListener('dragleave', function (e) {
  this.style.backgroundColor = '#f1f1f1';
});

//박스 안에 drop 했을 때
dropBox.addEventListener('drop', function (e) {
  e.preventDefault();
  // this.style.backgroundColor = '#ccc';

  console.dir(e.dataTransfer);
  
  var data = e.dataTransfer.files[0];
  console.dir(data);
  
  const imageSrc = URL.createObjectURL(e.dataTransfer.files[0]);
  previews.src = imageSrc;
  
});

fileDOM.addEventListener('change', () => {
  const imageSrc = URL.createObjectURL(fileDOM.files[0]);
  previews.src = imageSrc;
});

