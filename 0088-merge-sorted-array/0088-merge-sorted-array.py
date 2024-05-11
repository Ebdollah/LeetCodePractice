class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        merged = [0 for _ in range(m+n)]
        i = 0
        j = 0
        a = 0
        print("merged" , merged)
        # print(n)
        if n == 0:
            print(nums1)
        elif m == 0:
            nums1[:] = nums2
            print(nums1)
        else:
            # print(n,m)
            for k in range(m+n):
                if i<m and j<n and nums1[i] <= nums2[j]:
                    # print(nums1[i])
                    merged[k] = nums1[i]
                    a=a+1
                    i=i+1
                elif i<m and j<n and nums1[i] >= nums2[j]:
                #   print(nums2[j])
                    merged[k] = nums2[j]
                    a=a+1
                    j=j+1
            # print(i,k)
            if i != m and a != m+n:   
                count = i
                for x in range(count, m):
                    merged[a] = nums1[i]
                    i = i+1
                    a = a+1
            print(merged)
            nums1[:] = merged
            if i != m and a != m+n:   
                count = i
                for x in range(count, m):
                    merged[a] = nums1[i]
                    i = i+1
                    a = a+1
            print(merged)
            nums1[:] = merged
            if j != n and a != m+n:   
                count = j
                for x in range(count, n):
                    merged[a] = nums2[j]
                    j = j+1
                    a = a+1
            print(merged)
            nums1[:] = merged

        # for i in range(m):
        #     print(nums1[i])

        # for i in range(n):
        #     print(nums2[i])
        