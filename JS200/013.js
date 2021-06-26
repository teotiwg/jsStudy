for( var i = 0; i < 10; i++){
    console.log(i + '번째 반복 문장');
}

var hometown = [
    {name: 'RM', place:'Ilsan', city:'Goyang'},
    {name: 'Jin', place:'Gwacheon'},
    {name: 'HS', place:'Kwnagju', city:'JRD'},
    {name: 'RM', place:'Pusan', city:'KSD'}
];

for( var i = 0; i < hometown.length; i++ ){
    var h = hometown[i];
    if(!h || !h.city)
        continue;
    
    console.log(i + '번째 실행');

    if(h.name === 'HS'){
        console.log(h.name + '의 고향은' + h.city + ' ' + h.place + '입니다.');
    break;
    }
}