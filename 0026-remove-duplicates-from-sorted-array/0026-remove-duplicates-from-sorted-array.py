class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        start = 0
        count = 0
        dashNo = 0
        for i in range(len(nums) - 1):
            count += 1
            if nums[count] == nums[start]:
                nums[count] = None  # Use None instead of '-'
                dashNo += 1
            else:
                start = count
        start = 0
        val = None  # Use None instead of '-'
        for i in range(len(nums)):
            if nums[start] == val:
                index = self.dequeue(nums, start, i)
                nums[index], nums[i] = nums[i], nums[index]

        # Remove None elements from nums
        nums[:] = [x for x in nums if x is not None]

        return len(nums)

    def dequeue(self, nums, start, end):
        queue = []
        for i in range(start, end):
            if nums[i] is None:  # Use None instead of '-'
                queue.append(i)
        return queue.pop(0)

