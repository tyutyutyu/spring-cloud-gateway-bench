API Gateways Benchmarks
=======

TL;DR

 Proxy   | Avg Latency | Avg Req/Sec 
---------|-------------|------------- 
 static  | 2388        | 83466       
 gateway | 10843       | 18424       
 nging   | 22683       | 8815        

## Run benchmarks

```bash
.scripts/run.sh 
```

## Results

### "static" - direct call, no API gateway

```json
{
  "spec": {
    "numberOfConnections": 200,
    "testType": "timed",
    "testDurationSeconds": 30,
    "method": "GET",
    "url": "http://static:8080/hello.txt",
    "body": "",
    "stream": false,
    "timeoutSeconds": 2,
    "client": "fasthttp"
  },
  "result": {
    "bytesRead": 370995300,
    "bytesWritten": 170457300,
    "timeTakenSeconds": 30.002450274,
    "req1xx": 0,
    "req2xx": 2506725,
    "req3xx": 0,
    "req4xx": 0,
    "req5xx": 0,
    "others": 0,
    "latency": {
      "mean": 2388.3926302246955,
      "stddev": 1339.8738986656738,
      "max": 92044
    },
    "rps": {
      "mean": 83466.39320684993,
      "stddev": 15046.378505744855,
      "max": 120657.48231694807,
      "percentiles": {
        "50": 85523.790181,
        "75": 93773.375018,
        "90": 100612.933788,
        "95": 104306.946989,
        "99": 111218.19743
      }
    }
  }
}
```

### "gateway" - Spring Cloud Gateway

```json
{
  "spec": {
    "numberOfConnections": 200,
    "testType": "timed",
    "testDurationSeconds": 30,
    "method": "GET",
    "url": "http://gateway:8080/hello.txt",
    "body": "",
    "stream": false,
    "timeoutSeconds": 2,
    "client": "fasthttp"
  },
  "result": {
    "bytesRead": 81859688,
    "bytesWritten": 38164314,
    "timeTakenSeconds": 30.008195474,
    "req1xx": 0,
    "req2xx": 553106,
    "req3xx": 0,
    "req4xx": 0,
    "req5xx": 0,
    "others": 0,
    "latency": {
      "mean": 10843.258840077671,
      "stddev": 9132.707076579649,
      "max": 392724
    },
    "rps": {
      "mean": 18424.68250538416,
      "stddev": 8623.163959791358,
      "max": 34430.78264994606,
      "percentiles": {
        "50": 20917.378628,
        "75": 25381.595651,
        "90": 27967.863086,
        "95": 29462.835741,
        "99": 31728.107532
      }
    }
  }
}
```

### "nginx" - Nginx

```json
{
  "spec": {
    "numberOfConnections": 200,
    "testType": "timed",
    "testDurationSeconds": 30,
    "method": "GET",
    "url": "http://nginx:8080/hello.txt",
    "body": "",
    "stream": false,
    "timeoutSeconds": 2,
    "client": "fasthttp"
  },
  "result": {
    "bytesRead": 51315492,
    "bytesWritten": 17722706,
    "timeTakenSeconds": 30.013799424,
    "req1xx": 0,
    "req2xx": 264518,
    "req3xx": 0,
    "req4xx": 0,
    "req5xx": 0,
    "others": 0,
    "latency": {
      "mean": 22683.63514014169,
      "stddev": 9754.823935899441,
      "max": 684344
    },
    "rps": {
      "mean": 8815.121999408839,
      "stddev": 1472.0233161447145,
      "max": 11721.394470332018,
      "percentiles": {
        "50": 9273.861646,
        "75": 9890.181404,
        "90": 10120.644663,
        "95": 10276.17635,
        "99": 10496.488636
      }
    }
  }
}

```

## Misc

Tested on:

- Ubuntu 22.04.4 LTS
- Docker version 25.0.3, build 4debf41
- Docker Compose version v2.24.5
