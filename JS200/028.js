var family = { // 변수 family에 중괄호를 열어 객체값을 할당하여 선언
    'address':'Seoul',
    members: {}, // 키 member에 새 객체 리터럴 대입
    addFamily:function(age, name, role){ // 키 addFamily이름으로 함수 리터럴 대입. 함수 표현식으로 변수에 대입했던 것처럼 키값으로 함수 할당
        this.members[role] = { // this키워드로 family객체 내부속성에 접근 가능. this키워드로 member속성에 접근하고 값 할당
            age:age,
            name:name
        };
    },
    getHeadCount: function(){ // 키 getHeadCount에 함수 리터럴 할당
        return Object.keys(this.members).length; // 멤버의 키들을 모아 배열로 반환하고, 반환된 배열의 길이 통해 family객체의 사이즈 알 수 있음
    }
};

family.addFamily(30,'chloe', 'aunt');
family.addFamily(3, 'lyn', 'niece');
family.addFamily(10, 'dengdeng', 'dog');
console.log(family.getHeadCount());