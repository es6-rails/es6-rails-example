document.addEventListener('DOMContentLoaded', function() {
  var interval,
      i= 0,
      button= document.getElementById("asset-js-button"),
      element= document.getElementById("asset-js");

  if (button) {
    button.onclick = function() {
      element.innerHTML= "Fibonacci sequence: "
      startFibonacci();
    }
    console.log("Asset vanilla JS ready")
  }

  function startFibonacci(){
    interval = setInterval(function() {
      element.innerHTML+= fibonacci(i++) + ", ";
      if (i>10) {stopFibonacci()};
    }, 1000);
  }

  function stopFibonacci(){
    clearInterval(interval);
    element.innerHTML+= " ...";
  }

  function fibonacci(n=0) {
     return n>1 ? fibonacci(n-1)+fibonacci(n-2) : n;
  }
}, false);
