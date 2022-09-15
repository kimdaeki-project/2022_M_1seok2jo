let getAuth = document.querySelector("#getAuth")

getAuth.addEventListener("click", function(){
    let idAuth = document.querySelector("#idAuth")
    let pwAuth = document.querySelector("#pwAuth")
    let authNum = document.querySelector("#authNum")
    let authMessage = document.getElementById("authMessage")
    
    console.log(idAuth.value+pwAuth.value+authNum.value)

    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./auth");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhttp.send("id="+idAuth.value+"&pw="+idAuth.value+"&authNum="+authNum.value)
    xhttp.addEventListener("readystatechange", function(){
        console.log(this.readyState+this.status)
        if(this.readyState==4 && this.status==200){
            if(xhttp.responseText.trim()=="1"){
                authMessage.innerHTML="인증이완료되었습니다"
            }else{
                alert("수정실패")
            }
        }
    })

})