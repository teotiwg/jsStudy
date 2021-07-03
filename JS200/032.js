var obj = {a:1, b:2, c:30, d:44, e:5};

var {a, c} = obj; // 비구조화로 속성 a와 c의 속성값을 가져와 변수에 할당
                    // 중괄호 안에 특정 속성명을 넣으면 객체를 비구조화하여 해당 속성명에 따른 값을 각 변수에 할당 가능
                    ///// 그러니까 키를 꺼내서 변수로 만든다/??
console.log(`a >>> ${a}`);
console.log(`c >>> ${c}`);

var { a:newA=10, f:newF=5} = obj; // 기존 속성명의 값을 가져와 새 변수명으로 할당해 정의 가능
console.log(`newA >>> ${newA}`);
console.log(`newF >>> ${newF}`);

var arr = [1, 2, 30, 44, 5]; // 배열 비구조화 할당
                            // 객체 비구조화 방식에서 중괄호를 대괄호로 바꾸면 됌
var [b, c, ...rest] = arr;

console.log(`0) b >>> ${b}`);
console.log(`0) c >>> ${c}`);
console.log(`0) rest >>> ${rest}`);

var [a=10, f=9] = [1];
console.log(`1) a >>> ${a}`);
console.log(`1) f >>> ${f}`);

[a, f] = [f, a];
console.log(`2) a >>> ${a}`);
console.log(`2) f >>> ${f}`);

function getArr(){
    return [1,2,3,4,5,6];
}

[a, , , , , f] = getArr();
console.log(`3) a >>> ${a}`);
console.log(`3) f >>> ${f}`);