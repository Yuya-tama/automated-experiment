const {PythonShell} = require('python-shell');
const serverAdress = 'localhost';

var cors = {
  cors: true,
  origins: ["http://10.249.80.69", "http://localhost"],
  methods: [ "GET", "POST"]
}

var io = require('socket.io-client');

//var client = io.connect('http://localhost:8010');
var serverURL = 'http://' + serverAdress + ':8010';
var client = io.connect(serverURL);

client.on('connect', ()=>{
  console.log("connected to server");
  GetResultForOptimization();
});

client.on('getResultForOpt',()=>{
  GetResultForOptimization();
})

client.on('sample',()=>{
  sample();
})

client.on('sendDataToClient',(data)=>{
  sendData(data);
})

function GetResultForOptimization(){
  PythonShell.run('Data_extraction.py', null)
    .then((response) => {
        console.log(response);
    })
    .catch((error) => {
        console.log(error);
    });

    const pyshell = new PythonShell('Data_extraction.py');

    // sends a message to the Python script via stdin
    pyshell.send('hello');
    
    pyshell.on('message', function (message) {
      // received a message sent from the Python script (a simple "print" statement)
      //console.log(message);
      const data = message;
      const data_temp = JSON.parse(data);
      //console.log(data_temp);
      //console.log(data);
      client.emit("ResultForOptimization",{data_temp});
    });
    
    // end the input stream and allow the process to exit
    pyshell.end(function (err,code,signal) {
      if (err) throw err;
      //console.log('The exit code was: ' + code);
      //console.log('The exit signal was: ' + signal);
      //console.log('finished');
    });
}

function sample(){
  PythonShell.run('sample.py', null)
    .then((response) => {
        console.log(response);
    })
    .catch((error) => {
        console.log(error);
    });

    const pyshell = new PythonShell('sample.py');

    // sends a message to the Python script via stdin
    pyshell.send('hello');
    
    pyshell.on('message', function (message) {
      // received a message sent from the Python script (a simple "print" statement)
      //console.log(message);
      client.emit("sample",{message});
    });
    
    // end the input stream and allow the process to exit
    pyshell.end(function (err,code,signal) {
      if (err) throw err;
      //console.log('The exit code was: ' + code);
      //console.log('The exit signal was: ' + signal);
      //console.log('finished');
    });
}

function sendData(data){
    const pyshell = new PythonShell('optimization.py');
    
    // sends a message to the Python script via stdin
    pyshell.send(JSON.stringify(data));
    
    pyshell.on('message', function (message) {
      // received a message sent from the Python script (a simple "print" statement)
      let data = JSON.parse(message);
      console.log(data);
      //console.log(data.variables);
      client.emit("sendOptimization", {data});
    });
    
    // end the input stream and allow the process to exit
    pyshell.end(function (err,code,signal) {
      if (err) throw err;
      //console.log('The exit code was: ' + code);
      //console.log('The exit signal was: ' + signal);
      //console.log('finished');
    });
}