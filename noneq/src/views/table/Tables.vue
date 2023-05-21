<style>
.test{
    height: 50px;
    width: 50px;
    background: red;
}
.grid{
    display: grid;
    grid-template-columns: auto auto auto auto auto;
    gap: 10vh;
    padding: 10px;
}
.tables{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: white;
    width:7vw;
    height: 4vw;
    border-radius: 10%;
}

</style>

<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="grid">
                <div :class="center" v-for="table in tables" :key="table.table_num">
                    <div class="tables" :class="{
                        'bg-primary': ((table.table_status == 'unavailable') && (table.username == account.username)),
                        'bg-success': (table.table_status == 'available'),
                        'bg-warning': (
                            (table.table_status == 'booked' && table.username == account.username)
                            || (table.table_status == 'booked' && account.permission == 'staff')
                            ),
                        'bg-danger': (
                            (table.table_status == 'unavailable' && table.username != account.username) 
                            || (table.table_status=='booked' && table.username!=account.username && account.permission != 'staff')),
                        }" @click="selectTable(table.table_num)">
                        {{table.table_num}}
                    </div>
                </div>
            </div>	
        </div>
    </div>
</template>

<script>
import axios from "axios";
export default {
  name: "TablesPage",
  data() {
    return {
      previousRoutes: [],
      tables: [],
      account: {},
      haveTable: false,
      center:{
        'd-flex': true,
        'justify-content-center':true,
        'align-items-center':true
      },
    };
  },
  mounted() {
    this.getTables();
    if(this.$cookies.isKey('account')){
        this.account = this.$cookies.get('account')
        this.checkhaveTable();
    }else{
        this.account = { username: "" };
    }
  },
  methods: {
    getTables() {
      axios.get("http://localhost:3000")
        .then(response => {
          this.tables = response.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    async checkhaveTable() {
        const data = {
            username: this.account.username,
        }
        axios.post("http://localhost:3000/table/haveTable", data)
        .then(response => {
            this.haveTable = response.data.result
            console.log(this.haveTable)
        })
        .catch(err => {
            console.log(err);
        });
    },
    selectTable(tableNum){
        if(this.$cookies.isKey('account')){
            if(this.tables[tableNum-1].table_status == 'available'){  //โต๊ะว่าง
                if(this.account.permission == "staff"){// staff
                    this.$router.push({path:'/tables/checkin', query: { table: tableNum }})
                }else if(this.account.permission == "VIP"){//VIP
                    if(this.haveTable == true){
                        return alert("คุณมีโต๊ะอยู่แล้ว")
                    }
                    else if(this.haveTable == false){
                        this.$router.push({path:'/tables/booking', query: { table: tableNum }})
                    }
                }else if(this.account.permission == "customer"){
                    console.log(this.account.permission)
                }
            }

            else if(this.tables[tableNum-1].table_status == 'booked'){ //ถูกจอง
                if(this.account.permission == "staff"){ // staff
                    this.$router.push({path:'/tables/checkin', query: { table: tableNum }})
                }else if(this.account.permission == "VIP"){ //VIP
                    if(this.tables[tableNum-1].username == this.account.username){//เจ้าของโต๊ะ
                        this.$router.push({path:'/tables/checkin', query: { table: tableNum }})
                    }
                    else{
                        alert("ขออภัย โต๊ะนี้ไม่พร้อมใช้งาน")
                    }
                }else if(this.account.permission == "customer"){
                    console.log(this.account.permission)
                }
            }
            else if(this.tables[tableNum-1].table_status == 'unavailable'){
                if(this.account.permission == "staff"){ // staff
                    this.$router.push({path:'/order', query: { table: tableNum }})
                }else if(this.account.username == this.tables[tableNum-1].username){ //เจ้าของโต๊ะ
                    this.$router.push({path:'/order', query: { table: tableNum }})
                }else{
                    alert("ขออภัย โต๊ะนี้ไม่พร้อมใช้งาน")
                }
            }
        }
        else{
            alert("กรุณาลงชื่อเข้าใช้ก่อน")
        }
    },
  },
    
};
</script>
