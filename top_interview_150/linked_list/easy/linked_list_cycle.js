/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function (head) {
  return recursive(head, 0)
};

function recursive(node, index) {
  if (node == null) {
    return false
  } else if (node.pos == null) {
    node.pos = index
    index++
    return recursive(node.next, index)
  } else if (node.pos != null) {
    return true
  }
}
