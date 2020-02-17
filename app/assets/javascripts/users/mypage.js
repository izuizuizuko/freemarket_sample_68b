window.addEventListener("load", function() {
    let tabs = document.getElementsByClassName("buys__status");
    tabsAry = Array.prototype.slice.call(tabs);
  
    function tabSwitch() {
      document.getElementsByClassName("active")[0].classList.remove("active");
  
      this.classList.add("active");
  
      document.getElementsByClassName("show")[0].classList.remove("show");
  
      const index = tabsAry.indexOf(this);
  
      document.getElementsByClassName("buy-goods__status")[index].classList.add("show");
    }
    tabsAry.forEach(function(value) {
      value.addEventListener("click", tabSwitch);
    });
  });