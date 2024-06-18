window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addPofitDom = document.getElementById("profit");

  const calculateFeesAndProfit = () => {
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1));
  };

  calculateFeesAndProfit();

  priceInput.addEventListener('input', calculateFeesAndProfit);
});