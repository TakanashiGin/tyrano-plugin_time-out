[plugin name="time_out"]
[time_out name="test1" time="3000" target="test1"]
[time_out name="test2" time="4000" target="test2"]
[time_out name="test3" time="5000" target="test3"]

[l]
[eval exp="console.log('test1を一時停止')"]
[ctrl_time_out name="test1" content="stop"]

[l]
[eval exp="console.log('test1を再起動')"]
[ctrl_time_out name="test1" content="start"]
[s]

*test1
[eval exp="console.log('test1')"]
[s]

*test2
[eval exp="console.log('test2')"]
[ctrl_time_out name="test3" content="clear"]
[s]

*test3
[eval exp="console.log('test3')"]
[s]
