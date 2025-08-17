# offset to ident information
ios = 512 #skip a whole sector, start at

# change to point to the ID file to read
#IdFile = "C:\\temp\\ROMWBW\\CPMIDE.id"
IdFile = "F:\\CPMIDE.id"

# most likely values to change
#FixedCylinders = 1024   # hd512 format
FixedCylinders = 1040   # hd1k format
Heads = 16
SectorsPerTrack = 16
Capacity = 99840  # * 512 = 49920Kb
# Capacity = 16640  # * 512 = 8320Kb

def PrintIntegerIdent(s, b):
    v = ident[b+ios] + 256*ident[b+1+ios]
    print(hex(b+ios)," ", end='')
    print(s+":", hex(v),v)

def WriteIntegerIdent(b, v):
    c=bytearray(v.to_bytes(2,"little"))
    ident[b + ios] = c[0]
    ident[b + ios + 1] = c[1]


def PrintLongIdent(s, b):
    v = ident[b+ios] + 256*ident[b+1+ios] + 65536*ident[b+2+ios] + 16777216*ident[b+3+ios]
    print(hex(b+ios)," ", end='')
    print(s+":", hex(v), v)

def WriteLongIdent(b,v):
    c=bytearray(v.to_bytes(4,"little"))
    ident[b + ios] = c[0]
    ident[b + ios + 1] = c[1]
    ident[b + ios + 2] = c[2]
    ident[b + ios + 3] = c[3]


def PrintMagic():
    print("Magic: ", end='')
    for i in range(8):
        print(chr(ident[i]), end='')
    print('')


def PrintCharIdent(s, b, l):
    print(hex(b + ios)," ", end='')
    print(s+":", end='')
    for i in range(b, l+b):
       print(chr(ident[i+ios]), end='')
    print('')


f = open(IdFile, 'rb')
#f = open('c:\\temp\\ROMWBW24.id', 'rb')
ident = bytearray(f.read())
f.close()

# setting important values only
WriteIntegerIdent(2, FixedCylinders)
WriteIntegerIdent(6, Heads)
WriteIntegerIdent(12, SectorsPerTrack)

WriteIntegerIdent(108, FixedCylinders) #current cylinders
WriteIntegerIdent(110, Heads) #current heads
WriteIntegerIdent(112, SectorsPerTrack) #current sectors per track

WriteLongIdent(114, Capacity)
WriteLongIdent(120, Capacity)


# print changes
PrintMagic()
PrintIntegerIdent("Config/ID", 0)
PrintIntegerIdent("Fixed Cylinders", 2)
PrintIntegerIdent("Rem Cylinders", 4)
PrintIntegerIdent("Heads", 6)
PrintIntegerIdent("unf bytes per phy track", 8)
PrintIntegerIdent("unf bytes per sector", 10)
PrintIntegerIdent("Sectors per tracks", 12)
PrintIntegerIdent("Bytes in inter sector gap", 14)
PrintIntegerIdent("bytes in sync fields", 16)
#PrintIntegerIdent("0", 18) # ??????
PrintCharIdent("Serial Number", 20, 20)
PrintIntegerIdent("Cont Type", 40)
PrintIntegerIdent("Cont Buff Size", 42)
PrintIntegerIdent("No of ECC bytes on long cmds", 44)
PrintCharIdent("Controller Firmware ver", 46, 8)
PrintCharIdent("ModelNumber", 54, 40)
PrintIntegerIdent("Current No Cylindars", 108)
PrintIntegerIdent("Current No heads", 110)
PrintIntegerIdent("Current Sectors per Track", 112)
PrintLongIdent("Current capacity in Sectors", 114)
PrintLongIdent("Current accessible Sectors", 120)

f = open(IdFile, 'wb')
f.write(ident)
f.close()

print()

print ("Written " , IdFile )
