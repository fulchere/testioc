#!../../bin/linux-x86_64/test

## You may have to change test to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", ".")

## Register all support components
dbLoadDatabase("../../dbd/test.dbd",0,0)
test_registerRecordDeviceDriver(pdbbase) 

#drvAsynSerialPortConfigure("portName","ttyName",priority,noAutoConnect,
#    noProcessEosIn)
#asynSetOption("portName",addr,"key","value")
drvAsynSerialPortConfigure("dev1","/dev/ttyUSB0", 0, 0, 0)
asynSetOption("dev1",0,"baud","115200")

#asynSetTraceMask("dev1",-1,255)
#asynSetTraceIOMask("dev1",-1,255)

## Load record instances
dbLoadRecords("../../db/test.db","user=fulcher")
dbLoadRecords("$(EPICS_BASE)/db/asynRecord.db","P=,R=asyn,PORT=dev1,ADDR=0,OMAX=40,IMAX=40")

iocInit()

## Start any sequence programs
#seq snctest,"user=fulcher"
