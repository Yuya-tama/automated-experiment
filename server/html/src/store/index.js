import Vue from "vue";
import Vuex from 'vuex';

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        isConnect: false,
        deviceList: [],
        clientDeviceList: [],
        recipeList: [],
        sqlErrLog:{},
        recipeProcedure:[],
        recipeBlock:[],
        recipeDevice:[],
        experimentTitle:{},
        experimentRecipe:[],
        actionList:[],
        actionLinkList:[],
        deviceTypeList:[],
        valueChoiceList:[],
        conditionList: [],
        runInfo:{},
        resultRun:{},
        clientActionResultValue:{
            result:null,
            device:null,
        },
        sstateNow:{
            temp: null,
            timeDiff: null,
            procedureOrder: null,
        },  
        resultList:[],
        resultOutlineList:[],
        resultData:[],
        resultTimeLogData:[],
        resultDevice:[],
        resultProcedure:[],
        resultCondition:[],
        resultBlock:[],
        timeLogs:{},
        settingList:[],
        settingDefaultList:[],
        ResultForOptimization:[],
        sampleList:[],
        OptimizationList:[],
        message:'hello',
    },
    mutations: {
        connect(state){
            state.isConnect=true;
        },
        disconnect(state){
            state.isConnect=false;
            state.devicelist=[];
        },
        setDeviceList(state,data){
            state.deviceList=data;
            state.clientDeviceList=data;
        },
        recipeList(state,data){
            state.recipeList=data;
        },
        sqlErrLog(state,data){
            state.sqlErrLog=data;
            console.log(state.sqlErrLog.err);
        },
        recipeProcedure(state,data){
            state.recipeProcedure = data;
            if(state.recipeProcedure === null){
              state.recipeProcedure = ['エラー回避'];
            };
        },
        recipeBlock(state,data){
            state.recipeBlock = data;
            if(state.recipeBlock === null){
              state.recipeBlock = ['エラー回避'];
            };
        },
        recipeDevice(state,data){
            state.recipeDevice = data;
            if(state.recipeDevice === null){
              state.recipeDevice = ['エラー回避'];
            };
        },
        experimentTitle(state,data){
            state.experimentTitle = data;
        },
        experimentRecipe(state,data){
            state.experimentRecipe = data;
        },
        actionList(state,data){
            state.actionList = data;
        },
        actionLinkList(state,data){
            state.actionLinkList = data;
        },
        deviceTypeList(state,data){
            state.deviceTypeList = data;
        },
        valueChoiceList(state,data){
            state.valueChoiceList = data;
        },
        conditionList(state,data){
            state.conditionList = data;
        },
        runInfo(state,data){
            state.runInfo = data;
        },
        resultRun(state,data){
            state.resultRun = data;
        },
        clientActionResultValue(state,data){
            state.clientActionResultValue = data;
        },  
        sstateNow(state,data){
            state.sstateNow = data;
        },
        resultList(state,data){
            state.resultList = data;
        },
        resultOutlineList(state,data){
            state.resultOutlineList = data;
        },
        resultData(state,data){
            state.resultData = data;
        },
        resultTimeLogData(state,data){
            state.resultTimeLogData = data;
        },
        resultDevice(state,data){
            state.resultDevice = data;
        },
        resultProcedure(state,data){
            state.resultProcedure = data;
        },
        resultCondition(state,data){
            state.resultCondition = data;
        },
        resultBlock(state,data){
            state.resultBlock = data;
        },
        timeLogs(state,data){
            state.timeLogs = data;
        },
        settingList(state,data){
            state.settingList = data;
        },
        settingDefaultList(state,data){
            state.settingDefaultList = data;
        },
        ResultForOptimization(state,data){
            state.ResultForOptimization = data;
        },
        sampleList(state,data){
            state.sampleList = data;
        },
        OptimizationList(state,data){
            state.OptimizationList = data;
        },
        message(state){
            state.message="goodbye";
        },
    },
    getters: {
        isConnect:state => state.isConnect,
        recipeProcedure:state => state.recipeProcedure,
        recipeBlock:state => state.recipeBlock,
        resultProcedure:state => state.resultProcedure,
        clientActionResultValue:state => state.clientActionResultValue,
    }
});

export default store;