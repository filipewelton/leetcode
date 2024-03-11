/**
 * @param {string} s
 * @return {string}
 */
var reverseWords = function(s) {
  const r = s
    .replace(/\s{2,}/g, " ")
    .split(" ")
    .reverse()
    .filter((value) => value != "")
    .reduce((str, word) => {
      if (str == null) return word
      return str.concat(" ", word);
    }, null)
  
  console.log(r)
  return r
};

const s = "the sky is blue"

reverseWords(s);
