import sys

def pre_asm(input, output):
    file = open(input,'r')
    text=''
    sdata=''
    data=''
    rdata=''
    bss=''
    seg= 'text'
    line =''
    line = file.readline()
    while  line != '':
        if line == '.text\n':
            seg = 'text'
        elif line == '.data\n':
            seg = 'data'
        elif line == '.rdata\n':
            seg = 'rdata'
        elif line == '.sdata\n':
            seg = 'sdata'
        elif line == '.bss\n':
            seg = 'bss'
        elif line[0] != ';' :
            if seg == 'text':
                text = text + line 
            elif seg == 'data':
                data = data + line
            elif seg == 'rdata':
                rdata = rdata + line
            elif seg == 'sdata':
                sdata = sdata + line
            elif seg == 'bss':
                bss = bss + line
        line = file.readline()
        
    result = open(output , 'w')
    result.write('$text:\n')
    result.write(text)
    result.write('\n')
    result.write('$sdata:\n')
    result.write(sdata)
    result.write('\n')
    result.write('$data:\n')
    result.write(data)
    result.write('\n')
    result.write('$rdata:\n')
    result.write(rdata)
    result.write('\n')
    result.write('$bss:\n')
    result.write(bss)
    result.close
    file.close

if __name__ == "__main__":
    #print(sys.argv)
    if sys.argv[1] == '--help' or sys.argv[1] =='-h':
        print ('This is a pre assembler dealling with segment.')
        print ('syntax:  pre_asm  input_file  output_file')
    elif len(sys.argv) != 3:
        print ('Couldn\'t parse the input arguments')
        print ('This is a pre assembler dealling with segment.')
        print ('syntax:  pre_asm  input_file  output_file') 
    else :       
        pre_asm(sys.argv[1], sys.argv[2])