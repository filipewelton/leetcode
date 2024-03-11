let nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];

/**
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function (nums) {
  let singles = [];
  let duplicates = [];

  nums.forEach((n) => {
    if (singles.includes(n)) duplicates.push(n);
    else singles.push(n);
  });

  singles.forEach((n, index) => (nums[index] = n));

  const lengthSingles = singles.length;

  duplicates.forEach((n, index) => (nums[index + lengthSingles] = n));

  return singles.length
};

removeDuplicates(nums);
