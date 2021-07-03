var namespaceA = (function(){
    var privateVar = '비공개변수';
    return {
        publicApi: function(){
            console.log(privateVar + '에 접근 가능');
        }
    }
})();

namespaceA.publicApi();