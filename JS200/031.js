var obj = {}; // 객체를 변수obj에 대입
for(var i = 0; i <4; i++){ 
    obj['key' + i] = i; // 속성접근자[]를 활용하여 계산된 속성명 정의. 속성명은 key0, key1, key2, key3으로 증가하도록 정의
}
console.log(obj);

var profile = 'chole:30';
var person ={
    [profile] : true, 
    [profile.split(':')[0]]:profile.split(':')[1]
};

console.log(person);