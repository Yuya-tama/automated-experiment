<template>
  <div>  
    <div class="uk-card uk-card-default uk-card-body">
      <h3> params </h3>
      <button uk-toggle="target: #createParam" type="button">New</button>
      <ul class="uk-list">
        <li v-for="item in paramsData"> {{item.param}} : {{item.value}} 
         <button @click="destroy(item.param)">Delete</button>
       </li>
      </ul>
    </div>
    <newparam @createParam=createParam></newparam>
  </div>
</template>


<script>

import newparam from "./newparam.vue";

// import UIkit from 'uikit';


export default {
  props: ["paramsData"],
  components: {
    newparam,
  },
  data () {
    return {
    }
  },

  mounted() {
  },

  methods : {
    destroy(target){
console.log(target);
      this.$emit('destroyParam', target) //  to parent component
    },
    createParam(param, value){
      this.$emit('createParam', param, value) //  to parent component
    }

  }
}
</script>


