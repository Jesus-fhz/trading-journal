const message = function(className, message, appendingTo) {
    let el = document.querySelector('.'+appendingTo)
    el.innerHTML = ""
    let div = document.createElement('div');
    div.className = className;
    div.innerHTML = message
    document.querySelector("."+appendingTo).appendChild(div);
}

const closeModal = function(){
    const myModal = document.querySelector('.btn-close')
    myModal.click();
}
