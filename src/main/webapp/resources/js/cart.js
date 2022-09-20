const del = document.querySelectorAll(".del");
const del1 = document.querySelectorAll("#del");

del.forEach(function(del1){
    del1.addEventListener("click",function(event){
        let d = event.target;
        let cart_num = d.parentNode.parentNode.childNodes[9].childNodes[3].value;

        console.log(cart_num);

        const xhttp = new XMLHttpRequest();

        xhttp.open("POST","../cart/setCartDelete");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        
        xhttp.send("cart_num=" + cart_num);

        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                let result = xhttp.responseText.trim();
                console.log(result);
                
                result = JSON.parse(result);
                if(result == 1) {
                    alert("장바구니 삭제 성공");
                    
                    window.location.href="./cart";
                    
                }else {
                    alert("장바구니 담기 실패");
                }
            }
        }
    })
})