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
        center:{
            'd-flex': true,
            'justify-content-center':true,
            'align-items-center':true
        }
        
    },
    methods: {
        enterStore(){
            if(this.open == true){
                window.location.href = "./in_store.php";
                this.accounts = JSON.parse(localStorage.getItem('accounts'));
            }
            else{
                alert("ขออภัยในขณะนี้ ร้านปิดให้บริการอยู่")
            }
        },
        goLogin(){
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
                alert("รหัสผิด")
            }
        },
        goRegister(){
            window.location.href = "./register.html";
            this.accounts = JSON.parse(localStorage.getItem('accounts'));
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
            }

        },
        showpassword(){
            showPassword = !showPassword
        },
    },
    computed:{
        // accounts(){
        //     return JSON.parse(localStorage.getItem('accounts'));
        // },
    },
    watch:{
        accounts(newAccount){
            const myJSON = JSON.stringify(newAccount);
            window.localStorage.setItem('accounts', myJSON);
            
        },
    }
})