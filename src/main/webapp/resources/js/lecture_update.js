const video_add = document.querySelector("#video_add");
const video_adds = document.querySelector(".video_adds");
const video_del = document.querySelectorAll("#video_del");
const video_dels = document.querySelectorAll(".video_dels");
const img_change = document.querySelector("#img_change");
const img_changee = document.querySelector(".img_change");
const video_change = document.querySelector(".video_change");
const ot_change = document.querySelector("#ot_change");


let count = 0;
let idx=0;

function setCount(ct) {
    if(ct>=0) {
        count=ct;
    }
}

video_add.addEventListener("click",function(){
    let d = document.createElement("div");
    let c = document.createAttribute("class");
    c.value = "mt-4 mb-3";
    d.setAttributeNode(c);
    c= document.createAttribute("id");
    c.value = "video"+count;
    d.setAttributeNode(c);
    //-----------------------------------------------------
    let d1 = document.createElement("div");
    let l = document.createElement("label");
    let f = document.createAttribute("for");
    f.value = "v_url";
    let c1 = document.createAttribute("class");
    c1.value = "form-label";
    let t = document.createTextNode("동영상 url 주소");

    l.setAttributeNode(f);
    l.setAttributeNode(c1);
    l.appendChild(t);

    d1.appendChild(l);
    d.appendChild(d1);

    //-------------------------------------------------------
    let d2 = document.createElement("div");
    let i = document.createElement("input");
    let c2 = document.createAttribute("class");
    c2.value = "form-control";
    let t1 = document.createAttribute("type");
    t1.value="text";
    let i1 = document.createAttribute("id");
    i1.value = "v_url";
    let n = document.createAttribute("name");
    n.value = "v_url"

    i.setAttributeNode(c2);
    i.setAttributeNode(t1);
    i.setAttributeNode(i1);
    i.setAttributeNode(n);

    d2.appendChild(i);
    d.appendChild(d2);

//     //--------------------------------------------------------------
    let d4 = document.createElement("div");
    let l1 = document.createElement("label");
    let f1 = document.createAttribute("for");
    f1.value = "v_context";
    let c4 = document.createAttribute("class");
    c4.value = "form-label";
    let t4 = document.createTextNode("동영상 제목");

    l1.setAttributeNode(f1);
    l1.setAttributeNode(c4);
    l1.appendChild(t4);

    d4.appendChild(l1);
    d.appendChild(d4);

//     //------------------------------------------------------
    let d5 = document.createElement("div");
    let i2 = document.createElement("input");
    let c5 = document.createAttribute("class");
    c5.value = "form-control";
    let t5 = document.createAttribute("type");
    t5.value="text";
    let i3 = document.createAttribute("id");
    i3.value = "v_context";
    let n1 = document.createAttribute("name");
    n1.value = "v_context";

    i2.setAttributeNode(c5);
    i2.setAttributeNode(t5);
    i2.setAttributeNode(i3);
    i2.setAttributeNode(n1);

    d5.appendChild(i2);
    d.appendChild(d5);

    let d3 = document.createElement("div");
    let b = document.createElement("button");
    let c3 = document.createAttribute("class");
    c3.value = "del btn btn-danger";
    let t2 = document.createTextNode("삭제");
    let t3 = document.createAttribute("type");
    t3.value="button";


    b.setAttributeNode(c3);
    b.setAttributeNode(t3);
    b.appendChild(t2);


    t3 = document.createAttribute("title");
    t3.value = count;
    b.setAttributeNode(t3);

    d3.appendChild(b);
    d.appendChild(d3)

      video_adds.appendChild(d);

     count++;

});

video_adds.addEventListener("click",function(event){
    let button = event.target;

    if(button.classList[0] == 'del') {
        document.getElementById("video"+button.title).remove();
        
    }

});

video_dels.forEach(function(video_del){
    video_del.addEventListener("click",function(event){
        let check = window.confirm("삭제하시겠습니까?");
        let v = event.target.parentNode.parentNode;
        console.log(v);
        
        //check = true면 ajax로 v_num 보내서 삭제
        if(check) {
            let v_num = video_del.getAttributeNode("data-del-num").value;
            //console.log(v_num);
            const xhttp = new XMLHttpRequest();

            xhttp.open("POST","../lecture/setVideoDelete");
    
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    
            
            xhttp.send("v_num="+v_num);
    
            xhttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    let result = xhttp.responseText.trim();
                    console.log(result);
                    
                    result = JSON.parse(result);
                    if(result == 1) {
                            v.remove();
                            
                        alert("동영상 삭제 성공");
                                
                            
                    }else {
                        alert("동영상 삭제 실패");
                    }
                }
        }
        
    }else {
        alert("동영상 삭제 취소");
    }

    })

})

