VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BaloonVO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'***********************************************************************************
'* nimrod97@gmail.com                                                              *
'* Project homepage http://code.google.com/p/fsch/                                 *
'* Adobe Flex Compiler Shell wrapper                                               *
'* 2008                                                                            *
'***********************************************************************************
Option Explicit

Public title  As String
Public message As String
Public baloon_type As Long


'----------------------------------
'Check if data class equals current
'----------------------------------
Public Function isClass(ByRef dataInput() As Byte, Optional ByRef pos As Long = 0) As Boolean
     Dim Result As String
     Result = readString(dataInput, pos)
     isClass = (Result = AIR_BALOONVO)
End Function


'----------------------------------------
'Convert input bytearray to current class
'----------------------------------------
Public Sub deSerialize(ByRef dataInput() As Byte, ByRef pos As Long)
    message = readString(dataInput, pos)
    title = readString(dataInput, pos)
    baloon_type = readLong(dataInput, pos)
End Sub


'----------------------------------
'Convert current class to bytearray
'----------------------------------
Public Sub serialize(ByRef dataOutput() As Byte)
    writeString dataOutput, AIR_BALOONVO
    writeString dataOutput, message
    writeString dataOutput, title
    writeLong dataOutput, baloon_type
End Sub


'-------------------------------
'Convert current class to string
'-------------------------------
Public Function toString() As String
    toString = "Class=" & AIR_BALOONVO & "; baloon_type=" & baloon_type & "; title=" & title & "; message=" & message & ";"
End Function
