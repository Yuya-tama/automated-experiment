import Vue from "vue";
import UIkit from 'uikit';
import Icons from 'uikit/dist/js/uikit-icons';

import store from './store';
import createSocket from "./io";

// loads the Icon plugin
UIkit.use(Icons);

Vue.component('maincomponent', require('./main.vue').default );

const socket = createSocket();

Vue.prototype.$socket = socket;

const app = new Vue({
        el: '#app',
        store,
});

