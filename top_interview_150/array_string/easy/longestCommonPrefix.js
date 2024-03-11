/**
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function (strs) {
  const sorted = strs.sort((a, b) => a.length - b.length);
  let prefix = sorted[0];
  let i = prefix.length;

  for (let j = 1; j < strs.length; j++) {
    const word = strs[j].slice(0, i);

    if (word != prefix) {
      i--;
      j = 0;
      prefix = prefix.slice(0, -1);
    }
  }

  return prefix || "";
};

const strs = ["dog","racecar","car"]

longestCommonPrefix(strs);
