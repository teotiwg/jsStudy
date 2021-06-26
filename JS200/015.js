
var hometown = [
    {name: 'RM', place:'Ilsan', city:'Goyang'},
    {name: 'Jin', place:'Gwacheon'},
    {name: 'HS', place:'Kwnagju', city:'JRD'},
    {name: 'JM', place:'Pusan', city:'KSD'}
];

var isHometown = function(h, name){
    console.log('함수 실행. ${h.city}에서 ${h.name}을 찾습니다.')

    if(h.name === name){
        console.log('${h.name}의 고향은 ${h.city} ${h.place}입니다.');
        return true;
    }
    return false;
}

var h;
while(h=hometown.shift()){
    if (!h.name || !h.place || !h.city) continue;

    var result = isHometown(h, '호섭');
    if(result) break;

}


var i = 0;
var name = ['남준', '정국', '윤기', '호섭'];
var cities = ['경기', '부산', '대구', '광주'];
do{
    hometown[i] = {name:name[i], city:cities[i]};
    i++;
}while(i<4);

console.log(hometown);