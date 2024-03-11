const s = "MCMXCIV";

/**
 * @param {string} s
 * @return {number}
 */
var romanToInt = function (s) {
  const numerals = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000,
  };

  const j = s
    .replace(/(IV)/g, "4;")
    .replace(/(IX)/g, "9;")
    .replace(/(XL)/g, "40;")
    .replace(/(XC)/g, "90;")
    .replace(/(CD)/g, "400;")
    .replace(/(CM)/g, "900;")
    .replace(/[IVXLCDM]/g, (char) => `${numerals[char]};`)
    .split(';')
    .filter((value) => value != '')
    .reduce((total, number) => {
      return total + parseInt(number)
    }, 0)

  return j;
};

console.log(romanToInt(s));
