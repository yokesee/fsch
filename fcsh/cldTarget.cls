VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsTarget"
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

Public fCommand As String
Public fName As String
Public fSource As String
Public fOutput As String
Public fLibraries As String
Public fDebug As String
Public fContext As String
Public fServices As String
Public fTargetID As Long
Public fMessage As String
Public fOther As String


Public Function getExecCommand() As String
    Dim result As String
    result = fCommand + " " + fSource + " " + Add(OUTPUT_PATH, fOutput) + _
                Add(INCLUDE_LIBRARIES, fLibraries) + Add(SERVICES, fServices) + _
                Add(CONTEXT_ROOT, fContext) + Add(COMPILE_DEBUG, fDebug) + " " + fOther
    getExecCommand = result
End Function

Private Function Add(Property As String, arg As String)
    If (Len(Trim(arg)) > 0) Then
        Add = Property + arg + " "
            Else
        Add = " "
    End If
End Function

Public Function getExecRecompile() As String
    If (fTargetID > 0) Then
        getExecRecompile = "compile " & fTargetID
    Else
        getExecRecompile = ""
    End If
End Function

Public Function getExecInfo() As String
    If (fTargetID > 0) Then
        getExecInfo = "info " & fTargetID
    Else
        getExecInfo = ""
    End If
End Function
