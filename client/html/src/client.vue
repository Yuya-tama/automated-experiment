<template>
  <div>  
    <div class="uk-card uk-card-default uk-card-body">
      <h3> device list</h3>
      <ul class="uk-list">
        <li v-for="d in devices" > <span @click="selection(d)"> {{d.type}} / {{d.hardware}} </span> </li>
      </ul>
    </div>
    <div class="uk-card uk-card-default uk-card-body">
      <device :deviceData=deviceToShow @measure=measure></device>
    </div>
    <div class="uk-card uk-card-default uk-card-body">
      <params :paramsData=params @destroyParam="destroy" @createParam=createParam></params>
    </div>
  </div>
</template>


<script>

import io from 'socket.io-client';

import device from "./device.vue";
import params from "./params.vue";

export default {
  data () {
    return {
     x: "xx",
     devices: [],
     params: [],
     deviceToShow: {},
     socket : null,
    }
  },

  components : {
     device,
     params,
  },

  mounted() {
     this.socket = io.connect('http://' + window.location.host + ':8002');

     this.socket.on('connect', function(){
         console.log("connection success");
     });

     this.socket.on('disconnect', ()=>{
         this.devices = [];
         this.params = [];
     });

     this.socket.on('deviceList', (d)=>{
         this.devices = d;
     });

     this.socket.on('paramList', (d)=>{
         this.params = d;
     });

     this.socket.on('mycommandres', (d ) => {
         console.log("command res success");
         console.log(d);
         console.log(d.text);
         this.x = d.text;
     });
  },

  methods : {
    sendcommand: function(){
     console.log(" sending command");
      this.socket.emit('mycommand');
    },

    selection(d){
      console.log(d);
      this.deviceToShow = d;
    },

    destroy(p){
      console.log("client destroy");
      console.log(p);
      this.socket.emit('destroyParam',p);
    },

    createParam(param, text){
      console.log("createParam  client ");
      console.log(param + " " + text);
      this.socket.emit('createParam',{param: param, text: text});
    },
    measure(id) {
      this.socket.emit('measure',id);
    }
  },

}
</script>


