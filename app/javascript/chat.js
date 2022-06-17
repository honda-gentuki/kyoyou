window.addEventListener('load', function(){
  const sendButton = document.getElementById("area")
  const scrollHeight = document.getElementById("area").scrollHeight;
  const send = document.getElementById("send")
  document.getElementById("area").scrollTop = scrollHeight;

  send.addEventListener('click', function() {
    document.getElementById("area").scrollTop = scrollHeight;
  })
})