k)req:{[url;method;hd;bd]d:s,s:"\r\n";url:$[10=@url;url;1_$url];p:{$[#y;y;x]}/getenv`$_:\("HTTP";"NO"),\:"_PROXY";u:.Q.hap@url;t:~(~#*p)||/(*":"\:u 2)like/:{(("."=*x)#"*"),x}'","\:p 1;a:$[t;p:.Q.hap@*p;u]1;(4+*r ss d)_r:(`$":",,/($[t;p;u]0 2))($method)," ",$[t;url;u 3]," HTTP/1.1",s,(s/:("Connection: close";"Host: ",u 2),((0<#a)#,$[t;"Proxy-";""],"Authorization: Basic ",.Q.btoa a),($[#hd;(!hd),'": ",/:. hd;()])),($[#bd;(s,"Content-length: ",$#bd),d,bd;d])}

data:update symCol:10#`red`purple`yellow from flip`longCol`floatCol`dateCol`timeCol`stringCol`boolCol!10?/:(10;10f;.z.D;.z.T;0N 3#.Q.a;0b);

buildKeyValueObjects:{"{\"key\":\"",(.Q.btoa string y x),"\",\"value\":\"",(.Q.btoa`char$-18!y),"\"}"};

buildPayload:{"{\"records\":[",(","sv x),"]}"};

topicURL:"http://localhost:8082/topics/3partTopic";

producerHeaders:("Content-Type";"Accept")!("application/vnd.kafka.binary.v2+json";"application/vnd.kafka.v2+json");

// embed each message in a single HTTP payload
response:req[topicURL;`POST;producerHeaders;]buildPayload buildKeyValueObjects[`symCol;]each data;

// display partition distribution of each key (symCol value)
show `partition xgroup distinct(select partition from .j.k[response]`offsets),'select symCol from data;

exit 0
