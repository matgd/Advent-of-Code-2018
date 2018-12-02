line_chars_sets_map = {}

def day_2_part_2():
    with open('input.txt') as file:
        for line in file:
            unique_chars_line_set = set()
            for i in range(len(line)):
                unique_chars_line_set.add(str(i)+line[i])
            line_chars_sets_map[line] = unique_chars_line_set

    map_values = list(line_chars_sets_map.values())
    for i in range(len(map_values)):
        for j in range(i+1, len(map_values)):
            if len(map_values[i].symmetric_difference(map_values[j])) == 2:
                return map_values[i], map_values[j]

v1, v2 = day_2_part_2()
words = []
for k, v in line_chars_sets_map.items():
    if v == v1 or v == v2:
        print(k)
