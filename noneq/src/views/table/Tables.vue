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
}
.available{
    background-color: green;
}
.booked{
    background-color: rgb(255, 183, 0);
}
.unavailable{
    background-color: red;
}

</style>

<template>
    <div id="app">
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="min-height: 90vh;">
            <div class="grid">
                <div :class="center" v-for="table in tables" :key="table.table_num">
                    <div class="tables" :class="{
                        'bg-success': (table.table_status == 'available'),
                        'bg-warning': (table.table_status == 'booked'),
                        'bg-danger': (table.table_status == 'unavailable'),
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
      username: '',
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
        this.username = this.$cookies.get('account')
        this.checkhaveTable();
    }else{
        this.username = ""
    }
  },
  methods: {
    getTables() {
      axios.get("http://localhost:3000")
        .then(response => {
          this.tables = response.data;
          console.log(this.tables)
        })
        .catch(err => {
          console.log(err);
        });
    },
    async checkhaveTable() {
        const data = {
            username: this.$cookies.get('account').username,
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
                if((this.haveTable == true) && this.$cookies.get('account').permission != "staff"){
                    return alert("ขออภัย คุณมีโต๊ะอยู่แล้ว")
                }
                else if((this.haveTable == false) || this.$cookies.get('account').permission == "staff"){
                    this.$router.push({path:'/tables/booking', query: { table: tableNum }})
                }
            }
            else{
                if((this.tables[tableNum-1].username == this.$cookies.get('account').username)|| this.$cookies.get('account').permission == "staff"){   //โต๊ะมีคนใช้
                    // window.location.href = "./order.html?Table="+tableNum+"&User="+this.loginacct;
                }
                else{
                    alert("ขออภัย โต๊ะนี้ไม่พร้อมใช้งาน")
                }
            }
        }
        else{
            alert("กรุณาลงชื่อเข้าใช้ก่อน")
        }
    }
  },
};
</script>
