const nameInput = document.getElementById('name');
const lastnameInput = document.getElementById('lastname');
const emailInput = document.getElementById('email');
const phoneInput = document.getElementById('phone');
const passwordInput = document.getElementById('password');
const repeatPasswordInput = document.getElementById('repassword');
const passwordErrorLabel = document.getElementById('password-error');
const errorLabel = document.getElementById('reg-error');
const date = document.getElementById('date');
const signUpButton = document.getElementById('button');
const regpass = document.getElementById('reg-pass');
const eErrorLabel = document.getElementById('eErrorLabel');

function register1() {
  var isEmptyField = (
    nameInput.value === "" ||
    lastnameInput.value === "" ||
    phoneInput.value === "" ||
    passwordInput.value === "" ||
    repeatPasswordInput.value === "" ||
    date.value === ""
  );
  if (isEmptyField && event.target.tagName === "BUTTON") {
    errorLabel.style.display = "block";
  } else {
    errorLabel.style.display = "none";
  }
}

// Add a click event listener to the button
signUpButton.addEventListener("click", register1);

// Add an input event listener to each input field
nameInput.addEventListener("input", register1);
lastnameInput.addEventListener("input", register1);
phoneInput.addEventListener("input", register1);
passwordInput.addEventListener("input", register1);
repeatPasswordInput.addEventListener("input", register1);
date.addEventListener("input", register1);




function pass(){
if(nameInput.value !== "" && lastnameInput.value !== "" && emailInput.value !== "" && phoneInput.value !== "" && passwordInput.value !== "" && repeatPasswordInput.value !== "" && date.value !== "" && passwordInput.value === repeatPasswordInput.value){
   regpass.style.display = 'block';
}
else{
  regpass.style.display = 'none';
}
}

signUpButton.addEventListener('click',pass);






