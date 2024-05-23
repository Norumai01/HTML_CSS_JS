console.log("Hello World!")

function add7(input) {
    return input + 7;
}

function multiply(num1, num2) {
    return num1 * num2;
}

function capitalize(input) {
    if (typeof input != 'string' || input.length === 0) {
        return '';
    }

    return input.charAt(0).toUpperCase() + input.slice(1).toLowerCase();
}

function lastLetter(input) {
    if (typeof input != 'string' || input.length === 0) {
        return '';
    }
    
    if (input.length === 1) {return input;}
    else {
        return input.charAt(input.length - 1);
    }
}

console.log(add7(8));
console.log(multiply(8, 9));
console.log(capitalize("HeLoLoHo"));
console.log(lastLetter("Hello"));
console.log(lastLetter("O"));
console.log(lastLetter(""));