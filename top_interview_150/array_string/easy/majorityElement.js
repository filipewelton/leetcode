let nums = [2, 2, 1, 1, 1, 2, 2];

/**
 * @param {number[]} nums
 * @return {number}
 */
var majorityElement = function (nums) {
  let elements = {};

  nums.forEach((n) => {
    const count = elements[n] || 0;
    elements[n] = count + 1;
  });

  const sorted = Object.entries(elements).sort(([k1, v1], [k2, v2]) => {
    return v2 - v1;
  });

  return sorted[0][0];
};

majorityElement(nums);
