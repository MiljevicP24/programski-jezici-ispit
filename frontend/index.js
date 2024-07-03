const table = document.getElementById('table')
const template = document.getElementById('student')

const searchTitle= document.getElementById('search-title')

if (searchParam != null && searchParam != '') {

    searchTitle.innerText= 'Pretraga studenata'
    fetchStudents('/indeks/' + searchParam)
} else {
     searchTitle.innerText= 'Lista studenata'
    fetchStudents()
}


function fetchStudents(url= '') {
    fetch(`http://localhost:8000/api/student${url}`)
        .then(rsp => rsp.json())
        .then(data => {
            if (data.lenght == 0) {
                alert('Student nije pronađen')
                fetchStudents()
                return
            }
            data.forEach(student => {
                const copy = template.content.cloneNode(true)
                copy.querySelector('.id').innerText = student.id
                copy.querySelector('.name').innerText = student.name
                copy.querySelector('.prezime').innerText = student.prezime
                copy.querySelector('.indeks').innerText = student.indeks
                copy.querySelector('.study').innerText = student.studyProgramme.name
                copy.querySelector('.created').innerText = formatDate(student.createdAt)
                copy.querySelector('.updated').innerText = formatDate(student.updatedAt)
                copy.querySelector('.edit').href = `./edit.html?id=${student.id}`
                copy.querySelector('.remove').addEventListener('click',()=>{
                    if(confirm(`Želite li da obrišete studenta? ${student.name} ${student.prezime} ${student.indeks}`)){
                        fetch(`http://localhost:8000/api/student/${student.id}`,{
            
                            method: 'DELETE',
            
                        })
                        .then(rsp=>{
                            if(rsp.status == 204){
                                window.location.href = './index.html'
                                return
                            }
                            alert(`Brisanje studenta nije uspelo(HTTP ${rsp.status})`)
                        })
                    }
                })
                table.appendChild(copy)
            })
        })

}

