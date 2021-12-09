function math(){
  const itemPrice = document.getElementById("item-price");
  if (!itemPrice){ return false;};
  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const pay = 0.1
    const profit = document.getElementById("profit");
    const payForShopping = Math.floor(itemPrice.value * pay);
    addTaxPrice.innerHTML = payForShopping;
    profit.innerHTML = itemPrice.value - payForShopping;
  });
};

window.addEventListener("load", math);