class Solution {
public:
    int searchInsert(vector<int>& nums, int target) {
        int low=0,hi=nums.size()-1;
        while(low <= hi){
            int mid = low + (hi-low)/2;
            if(target == nums[mid]) return mid;
            else if(target > nums[mid]) low = mid+1;
            else hi = mid-1;
        }
        return low;
    }
};