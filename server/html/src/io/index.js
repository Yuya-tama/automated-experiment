import io from 'socket.io-client';
import store from '../store';

function createSocket(){
    const socket = io.connect('http://localhost:8000');
    //const socket = io.connect('http://'+window.location.host+':8000');

        socket.on('connect', () => {
        console.log("connected to server as user");
        store.commit("connect");
      });
  
        socket.on('disconnect', () => {
        store.commit("disconnect");
    });

        socket.on('deviceList', (d) => {
        store.commit("setDeviceList",d);     
      });

        socket.on('recipeList',(a) => {
        store.commit("recipeList",a);
      });

        socket.on('sqlErrLog',(a) => {  //a={title, err}
        store.commit("sqlErrLog",a);
      });
      
        socket.on('recipeProcedure',(a) =>{
        store.commit('recipeProcedure',a);
      });
            
        socket.on('recipeBlock',(a) =>{
        store.commit('recipeBlock',a);
      });

        socket.on('recipeDevice',(a) =>{
        store.commit('recipeDevice',a);
      });
        socket.on('experimentTitle',(a) =>{
        store.commit('experimentTitle',a);
      });
        socket.on('experimentRecipe',(a) =>{
        store.commit('experimentRecipe',a);
      });
        socket.on('actionList',(a) =>{
        store.commit('actionList',a);
      });
        socket.on('actionLinkList',(a) =>{
        store.commit('actionLinkList',a);
      });
        socket.on('deviceTypeList',(a) =>{
        store.commit('deviceTypeList',a);
      });
        socket.on('conditionList',(a) =>{
        store.commit('conditionList',a);
      });
        socket.on('runInfo',(a) =>{
        store.commit('runInfo',a);
      });
        socket.on('commentGet',(a) =>{
        store.commit('runInfo',a);
      });
        socket.on('resultCommentGet',(a) =>{
        store.commit('resultRun',a);
      });
        socket.on('clientActionResultValue',(result,device) =>{
        store.commit('clientActionResultValue',{result,device});
      });
        socket.on('sstateNow',(a) =>{
        store.commit('sstateNow',a);
      });
        socket.on('resultList',(a) =>{
        store.commit('resultList',a);
      });
        socket.on('resultProcedureList',(a) =>{
        store.commit('resultOutlineList',a);
      });
        socket.on('resultRun',(a) =>{
        store.commit('resultRun',a);
      });
        socket.on('resultData',(a) =>{
        store.commit('resultData',a);
      });
        socket.on('resultTimeLogData',(a) =>{
        store.commit('resultTimeLogData',a);
      });
        socket.on('resultDevice',(a) =>{
        store.commit('resultDevice',a);
      });
        socket.on('resultProcedure',(a) =>{
        store.commit('resultProcedure',a);
      });
        socket.on('resultCondition',(a) =>{
        store.commit('resultCondition',a);
      });
        socket.on('resultBlock',(a) =>{
        store.commit('resultBlock',a);
      });
        socket.on('tempTimeLog',(a) =>{
        store.commit('timeLogs',a);
      });
        socket.on('getSetting',(a,b) =>{
        store.commit('settingList',a);
        store.commit('settingDefaultList',b);
      });
        socket.on('ResultForOptimization',(a) =>{
        store.commit('ResultForOptimization',a);
      });
        socket.on('sample',(a) =>{
        store.commit('sampleList',a);
      });
        socket.on('sendOptimization',(a) =>{
        store.commit('OptimizationList',a);
      });
    return socket;
}

export default createSocket;
