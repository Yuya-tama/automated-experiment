<template>
<div class='uk-card uk-card-body uk-card-default'>
    <div>
        <h3>VARIABLE</h3>
            <button class="uk-button uk-button-small uk-margin-small-right" type="button" @click="toggleTable">{{ showTable ? 'Hide Table' : 'Show Table' }}</button>
            <table v-show="showTable" class="uk-table uk-table-hover">
                <thead>
                <tr>
                    <th>experiment_number</th> 
                    <th>variable_name</th> 
                    <th>value</th>
                </tr>
                </thead>
                <tbody>
                    <tr v-for="(variable, index) in variables" v-bind:key="variable.id">
                        <td><input v-model.number="variable.number"></td>
                        <td><input v-model="variable.name"></td>
                        <td><input v-model.number="variable.value"></td>
                        <td><button v-on:click="del(index)">削除</button></td>
                    </tr>
                </tbody>
            </table>
            <button v-show="showTable" v-on:click="add">行を追加</button>
        <h3>RESULT</h3>
        <button class="uk-button uk-button-default uk-margin-small-right" type="button" @click='getResultForOpt()'>Get Result</button>
            <!--table class="uk-table uk-table-hover">
                <thead>
                <tr>
                    <th>result</th>
                    
                </tr>
                </thead>
                <tbody>
                    <tr v-for="(a,index) in $store.state.ResultForOptimization" :key="a.key" class="uk-text-left">
                        <td>{{index+1}}</td>
                        <td>{{a.key}}</td>
                        <td>{{a.value}}</td>
                        <td>{{a}}</td>
                    </tr>
            </tbody>
            </table-->
             <table class="uk-table uk-table-justify">
                <thead>
                    <tr>
                    <th v-for="key in $store.state.ResultForOptimization[0]" :key="key.key" class="uk-text-left">{{ key.key }}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="keyValuePairs in $store.state.ResultForOptimization" :key="keyValuePairs">
                    <td v-for="pair in keyValuePairs" :key="pair.key">{{ pair.value }}</td>
                    </tr>
                </tbody>
             </table>
        <h3>OPTIMIZATION</h3>
        <button class="uk-button uk-button-default uk-margin-small-right" type="button" @click='optimization()'>Optimization</button>
            <table class="uk-table uk-table-hover">
                <thead>
                <tr v-for="(a, index) in $store.state.OptimizationList" :key="index" class="uk-text-left">
                    <th v-for="(value,key) in a" :key="key">{{key}}</th>
                </tr>
                </thead>
                <tbody>
                    <!--tr v-for="(a) in $store.state.sampleList" :key="a.key" class="uk-text-left">
                        <td>{{a}}</td>
                    </tr-->
                    <tr v-for="(a, index) in $store.state.OptimizationList" :key="index" class="uk-text-left">
                        <td v-for="value in Object.values(a)" :key="value">{{ !isNaN(Number(value)) ? Number(value) : '' }}</td>
                    </tr>
                </tbody>
            </table>
    </div>
</div>
</template>

<script>
export default{
    data(){
        return{
            variables:[{number:'', name:'',value:''}],
            showTable: false, // テーブルを表示するかどうかの状態
        }
    },

    methods:{
        getResultForOpt(){
            this.$socket.emit('getResultForOpt');
        },

        add: function(){
            this.variables.push({number:'', name:'',value:''})
        },

        del: function(index){
            this.variables.splice(index, 1)
        },

        optimization(){
            this.sendToServer();
            this.$socket.emit('sample')
        },

        sendToServer() {
        const payload = {
            variables: this.variables,
            results: this.$store.state.ResultForOptimization
        };
        this.$socket.emit('sendData', payload);
        },

        saveToLocalStorage() {
        localStorage.setItem('variables', JSON.stringify(this.variables));
        },

        loadFromLocalStorage() {
            this.variables = JSON.parse(localStorage.getItem('variables')) || [{number:'', name:'',value:''}];
        },
        toggleTable() {
            this.showTable = !this.showTable;
        },
    },

    created() {
    this.loadFromLocalStorage();
    },
    
    watch: {
        variables: {
            handler() {
                this.saveToLocalStorage();
            },
            deep: true
        }
    }
}

</script>
<style>

</style>