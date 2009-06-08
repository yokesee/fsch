VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private logWindow As RichTextBox
Private errWindow As RichTextBox
Private warnWindow As RichTextBox

Private Sub Class_Initialize()
    Open App.path + "/" + "FCSHServer.log" For Append As #1
    Print #1, vbCrLf
    Print #1, "--------------------------------------------------------------------------"
    Close #1
End Sub

Public Sub setWindow(ByRef textBox As RichTextBox, ByRef errBox As RichTextBox, ByRef warnBox As RichTextBox)
    Set logWindow = textBox
    Set errWindow = errBox
    Set warnWindow = warnBox
End Sub

Public Sub xDebug(msg As String)
    'output msg, "[DEBUG]"
End Sub

Public Sub xInfo(msg As String)
    output msg, "[INFO]"
End Sub

Public Sub xWarning(msg As String)
    output msg, "[WARN]"
End Sub

Public Sub xError(msg As String)
    output msg, "[ERROR]"
End Sub

Public Sub xFcsh(msg As String)
    logWindow.Text = logWindow.Text + msg
    logWindow.SelStart = Len(logWindow.Text) - Len(msg)
    logWindow.SelLength = Len(msg)
    logWindow.SelColor = RGB(90, 90, 90)
End Sub

Public Sub xFcshErr(msg As String)
    errWindow.Text = errWindow.Text + msg
    errWindow.SelStart = Len(errWindow.Text) - Len(msg)
    errWindow.SelLength = Len(msg)
    errWindow.SelColor = RGB(150, 0, 0)
End Sub

Public Sub xFcshWarn(msg As String)
    warnWindow.Text = warnWindow.Text + msg
    warnWindow.SelStart = Len(warnWindow.Text) - Len(msg)
    warnWindow.SelLength = Len(msg)
    warnWindow.SelColor = RGB(223, 112, 0)
End Sub

Private Sub output(msg As String, prefix As String)
    Debug.Print prefix + " " & Now & " " + msg
    Open App.path + "/" + "FCSHServer.log" For Append As #1
    Print #1, prefix + " " & Now & " " + msg
    Close #1
End Sub

