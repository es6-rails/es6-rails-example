var interval,
    i= 0,
    element= document.getElementById("remote-js");

element.innerHTML= "Fibonacci sequence on .js: "
startFibonacci();
console.log("Remote vanilla .js ready.")

function startFibonacci() {
  interval= setInterval(function() {
    element.innerHTML+= fibonacci(i++) + ", ";
    if (i>10) {stopFibonacci()};
  }, 1000);
}

function stopFibonacci() {
  clearInterval(interval);
  element.innerHTML+= " ...";
}

function fibonacci(n=0) {
   return n>1 ? fibonacci(n-1)+fibonacci(n-2) : n;
}
