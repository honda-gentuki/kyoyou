window.addEventListener('load', function(){
  const open = document.getElementById('open');
  const overlay = document.querySelector('.overlay');
  const close = this.document.getElementById('close');

  open.addEventListener('click',() => {
    overlay.classList.add('show');
    open.classList.add('hide')
  });

  close.addEventListener('click',() => {
    overlay.classList.remove('show');
    open.classList.remove('hide')
  });
});