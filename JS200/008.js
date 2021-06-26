var name = "Peter";
var num = 200
var x = 5;
var y = 'five';
var isTrue = true
var non = null
var empty = undefined
var list = []
var ref = {}
var func = function(){}

var sym = Symbol('me'); // Symbol
var item = {
    price:5000 , 
    count:10
}; // 객체(Object)
var fruits = ['apple', 'orange', 'berry']; // 배열
var addFruit = function(fruit){
    fruits.push(fruit);
} // 함수
addFruit('watermelon');
console.log(fruits);