var address = 'Seoul'; // 
var members = {};
var addFamily = function(age, name, role){
    this.members[role] = {age, name};
};

var getHeadCount = function(){
    return Object.keys(this.members).length;
};
// family객체의 속성을 변수로 작성.
// 각 속성의 키 이름을 변수명으로 정의하고 값을 해당 변수에 할당

var family = {address, members, addFamily, getHeadCount}; 
// family객체 리터럴 선언 앞서 정의한 변수들을 중괄호 안에 넣음
// 이때 {변수명}으로 정의한 객체는 {변수명:변수값}으로 정의한 것과 동일
// 단축 속성명은 문자열, 객체, 함수 등 자료형에 상관없이 적용 가능 

family.addFamily(30, 'chloe', 'aunt');
family.addFamily(3, 'lyn', 'niece');
family.addFamily(10, 'dengdeng', 'dog');
console.log(family.getHeadCount());