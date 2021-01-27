[loadjs storage="plugin/time_out/time_out.js"]

[macro name="time_out"]
    [iscript]
        if (!f.time_out_array) f.time_out_array = [];
        mp.time = parseInt(mp.time);
        f.time_out_array.push(new TyranoPluginSetTimeout(mp));
    [endscript]
[endmacro]

[macro name="ctrl_time_out"]
    [iscript]
    if (!f.time_out_array) f.time_out_array = [];
    switch (mp.content) {
        case 'start':
            f.time_out_array.forEach(function(value){
                if (mp.name == value.name && value.do == false) value.interval();
            });
            break;
        case 'stop':
            f.time_out_array.forEach(function(value){
                if (mp.name == value.name) {
                    clearInterval(value.func);
                    value.do = false;
                }
            });
            break;
        case 'clear':
            if (mp.all == 'true') {
                f.time_out_array = f.time_out_array.forEach(function(value){
                    clearInterval(value.func);
                });
                f.time_out_array = [];
            } else {
                f.time_out_array = f.time_out_array.filter(function(value){
                    if (value.name == mp.name) clearInterval(value.func);
                    else return value;
                });
            }
            break;
    }
    [endscript]
[endmacro]

[macro name="make_time_out"]
    [iscript]
    if (!f.time_out_array) f.time_out_array = [];
        f.time_out_array.forEach(function(value){
            if (value.do == true) value.interval();
    });
    [endscript]
[endmacro]

[return]
