<template>
  <div id="createParam" uk-modal>  
    <div class="uk-modal-dialog uk-modal-body">
      <h3> new param </h3>
      param : <input v-model=param type="text"> <br>
      value : <input v-model=value type="text"> <br>
      <input type=submit @click=submit class="uk-button uk-button-default uk-modal-close" value="submit">
    </div>
  </div>
</template>


<script>


export default {
  data () {
    return {
      param: "",
      value: "",
    }
  },

  mounted() {
  },

  methods : {
   submit(){
     this.$emit("createParam", this.param, this.value);
   }
  }
}
</script>


