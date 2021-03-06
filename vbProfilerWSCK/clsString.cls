VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsString"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Value As String

Private key   As Long

Private dataSize As Long

Public Function canDeserialise(firstByte As Byte) As Boolean
    canDeserialise = (firstByte = C_STRING)
End Function

Public Sub parse(ByRef Data As clsSocketData)
    Dim Length As Integer, pos As Long, lng As Long
    
    Data.read16 Length
    
    If (Length > 0) Then
        Dim strBuff() As Byte
        lng = Length
        Data.ReadData strBuff, lng
        ConvertUtf8BytesToString strBuff, Value
    Else
        Value = ""
    End If

    Data.read32 key
End Sub

Public Function bytesAvailable(ByRef Data As clsSocketData) As Boolean

    Dim Length As Integer, result As Boolean, pos As Long

    If (Data.bytesAvailable >= 2) Then
        Data.getPos pos
        Data.read16P pos, Length
        dataSize = Length + 6
        result = (dataSize <= Data.bytesAvailable)
    Else
        result = False
    End If

    bytesAvailable = result
End Function

Public Function getValue() As String
    getValue = Value
End Function

Public Function getKey() As Long
    getKey = key
End Function

