    var app = new Vue({
    el: '#app',
    data: {
        shopName: "NoneQ Stores",
        open: true,
        login: false,
        showPassword: false,
        username: "",
        password: "",
        verifypassword: "",
        firstname: "",
        lastname: "",
        tel: "",
        center:{
            'd-flex': true,
            'justify-content-center':true,
            'align-items-center':true
        },
        accounts:[
            {
                username: "admin",
                password: "password",
                permission: "5",
                firstname: "",
                lastname: "",
                tel: ""
            },
        ],
    },
    methods: {
        outStore(){
            window.location.href = "./index.html";
        },
        enterStore(){
            if(this.open == true){
                window.location.href = "./instore.html";
            }
            else{
                alert("ขออภัยในขณะนี้ ร้านปิดให้บริการอยู่")
            }
        },
        goLogin(){
            const myJSON = JSON.stringify(this.accounts);
            window.localStorage.setItem('accounts', myJSON);
            window.location.href = "./login.html";
        },
        logout(){
            window.localStorage.setItem('username', "");
            window.localStorage.setItem('loginstatus', false);
            window.location.href = "./login.html";
        },
        loginCheck(){
            this.accounts.forEach((account) =>{
                if(this.username == account.username && this.password == account.password){
                    return this.login = true
                }
            })
            if(this.login == true){
                alert("รหัสถูก")
            }
            else{
                alert("รหัสผิดดดด")
            }
        },
        goRegister(){
            const myJSON = JSON.stringify(this.accounts);
            window.localStorage.setItem('accounts', myJSON);
            window.location.href = "./register.html";
        },
        registerCheck(){
            this.accounts.forEach((account) =>{
                if(this.username == account.username){
                    this.username = ""
                    return alert("มีผู้ใช้งานนี้แล้ว")
                }
            })
            if(this.firstname==""||this.lastname==""||this.tel==""||this.username==""||this.password==""||this.verifypassword==""){
                alert("กรุณากรอกข้อมูลให้ครบ")
            }
            else if(this.tel.length < 10){
                alert("กรุณาเบอร์โทรศัพท์ให้ถูกต้อง")
            }
            else if(this.password != this.verifypassword){
                alert("รหัสผ่านไม่เหมือนกัน")
            }
            else if(this.password.length < 6){
                alert("กรอกรหัสผ่าน 6-20 ตัวอักษร")
            }
            else{
                this.accounts.push({
                    username: this.username,
                    password: this.password,
                    permission: "1",
                    firstname: this.firstname,
                    lastname: this.lastname,
                    tel: this.tel,
                })
                alert("สมัครบัญชีสำเร็จ")
                window.localStorage.setItem('accounts', JSON.stringify(this.accounts));
                window.location.href = "./login.html";
            }

        },
        showpassword(){
            showPassword = !showPassword
        },
        goInStore(){
            window.location.href = "./instore.html";
        },
    },
    computed:{
        loginacct(){
            return (localStorage.getItem('username'));
        },
        loginstatus(){
            return JSON.parse(localStorage.getItem('loginstatus'));
        },
    },
    watch:{
        accounts:{
            handler: function(val, oldVal) {
                window.localStorage.setItem('accounts', JSON.stringify(val));
            },
            deep: true
        },
    },
})