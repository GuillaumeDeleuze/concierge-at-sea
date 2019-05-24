const characters = document.querySelectorAll('.character');
let character = document.getElementById('guest_preference_character');

const interests = document.querySelectorAll('.interest');
let interest = document.getElementById('guest_preference_interest');

const foodPreferences = document.querySelectorAll('.food_preference');
let foodPreference = document.getElementById('guest_preference_food_preference');

const beveragePreferences = document.querySelectorAll('.beverage_preference');
let beveragePreference = document.getElementById('guest_preference_beverage_preference');

const alcoholPreferences = document.querySelectorAll('.alcohol_preference');
let alcoholPreference = document.getElementById('guest_preference_alcohol_preference');




function addCharacterPreference(e) {
    let checkbox = e.currentTarget.querySelector(".checkbox");
    const text = e.currentTarget.textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
    let newText = character.value.replace(`${text}, `, '');

    if (checkbox.checked === true ) {
      character.value += `${text}, `  
    } else {
     character.value = newText
    };
};

function addInterestPreference(e) {
    let checkbox = e.currentTarget.querySelector(".checkbox");
    const text = e.currentTarget.textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
    let newText = interest.value.replace(`${text}, `, '');

    if (checkbox.checked === true ) {
      interest.value += `${text}, `  
    } else {
     interest.value = newText
    };
};

function addFoodPreference(e) {
    let checkbox = e.currentTarget.querySelector(".checkbox");
    const text = e.currentTarget.textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
    let newText = foodPreference.value.replace(`${text}, `, '');

    if (checkbox.checked === true ) {
      foodPreference.value += `${text}, `  
    } else {
     foodPreference.value = newText
    };
};

function addBeveragePreference(e) {
    let checkbox = e.currentTarget.querySelector(".checkbox");
    const text = e.currentTarget.textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
    let newText = beveragePreference.value.replace(`${text}, `, '');

    if (checkbox.checked === true ) {
      beveragePreference.value += `${text}, `  
    } else {
     beveragePreference.value = newText
    };
};

function addAlcoholPreference(e) {
    let checkbox = e.currentTarget.querySelector(".checkbox");
    const text = e.currentTarget.textContent.replace(/[\n\r]+|[\s]{2,}/g, ' ').trim();
    let newText = alcoholPreference.value.replace(`${text}, `, '');

    if (checkbox.checked === true ) {
      alcoholPreference.value += `${text}, `  
    } else {
     alcoholPreference.value = newText
    };
};






characters.forEach(function(character){
  character.addEventListener('click', addCharacterPreference);
});

interests.forEach(function(interest){
  interest.addEventListener('click', addInterestPreference);
});

foodPreferences.forEach(function(foodPreference){
  foodPreference.addEventListener('click', addFoodPreference);
});

beveragePreferences.forEach(function(beveragePreference){
  beveragePreference.addEventListener('click', addBeveragePreference);
});

alcoholPreferences.forEach(function(alcoholPreference){
  alcoholPreference.addEventListener('click', addAlcoholPreference);
});

export { addCharacterPreference };
export { addInterestPreference };
export { addFoodPreference };
export { addBeveragePreference };
export { addAlcoholPreference };
