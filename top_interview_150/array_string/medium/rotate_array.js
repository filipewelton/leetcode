/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var rotate = function (nums, k) {
  const { length } = nums

  if (length == 1) {
    return
  } else if (length < k) {
    let i = k

    while (i > 0) {
      const left = nums[length - 1]
      
      nums
        .slice(0, -1)
        .forEach((n, index) => {
          nums[index + 1] = n
        })

      nums[0] = left
      i--
    }
  } else {
    const left = [...nums].slice(length - k)
    const right = [...nums].slice(0, length - k)
    const reordered = [...left, ...right]

    let i = 0

    while (i < reordered.length) {
      nums[i] = reordered[i]
      i++
    }
  }
};

