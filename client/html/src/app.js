
//window.Vue = require('vue').default;

import Vue from "vue";
import UIkit from 'uikit';

Vue.component('client', require('./client.vue').default );

const app = new Vue({
	el: '#app',
});
