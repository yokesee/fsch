VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsPreferences"
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

Const FCSHServer As String = "FCSHServer"

Private prefs As New ARINIManager
Private log As clsLog
Private initialized As Boolean


'------------------------------------------------
'Check server.ini file exists, setup ARINIManager
'------------------------------------------------
Public Sub initialize(appLog As clsLog)
    If (Not initialized) Then
        Set log = appLog
        log.xInfo "Initialize preferences"
        Dim path As String
        path = App.path + "\" + "server.ini"
        log.xInfo path
        prefs.INIFile = path
        initialized = True

        If (Not FileExists(path)) Then
           log.xError "Preferences file is not found: " + path
           MsgBox "Preferences file is not found: " + path, vbCritical
        Else
           log.xInfo "Preferences initialized"
        End If
    End If
End Sub


'------------------------------------------------------------------
'Server port, used to pass commands, currently must not be modified
'------------------------------------------------------------------
Public Property Get serverPort() As Long
    serverPort = Val(prefs.GetValue(FCSHServer, "port", "40000"))
End Property

Public Property Let serverPort(ByVal vNewValue As Long)
    prefs.WriteValue FCSHServer, "port", Trim(str(vNewValue))
End Property



'--------------------------
'Java virual machine to use
'--------------------------
Public Property Get java() As String
    java = prefs.GetValue(FCSHServer, "java", "")
End Property

Public Property Let java(ByVal vNewValue As String)
    prefs.WriteValue FCSHServer, "java", vNewValue
End Property



'--------------
'Java vmoptions
'--------------
Public Property Get vmoptions() As String
    vmoptions = prefs.GetValue(FCSHServer, "vmoptions", "")
End Property

Public Property Let vmoptions(ByVal vNewValue As String)
    prefs.WriteValue FCSHServer, "vmoptions", vNewValue
End Property


'----------------------------
'Flex SDK to use, must be set
'----------------------------
Public Property Get sdk() As String
    sdk = prefs.GetValue(FCSHServer, "sdk", "c:\flex\3.3\")
End Property

Public Property Let sdk(ByVal vNewValue As String)
    prefs.WriteValue FCSHServer, "sdk", vNewValue
End Property



'-------------------------------
'Command line for fcsh execution
'-------------------------------
Public Property Get cmd() As String
    Dim result As String
    
    If (Len(java) > 0) And (FileExists(java)) Then
        log.xInfo "Using Java Virtual Machine: " + java
        Dim fso As New FileSystemObject
        Dim JavaBinPath As String
        JavaBinPath = fso.BuildPath(java, "bin")
        
        result = "cmd.exe /C cd /D " + JavaBinPath + " && java.exe "
    Else
        log.xInfo "Using default Java Virtual Machine"
        result = "java.exe "
    End If
    
    result = result + vmoptions
    result = result + " -Dapplication.home=" + GetShortName(sdk) + " -jar " + Chr(34) + fso.BuildPath(sdk, "lib") + "\fcsh.jar" + Chr(34)
    log.xInfo "Command: " + result
    cmd = result
End Property

Public Property Let cmd(ByVal vNewValue As String)
    prefs.WriteValue FCSHServer, "vmoptions", vNewValue
End Property



'-----------------------------------
'Buffer for console output, in bytes
'-----------------------------------
Public Property Get consoleBuffer() As Long
    consoleBuffer = Val(prefs.GetValue(FCSHServer, "console.buffer", "8192"))
End Property

Public Property Let consoleBuffer(ByVal vNewValue As Long)
    prefs.WriteValue FCSHServer, "console.buffer", Trim(str(vNewValue))
End Property



'--------------------------------------------
'Time in milliseconds to wait for fcsh output
'--------------------------------------------
Public Property Get consoleWait() As Long
    consoleWait = Val(prefs.GetValue(FCSHServer, "console.wait", "500"))
End Property

Public Property Let consoleWait(ByVal vNewValue As Long)
    prefs.WriteValue FCSHServer, "console.wait", Trim(str(vNewValue))
End Property