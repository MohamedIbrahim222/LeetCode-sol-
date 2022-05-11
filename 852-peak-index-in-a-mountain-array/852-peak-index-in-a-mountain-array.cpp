class Solution {
public:
    int peakIndexInMountainArray(vector<int>& arr) {
        int first =0,last=arr.size()-1;
        while(first<=last){
            int mid=first+(last - first)/2;
                if(arr[mid]<arr[mid+1])
                    first=mid+1;
                else 
                    last=mid-1;
        }
        return first;
        
    }
};