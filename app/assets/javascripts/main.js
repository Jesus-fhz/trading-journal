//Function show messages dynamically
const message = function(className, message, appendingTo) {
    let el = document.querySelector('.'+appendingTo)
    el.innerHTML = ""
    let div = document.createElement('div');
    div.className = className;
    div.innerHTML = message
    document.querySelector("."+appendingTo).appendChild(div);
}


//Close modal using the X btn
const closeModal = function(){
    const myModal = document.querySelector('.btn-close')
    myModal.click();
}


// Datepicker
const elems = document.querySelectorAll('.datepicker_input');
for (const elem of elems) {
   new Datepicker(elem, {
    format: 'dd-mm-yyyy',
    maxDate: 'today',
    todayHighlight: true,
    clearBtn: true,
   });
}

const confirmation = function(){
    let deleteItem = document.querySelectorAll(".deleteItem")
    deleteItem.forEach(function(item, index){
        item.addEventListener("click",function(){
            const urlPath = item.getAttribute('link_url');
            const title = item.getAttribute('title');
            //Creationg Object Modal 
            let confirmationModal = new bootstrap.Modal(document.getElementById("confirmModal"), {});
            const modalBody  = document.querySelector("#confirmModal .modal-body");
            const actionBtn = document.querySelector("#deleteBtnModal");
            actionBtn.href = urlPath;
            modalBody.innerHTML = `<h5>Are you sure you want to delete the ${title} ? </h5>`;
            confirmationModal.show()
        })
    })
    
}

confirmation();