let countt = 0;
ot_change.addEventListener("click",function(){
    if(countt>0) {
        alert("추가 안됩니다.");
    }else{
        let d = document.createElement("div");
        let c = document.createAttribute("class");
        c.value = "mt-4 mb-3";
        d.setAttributeNode(c);
        c= document.createAttribute("id");
        c.value = "video"+count;
        d.setAttributeNode(c);
        //-----------------------------------------------------
        let d1 = document.createElement("div");
        let l = document.createElement("label");
        let f = document.createAttribute("for");
        f.value = "v_url";
        let c1 = document.createAttribute("class");
        c1.value = "form-label";
        let t = document.createTextNode("동영상 url 주소");

        l.setAttributeNode(f);
        l.setAttributeNode(c1);
        l.appendChild(t);

        d1.appendChild(l);
        d.appendChild(d1);

        //-------------------------------------------------------
        let d2 = document.createElement("div");
        let i = document.createElement("input");
        let c2 = document.createAttribute("class");
        c2.value = "form-control";
        let t1 = document.createAttribute("type");
        t1.value="text";
        let i1 = document.createAttribute("id");
        i1.value = "v_url";
        let n = document.createAttribute("name");
        n.value = "v_url"

        i.setAttributeNode(c2);
        i.setAttributeNode(t1);
        i.setAttributeNode(i1);
        i.setAttributeNode(n);

        d2.appendChild(i);
        d.appendChild(d2);

    //     //--------------------------------------------------------------
        let d4 = document.createElement("div");
        let l1 = document.createElement("label");
        let f1 = document.createAttribute("for");
        f1.value = "v_context";
        let c4 = document.createAttribute("class");
        c4.value = "form-label";
        let t4 = document.createTextNode("동영상 제목");

        l1.setAttributeNode(f1);
        l1.setAttributeNode(c4);
        l1.appendChild(t4);

        d4.appendChild(l1);
        d.appendChild(d4);

    //     //------------------------------------------------------
        let d5 = document.createElement("div");
        let i2 = document.createElement("input");
        let c5 = document.createAttribute("class");
        c5.value = "form-control";
        let t5 = document.createAttribute("type");
        t5.value="text";
        let i3 = document.createAttribute("id");
        i3.value = "v_context";
        let n1 = document.createAttribute("name");
        n1.value = "v_context";

        i2.setAttributeNode(c5);
        i2.setAttributeNode(t5);
        i2.setAttributeNode(i3);
        i2.setAttributeNode(n1);

        d5.appendChild(i2);
        d.appendChild(d5);

        let d3 = document.createElement("div");
        let b = document.createElement("button");
        let c3 = document.createAttribute("class");
        c3.value = "vdel btn btn-danger";
        let t2 = document.createTextNode("삭제");
        let t3 = document.createAttribute("type");
        t3.value="button";



        b.setAttributeNode(c3);
        b.setAttributeNode(t3);
        b.appendChild(t2);

        t3 = document.createAttribute("title");
        t3.value = count;
        b.setAttributeNode(t3);

        d3.appendChild(b);
        d.appendChild(d3)

        video_change.appendChild(d);
        console.log(countt);
        countt++

    }
})

video_change.addEventListener("click",function(event){
    let button = event.target;

    if(button.classList[0] == 'vdel') {
        document.getElementById("video"+button.title).remove();
        countt--
        
    }

});

img_change.addEventListener("click",function(){

    if(idx>0) {
        alert("추가 안됩니다.");
    }else {

   
    let d = document.createElement("div");
    let c = document.createAttribute("class");
    c.value = "mt-4 mb-3";
    d.setAttributeNode(c);
    c= document.createAttribute("id");
    c.value = "file"+idx;
    d.setAttributeNode(c);
    let d1 = document.createElement("div");
    let l = document.createElement("label");
    let f = document.createAttribute("for");
    f.value = "files";
    let c1 = document.createAttribute("class");
    c1.value = "form-label";
    let t = document.createTextNode("File");

    l.setAttributeNode(f);
    l.setAttributeNode(c1);
    l.appendChild(t);

    d1.appendChild(l);
    d.appendChild(d1);

    let d2 = document.createElement("div");
    let i = document.createElement("input");
    let c2 = document.createAttribute("class");
    c2.value = "form-label";
    let t1 = document.createAttribute("type");
    t1.value="file";
    let i1 = document.createAttribute("id");
    i1.value = "files";
    let n = document.createAttribute("name");
    n.value = "files";

    i.setAttributeNode(c2);
    i.setAttributeNode(t1);
    i.setAttributeNode(i1);
    i.setAttributeNode(n);

    d2.appendChild(i);
    d.appendChild(d2);

    let d3 = document.createElement("div");
    let b = document.createElement("button");
    let c3 = document.createAttribute("class");
    c3.value = "idel btn btn-danger";
    let t2 = document.createTextNode("삭제");
    let t3 = document.createAttribute("type");
    t3.value="button";


    b.setAttributeNode(c3);
    b.setAttributeNode(t3);
    b.appendChild(t2);


    t3 = document.createAttribute("title");
    t3.value = idx;
    b.setAttributeNode(t3);

    d3.appendChild(b);
    d.appendChild(d3)

    img_changee.appendChild(d);

    idx++;
    }


})

img_changee.addEventListener("click",function(event){
    let button = event.target;

    if(button.classList[0] == 'idel') {
        document.getElementById("file"+button.title).remove();
        idx--;

    }

});