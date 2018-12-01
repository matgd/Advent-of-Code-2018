# adventofcode.com/2018/day/1

def day_1_part_2():
    frequency = 0  
    frequencies = set()

    while True:
        with open('input.txt') as file:
            for line in file:
                frequency += int(line)
                
                if frequency in frequencies:
                    return frequency

                frequencies.add(frequency)

print(day_1_part_2())

        
