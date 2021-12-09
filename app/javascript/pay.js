const pay = () => {
  Payjp.setPublicKey("pk_test_ed2ee4b55343edc173eaf052");
  const button = document.getElementById("charge-form");
  button.addEventListener("submit", (e)=>{
    e.preventDefault();
    const chargeForm = document.getElementById("charge-form");
    const formData = new FormData(chargeForm);

    const card = {
      number: formData.get("order_buyer[number]"),
      exp_month: formData.get("order_buyer[exp_month]"),
      exp_year: `20${formData.get("order_buyer[exp_year]")}`,
      cvc: formData.get("order_buyer[cvc]")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const insertToken = document.getElementById("charge-form");
        const tokenTag = `<input value=${token} name='token' type="hidden">`;
        insertToken.insertAdjacentHTML("beforeend", tokenTag);
        debugger
      }
    });
  });
  
}; 


window.addEventListener("load", pay);