const axios = require('axios');

setInterval(doRequest, 5000);

function doRequest() {
    axios.post('http://localhost:8080/insertSensorData', randomValueGenerator()).then((res) => {
        console.log(`Response : `)
        console.log(res.data)
    }).catch((error) => {
        console.error(error)
    });
}

function randomValueGenerator() {

    var data = {};

    var randomDevice = Math.round(Math.random());
    var randomSensor = Math.round(Math.random());

    if (randomDevice == 0) {
        data.DeviceID = '101';
    } else {
        data.DeviceID = '102';
    }

    if (randomSensor == 0) {
        data.SensorID = '201';
    } else {
        data.SensorID = '202';
    }

    data.Value = Math.random().toFixed(2) * 30 + 20;

    console.log('Request: ');
    console.log(data);
    // console.log('DeviceID: ' + data.DeviceID + ', SensorID: ' + data.SensorID + ', Value: ' + data.Value);

    return data
}