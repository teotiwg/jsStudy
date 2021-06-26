var cart = [
    {name:'tshirt', price:2000},
    {name:'bag', price:1000}
];

var numOfItems = `There are ${cart.length} items`;
var cartTable = 
    `<ul>
        <li>품목:${cart[0].name}, 가격:{cart[0].price}</li>
        <li>품목:${cart[1].name}, 가격:{cart[1].price}</li>
    </ul>`
console.log(numOfItems);
console.log(cartTable);

var personName = 'harin';
var helloStr = 'hello' + personName;
var helloTemplateStr =`hello + ${personName}`;

console.log(helloStr === helloTemplateStr);
console.log(typeof helloTemplateStr);