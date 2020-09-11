  function price_calc(){
    //HTMLの要素取得（販売価格・手数料・利益）
    const price = document.getElementById("item-price") || document.createElement('input');
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    //販売価格に入力があった時イベント発火
    price.addEventListener('input', () => {
      //valueプロパティで販売価格の取得
      const value = price.value; 
      if (value >= 300 && value <= 9999999){
        let fee = Math.floor(value * 0.1);
        let gains = value - fee;
        tax.textContent = fee;
        profit.textContent = gains;
      } else {
        let fee = '-';
        let gains = '-';
        tax.textContent = fee;
        profit.textContent = gains;
      }
    });
  }
window.addEventListener('load', price_calc);