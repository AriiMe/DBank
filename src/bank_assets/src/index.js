import { bank } from "../../declarations/bank";

window.addEventListener("load", async function() {
  update();
});

document.querySelector("form").addEventListener("submit", async function() {
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");
  
  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0){
    await bank.topUp(inputAmount);
  }
  
  if (document.getElementById("withdrawal-amount").value.length != 0){
    await bank.withdrawl(outputAmount);
  }

  await bank.compound();


  update();

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  button.removeAttribute("disabled");
});

async function update() {
  const currentAmount = await bank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
};