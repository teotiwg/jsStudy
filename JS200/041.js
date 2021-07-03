if(true){
    var functionScopeValue='global'; // 함수 단위의 유효범위라 함수 밖에서도 접근 가능
    let blockScopeValue = 'local'; // 블록 단위의 유효범위로 함수 밖에선 접근 불가
}
console.log(functionScopeValue);
console.log(blockScopeValue);

let value = "바깥값";
if(true){
    console.log(value);
    let value = "안쪽값";
}