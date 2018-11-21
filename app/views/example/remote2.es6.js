let interval,
    i= 0,
    element= document.getElementById("remote-es6-js");

element.innerHTML= "Fibonacci sequence on .es6.js: "
startFibonacci();
console.log("Remote vanilla ES6.JS ready.")

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
