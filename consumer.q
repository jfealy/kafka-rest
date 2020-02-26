k)req:{[url;method;hd;bd]d:s,s:"\r\n";url:$[10=@url;url;1_$url];p:{$[#y;y;x]}/getenv`$_:\("HTTP";"NO"),\:"_PROXY";u:.Q.hap@url;t:~(~#*p)||/(*":"\:u 2)like/:{(("."=*x)#"*"),x}'","\:p 1;a:$[t;p:.Q.hap@*p;u]1;(4+*r ss d)_r:(`$":",,/($[t;p;u]0 2))($method)," ",$[t;url;u 3]," HTTP/1.1",s,(s/:("Connection: close";"Host: ",u 2),((0<#a)#,$[t;"Proxy-";""],"Authorization: Basic ",.Q.btoa a),($[#hd;(!hd),'": ",/:. hd;()])),($[#bd;(s,"Content-length: ",$#bd),d,bd;d])};

base64decode:{c:sum x="=";neg[c]_"c"$raze 1_'256 vs'64 sv'69,'0N 4#.Q.b6?x};

instName:`$.z.x 0;
consumerGroupURL:"http://localhost:8082/consumers/myNewGroup";
header:enlist["Content-Type"]!enlist"application/vnd.kafka.v2+json";
consumerHeaders:enlist["Accept"]!enlist"application/vnd.kafka.binary.v2+json";

// create consumer instance in a consumer group named 'myNewGroup'
{baseURI::last .j.k req[consumerGroupURL;`POST;header;.j.j(`name`format`auto.offset.reset)!(x,`binary`earliest)]}instName;

// consumer instance subscribe to the topic '3partTopic'
req[baseURI,"/subscription";`POST;header;"{\"topics\":[\"3partTopic\"]}"];

// function which sends a GET request to records resource and displays any data
poll:{r:.j.k req[baseURI,"/records";`GET;consumerHeaders;""];$[count r;show(-9!`byte$ base64decode@)each r`value;-1"No new data"];}

.z.ts:poll;
\t 5000
