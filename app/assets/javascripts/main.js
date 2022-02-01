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

//Creating note using Rich Editor
const creatingEditor = function(){
    const form = document.querySelector("#journal_form");
    if (form !== undefined && form !== null){
        const formTrigger = form.querySelector("input[type='submit']");
        const notesValue  = form.querySelector("#journal_notes");
        const divEditor = document.querySelector("#editor");
        const editing_note = divEditor.getAttribute('editing_note')
        const quill = new Quill(divEditor, {
            modules: {
              toolbar: [
                [{'header': [1,2,3,4,5,6, false]}],
                [{'size':['small',false,'large','huge']}],
                ['bold', 'italic', 'underline', 'strike',{'color':[]}],
                ['link', 'blockquote', 'code-block', 'image'],
                [{ list: 'ordered' }, { list: 'bullet' }]
              ]
            },
            theme: 'snow'  // or 'bubble' to show notes without toolbar
          });
        if(editing_note !== "undefined" && editing_note !== null && editing_note !== ""){
            const parseNote = parseNotes(editing_note);
            parseNote !== false ?  quill.setContents(parseNote) : quill.setContents([{ insert: editing_note}])
            quill.enable(true);
        }
        formTrigger.addEventListener('click',function(event){
            event.preventDefault();
            const content = JSON.stringify(quill.getContents()); //Get content of rich editor and parse to string to be able to save in the DB
            notesValue.value  = content;
            form.submit();
        });
        
    }
}



//Waching notes
const editingNotes = function(){
      const allNotes = document.querySelectorAll(".view-note-unique");
      if (allNotes.length >= 1){
          allNotes.forEach(function(item){
                const notes = item.children[0];
                const quill = item.children[1];
                const editor = new Quill(quill, {
                    modules: {},
                    theme: 'bubble'  // or 'bubble' to show notes without toolbar
                  });
                  editor.enable(false);
                  const parsedNote = parseNotes(notes.value)
                  parsedNote !== false ?  editor.setContents(parsedNote) : editor.setContents([{ insert: notes.value}])
          })
      }
}

const parseNotes = function(notes){
    try {
        const noteStr = JSON.parse(notes);
        if (noteStr && typeof noteStr === "object") {
            return noteStr
        }
    }
    catch (e) {
        return false;
     }
}

window.addEventListener('load', (event) => {
    confirmation();
    creatingEditor();
    editingNotes();
  });