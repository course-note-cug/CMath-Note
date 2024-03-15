to_fold = ['proof', 'example']

string = """
123
"""

in_section = False
in_dollar = False
shall_tab = False

lines = string.split('\\n')
lines_out = []

shall_cont = False

for line in lines:
    # if is a fence
    if(line[0:3] == ':::'):
        if in_section:
            lines_out.append("\\n")
            in_section = False
            shall_tab = False
            continue
        else:
            in_section = True
            if line[4:] in to_fold:
                lines_out.append("??? "+line[4:])
                shall_tab = True
            continue

    while line.find('$$') != -1:
        index=line.find('$$')
        lines_out.append(line[:index])
        if in_dollar:
            lines_out.append('$$\n')
            in_dollar = False
        else:
            lines_out.append('\n$$')
            in_dollar = True
        # if(index+3 >= len(line)):
        #     shall_cont = True
        #     break
        line = line[index+3:]

    if shall_tab:
        lines_out.append('\\t'+line)
    else:
        lines_out.append(line)
    
filtered_list = [x for x in lines_out if x != '']
print('\n'.join(filtered_list))
