window.addEventListener("load", function() {

  document.getElementById("btn1").onclick = function() {
    var removeElem = document.getElementById('imagebox1');
    removeElem.parentNode.removeChild(removeElem);
  };
  document.getElementById("btn2").onclick = function() {
    var removeElem = document.getElementById('imagebox2');
    removeElem.parentNode.removeChild(removeElem);
  };
  document.getElementById("btn3").onclick = function() {
    var removeElem = document.getElementById('imagebox3');
    removeElem.parentNode.removeChild(removeElem);
  };
  document.getElementById("btn4").onclick = function() {
    var removeElem = document.getElementById('imagebox4');
    removeElem.parentNode.removeChild(removeElem);
  };
  document.getElementById("btn5").onclick = function() {
    var removeElem = document.getElementById('imagebox5');
    removeElem.parentNode.removeChild(removeElem);
  };
});