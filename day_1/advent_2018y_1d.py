# adventofcode.com/2018/day/1

frequency = 0

with open('input.txt') as file:
    for line in file:
        frequency += int(line)
        
print(frequency)
