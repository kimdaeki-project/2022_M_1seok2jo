const addfiles = document.querySelector("#addFiles");
const addvideos = document.querySelector("#addVideos");
const videoAdd = document.querySelector("#videoAdd");
const sub = document.querySelector("#sub");
const l_contents = document.querySelector("#l_contents");
const add = document.querySelector("#add");
const files = document.querySelector("#files");
const l_date = document.querySelector("#l_date");
const div1 = document.querySelector("#div1");
const l_price = document.querySelector("#l_price");
const div2 = document.querySelector("#div2");


let count = 0; //동영상 번호
let idx = 0; //파일 사진 번호

files.addEventListener("change",function(){
    let filedata = new FormData();
    filedata.append("file",files.files[0]);
    filedata.append("path","lecture");

    $.ajax({
        type: "POST",
        enctype: 'multipart/form/data',
        url: "http://20.249.88.100/uploadFile",
        data: filedata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,

        success: function(dt) {
            console.log(dt);
            console.log(files.files[0].name)

            let inputf_name = document.createElement("input")
                let typei = document.createAttribute("type")
                typei.value="text"
                let typei2 = document.createAttribute("name")
                typei2.value="oriname"
                let typei3 = document.createAttribute("class")
                typei3.value = "form-control"
                let typei4 = document.createAttribute("value")
                typei4.value= files.files[0].name
                let typei5 = document.createAttribute("readonly")
    
                inputf_name.setAttributeNode(typei)
                inputf_name.setAttributeNode(typei2)
                inputf_name.setAttributeNode(typei3)
                inputf_name.setAttributeNode(typei4)
                inputf_name.setAttributeNode(typei5)
                
                addfiles.append(inputf_name)
    
                //fname input
                inputf_name = document.createElement("input")
                typei = document.createAttribute("type")
                typei.value="text"
                typei2 = document.createAttribute("name")
                typei2.value="f_name"
                typei3 = document.createAttribute("style")
                typei3.value = "display: none"
                typei4 = document.createAttribute("value")
                typei4.value= dt
    
                inputf_name.setAttributeNode(typei)
                inputf_name.setAttributeNode(typei2)
                inputf_name.setAttributeNode(typei3)
                inputf_name.setAttributeNode(typei4)
                
                addfiles.append(inputf_name);


        },
        error: function(e) {
            alert('파일 업로드 실패');
        }
    })
})

videoAdd.addEventListener("click",function() {
    // <div class="mt-4 mb-3" id="video+count">
    //      <div>
    //      <label for="v_url" class="form-label">동영상 (+idx) url 주소</label>
    //      </div>
    //      <input class="form-control" type="text" id="v_url" name="v_url">
    //      <label for="v_context" class="form-label">동영상 (+idx) 제목</label>
    //      <input class="form-control" type="text" id="v_context" name="v_context">
    // </div>
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

      addvideos.appendChild(d);

     count++;

 })

addvideos.addEventListener("click",function(event){
    let button = event.target;

    if(button.classList[0] == 'del') {
        document.getElementById("video"+button.title).remove();
        
    }

});

sub.addEventListener("click",function(){
    var str = document.getElementById("l_contents").value;
    str = str.replace(/(?:\r\n|\r\n)/g,'<br />');
    document.getElementById("l_contents").innerHTML = str;

    add.submit();
})

var pattern_num = /[1-9999999]/; //숫자
var pattern_eng = /[a-zA-Z]/;	// 문자 
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크

l_date.addEventListener("blur",function(){
    console.log("blur");
    console.log(l_date.value);
    if((pattern_num.test(l_date.value)) && !(pattern_eng.test(l_date.value)) && !(pattern_spc.test(l_date.value)) && !(pattern_kor.test(l_date.value))) {
        console.log("true");
        div1.innerHTML="";
        return true;
    } else{
        console.log("false");
        div1.innerHTML = "❗숫자만 작성해주세요";
        l_date.value="";
        return false;
    }
    
});

l_price.addEventListener("blur",function(){
    console.log("blur");
    console.log(l_price.value);
    if((pattern_num.test(l_price.value)) && !(pattern_eng.test(l_price.value)) && !(pattern_spc.test(l_price.value)) && !(pattern_kor.test(l_price.value))) {
        console.log("true");
        div2.innerHTML="";
        return true;
    } else{
        console.log("false");
        div2.innerHTML = "❗숫자만 작성해주세요";
        l_price.value="";
        return false;
    }
    
});


