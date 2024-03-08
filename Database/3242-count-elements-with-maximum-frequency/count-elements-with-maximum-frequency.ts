function maxFrequencyElements(nums: number[]): number {
    const frequency: Record<string, number> = {};
    let maxFre = 0;
    let count = 0;

    for (const num of nums) {
        frequency[num] = (frequency[num] || 0) + 1;
        maxFre = Math.max(maxFre, frequency[num]);
    }

    for (const value of Object.values(frequency)) {
        if (value === maxFre) {
            count += maxFre;
        }
    }

    return count;
};