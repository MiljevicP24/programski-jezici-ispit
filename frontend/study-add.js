const name =  document.getElementById('name')

document.getElementById('save').addEventListener('click',()=>  {
    if(name.value==null || name.value == ''){
        alert('Naziv smera ne sme biti prazan')
        return
    }


    fetch('http://localhost:8000/api/study-programme',{
        method: 'POST',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            name: name.value,

        })
    }).then(rsp=>{
        if(rsp.ok){
            window.location.href = './study-programme.html'
            return
        }
        alert(`Unos smera nije uspelo(HTTP ${rsp.status})`)
    })
})

