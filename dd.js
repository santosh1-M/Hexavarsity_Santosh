// //1. Adding number
// var a=5;
// var b=10; 
// console.log("Sum = ",a+b);

// //2. checking whether the number is even or odd:
// var a=20;
// if(a%2==0){
//     console.log("Even Number");
// }
// else{
//     console.log("odd number");
// }

// //3. For loop
// var n=5;
// for(i=1;i<=n;i++){
//     console.log(i);
// }

// //4. Using even or odd in for loop

// var n=5;
// for(let i=1;i<=n;i++){
//    if(i%2==0){
//     console.log("Even Number");
// }
// else{
//     console.log("odd number");
// }
// }

// //5. Prime Number:

// let a = 6;
// let isPrime = true;

// if (a <= 1) {
//   isPrime = false;
// } 
// else {
//   for (let i = 2; i <= Math.sqrt(a); i++) {
//     if (a % i === 0) {
//       isPrime = false;
//       break;
//     }
//   }
// }

// if (isPrime) {
//   console.log("Prime number");
// } else {
//   console.log("Not a prime number");
// }

// // 6.Factorial

// let a=5;
// let sum=1;
// for(let i=1;i<=a;i++){
//     sum*=i;
// }
// console.log(sum);

// // 7. Split the sentence:

// let sentence="my world is very beautiful along with her beautiful soul";
// let words=sentence.split(" ");
// console.log(words);

// // 8.limited splitting:

// let sentence = "my,world,is,very,beautiful,along,with,her,beautiful,soul";
// let word= sentence.split(",", 3);
// console.log(word);

// // 9.split by digit:

// let sentence="sri09102003santosh22092003";
// let words=sentence.split(/\d+/);
// console.log(words);

// //10. split using empty string:

// let ss="srisan";
// let sen=ss.split("");
// console.log(sen);

// //11. split using may special cases:

// let sen="san/sri|amma,appa pappu";
// let words=sen.split(/[,|/" "]/);
// console.log(words)

// //12. using list:

// let animals=['monkey','donkey','lion','cheetah','horse']
// console.log(animals[3]);
// console.log(animals.length);

// // 13. Adding elements to the list:

// let animals=['monkey','donkey','lion','cheetah','horse']
// animals.push("giraffie");
// animals.push("cat","Dog");
// console.log(animals);

// //14. pop function

// let animals=['monkey','donkey','lion','cheetah','horse']
// animals.pop()
// console.log(animals);

// // 15. Shift method:

// let animals=['monkey','donkey','lion','cheetah','horse']
// animals.shift()
// console.log(animals);

// // 16. unshift method:

// let animal=['lion']
// animal.unshift('cheetah','tiger')
// console.log(animal)

// // 17. splice method:

// let animals=['monkey','donkey','lion','cheetah','horse']
// animals.splice(1,2)
// console.log(animals)

// animals.splice(2,0,"elephant","tiger")
// console.log(animals)

// animals.splice(1,2,"cannon","labador")
// console.log(animals)

// // 18.Concatenation:

// let animals=["lion",'tiger']
// let ani=['cheetah']
// console.log(animals.concat(ani))

// //19. Index of:

// let animals=["lion",'tiger']
// console.log(animals.indexOf('tiger'))

// //20. foreach:

// let animals=['monkey','donkey','lion','cheetah','horse']
// animals.forEach(function(ani) {
//   console.log(ani);
// })

// // 21. map function

// let number = [1,2,3,4,5]
// let square = number.map(function(num){
//        return num*num
// })
// console.log(square)

// // 22. filter()

// let numbers = [1, 2, 3, 4, 5];
// let evenNumbers = numbers.filter(function(number) {
//   return number % 2 === 0;
// });
// console.log(evenNumbers);

// // 23. object:

// let person = {
//   name: "santosh",
//   age: 21,
//   isEmployed: true
// };

// console.log(person.name); 
// console.log(person["age"])

// // 24. map 

// let map=new Map()
// map.set("name","santosh")
// map.set("age",21)
// map.set("role","student")
// console.log(map.get("name"))
// console.log(map.size)


// let values=map.values()

// for(let val of values){
//     console.log(val)
// }

// for(let [key,value] of map.entries()){
//     console.log(`${key}: ${value}`);
// }

// console.log(map.delete("role"))

// // 25 .Set

// let set=new Set([1,2,3,4,5,1,2,3,4,5])
// console.log(set)
// for(let val of set){
//     console.log(val)
// }
// console.log(set.add(6))
// console.log(set.delete(2))
// console.log(set)
// console.log(set.has(5))

// // 26 let and constant

// let x=10
// if(true){
//     let x=20
//     console.log(x)
// }
// console.log(x)

// // 27. Arrow function 

// const add =(a,b)=> a+b
// console.log(add(20,30))

// const multiply = (a,b) => a*b
// console.log(multiply(3,5))

// // 28. template variable:

// let map=new Map()
// map.set("name","santosh")
// map.set("age",21)
// for(let [key,val] of map.entries()){
//     console.log(`${key}:${val}`)
// }

// // 29. default parameters:

// function prin(name="santosh"){
//     console.log(`name:${name}`)
// }
// prin()
// prin("Sri")

// // 30. destructing arguement

// let ani=[1,2,3]
// let [a,b,c]=ani
// console.log(a,b,c)

// let person = {
//     "name":"santosh",
//     "age": 21
// }

// let {name,age}=person
// console.log(name,age)

// //  31 .spread operators and reduce

// function sum(...numbers) {
//   return numbers.reduce((total, num) => total + num, 0);
// }
// console.log(sum(1, 2, 3, 4, 5)); 

// //32. class:

// class Person {
//   constructor(name, age) {
//     this.name = name;
//     this.age = age;
//   }

//   greet() {
//     console.log(`Hello, my name is ${this.name}, and I am ${this.age} years old.`);
//   }

//   isAdult() {
//     return this.age >= 18;
//   }
// }

// let p1 = new Person("Santosh", 21);
// p1.greet()
// console.log(p1.isAdult());

// //33. Enhanced Object:

// const name = "Santosh";
// const person = {
//   name,
//   greet() {
//     console.log("Hello!");
//   }
// };

// console.log(person.name);  
// person.greet();

// // 34. Symbol:

// const id = Symbol('id');
// const person = {
//   [id]: 127
// };
// console.log(person[id]); 


// // 35. generator and iterator

// function* countUpTo(n) {
//   for (let i = 1; i <= n; i++) {
//     yield i;
//   }
// }

// for (let num of countUpTo(3)) {
//   console.log(num);
// }


