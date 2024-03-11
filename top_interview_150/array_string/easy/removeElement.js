let nums = [0, 1, 2, 2, 3, 0, 4, 2];
let val = 2;

var removeElement = function (nums, val) {
  const a = nums.filter((n) => n != val);
  const b = nums.filter((n) => n == val);
  const k = a.length;

  a.forEach((n, index) => {
    nums[index] = n;
  });

  const lengthA = a.length;

  b.forEach((n, index) => {
    nums[index + lengthA] = n;
  });

  return k;
};

removeElement(nums, val);
