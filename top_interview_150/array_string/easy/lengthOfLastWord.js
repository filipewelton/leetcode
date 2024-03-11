const s = "   fly me   to   the moon  "

/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLastWord = function (s) {
  const words = s.trim().replace(/\s{2,}/g, ' ').split(' ')
  const { length } = words

  return words[length - 1].length
};

lengthOfLastWord(s)
