/**
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function (nums) {
  let counter = {};
  let i = 0;

  const array = nums.filter((n) => {
    const count = counter[n] || 0;

    if (count < 2) {
      counter[n] = count + 1;
      return true;
    }

    i++;
    return false;
  });

  for (let j = 0; j < array.length; j++) {
    const n = array[j];
    nums[j] = n;
  }

  for (let j = array.length; j < nums.length; j++) {
    nums[j] = null;
  }

  return Object.values(counter).reduce((sum, n) => sum + n, 0);
};

const nums = [1, 1, 1, 2, 2, 3];
