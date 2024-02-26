<template>
  <div>  
    <div class="uk-card uk-card-default uk-card-body">
      <h3> device detail</h3>
      <ul class="uk-list">
        <li > TYPE : {{deviceData.type}} </li>
        <li > HW : {{deviceData.hardware}} </li>
        <li > REM : {{deviceData.remark}} </li>
      </ul>
    </div>
    <button @click=measure>Measure</button>
  </div>
</template>


<script>


export default {
  props: ["deviceData"],
  data () {
    return {
    }
  },

  mounted() {
  },

  methods : {
    measure(){
      console.log("measure clicked");
      console.log(this.deviceData.id);
      this.$emit("measure", this.deviceData.id);
    }
  }
}
</script>


