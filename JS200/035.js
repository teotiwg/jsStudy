function checkNum(val){
    if(typeof val !== 'number') throw '유효하지 않은 값입니다.';
    console.log('숫자형 값으로 확인됐습니다.');
}

//checkNum(100);
//checkNum('Wrong Type');
//console.log('완료');

try{
    checkNum(100);
    checkNum('WrongType');
}catch(e){
    console.log(`에러발생 >>> ${e} `);
}finally{
    console.log("완료");
}