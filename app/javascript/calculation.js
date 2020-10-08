 function price_cal(){
  const item_price = document.getElementById("item-price")

  item_price.addEventListener('input', function(){
    var price = document.getElementById("item-price").value;
    var tax = document.getElementById("add-tax-price");
    var profit = document.getElementById("profit");
    
    tax.innerHTML = (price * 0.1);
    profit.innerHTML = (price * 0.9);
  });
}

window.addEventListener('load', price_cal)