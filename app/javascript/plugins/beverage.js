const beverages = document.querySelectorAll('.beverages')


function showHide(beverage) {
    let beverageList = beverage.currentTarget.querySelector(".showhide");
    if(!beverageList) { return }
    beverageList.style.display = beverageList.style.display === "none" ? "block" : "none"
}


beverages.forEach(function(beverage){
    beverage.addEventListener('click', showHide);
});

export { showHide }