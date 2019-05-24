document.querySelectorAll('.anim-toggle').forEach((button)=>{
    button.querySelectorAll('select').forEach((select)=>{
    select.addEventListener("click", (e)=>{
      e.preventDefault;
      e.stopPropagation();
    });
  });
});