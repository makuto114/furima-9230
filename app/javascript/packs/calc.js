window.addEventListener('load', () => {

  const priceInput = document.getElementById('item-price');
  const priceTax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit')
  priceInput.addEventListener('input', () => {
    inputValue = priceInput.value
    priceTax.innerHTML = Math.floor(inputValue / 10)
    profit.innerHTML = inputValue - priceTax.innerHTML
})
})

