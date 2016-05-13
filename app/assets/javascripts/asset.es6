document.addEventListener('DOMContentLoaded', function(){
  let interval,
      i= 0,
      button= document.getElementById("asset-es6-button"),
      element= document.getElementById("asset-es6");

  if (button) {
    button.onclick= function(){
      element.innerHTML= "Fibonacci sequence: "
      startFibonacci();
    }
    console.log("Asset vanilla ES6 ready")
  }

  function startFibonacci(limit=10){
    interval= setInterval(() => {
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
