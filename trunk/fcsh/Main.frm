VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form MainForm 
   AutoRedraw      =   -1  'True
   Caption         =   "Flex compiler shell"
   ClientHeight    =   6585
   ClientLeft      =   3840
   ClientTop       =   2220
   ClientWidth     =   9750
   Icon            =   "Main.frx":0000
   ScaleHeight     =   6585
   ScaleWidth      =   9750
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin MSComctlLib.ImageList disabledIcons 
      Left            =   8520
      Top             =   2760
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16711935
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":1CFA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":204C
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":239E
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":26F0
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":2A42
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList enabledIcons 
      Left            =   8520
      Top             =   2040
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16711935
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":2E14
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":3166
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":34B8
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":380A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Main.frx":3B5C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton fakeTray 
      Caption         =   "fakeTray"
      Height          =   615
      Left            =   240
      TabIndex        =   2
      Top             =   1440
      Visible         =   0   'False
      Width           =   1815
   End
   Begin MSWinsockLib.Winsock Abort 
      Left            =   7920
      Top             =   3600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock Service 
      Left            =   7920
      Top             =   2880
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.Toolbar Toolbar 
      Align           =   1  'Align Top
      Height          =   330
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   9750
      _ExtentX        =   17198
      _ExtentY        =   582
      ButtonWidth     =   609
      ButtonHeight    =   582
      Style           =   1
      ImageList       =   "enabledIcons"
      DisabledImageList=   "disabledIcons"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   6
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Start fcsh"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Build"
            ImageIndex      =   3
            Style           =   5
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Options"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Clear log"
            ImageIndex      =   5
         EndProperty
      EndProperty
   End
   Begin RichTextLib.RichTextBox rtbLog 
      Height          =   5655
      Left            =   0
      TabIndex        =   0
      Top             =   360
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   9975
      _Version        =   393217
      BackColor       =   -2147483633
      BorderStyle     =   0
      Enabled         =   -1  'True
      ScrollBars      =   3
      Appearance      =   0
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"Main.frx":3F2E
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWinsockLib.Winsock Server 
      Left            =   7920
      Top             =   2160
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   44000
   End
   Begin VB.Menu mnuShell 
      Caption         =   "Shell"
      Visible         =   0   'False
      Begin VB.Menu mnuRecompile 
         Caption         =   "Recompile"
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRun 
         Caption         =   "Run/Stop fcsh"
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
End
Attribute VB_Name = "MainForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private log As New clsLog
Public config As New clsConfiguration
Dim WithEvents fcsh As clsFCSH
Attribute fcsh.VB_VarHelpID = -1

Private targets As New Dictionary
Private lastTarget As clsTarget

Private isRemote As Boolean
Private isServerBusy As Boolean
Private responce As String



Const BUILD_BUTTON As Long = 2
Const RUN_BUTTON As Long = 1
Const BUILD_FAILED As String = "Build failed"
Const BUILD_SUCESSFULL As String = "Build successfull"


'***********************************************************************************************
'fcsh event handling
'***********************************************************************************************
Private Sub fcsh_onError(target As clsTarget)
    Dim Msg As String
    Msg = target.fMessage
    
    log.xError Msg
    log.Text vbCrLf
    DisplayBalloon "Flex compiler shell", BUILD_FAILED + ". " + Msg, NIIF_ERROR
    
    If ((target.fTargetID = 0) And (targets.Exists(target.fName))) Then
        targets.Remove target.fName
    End If
    
    sendRemote Msg + vbCrLf + BUILD_FAILED
End Sub

'on command success
Private Sub fcsh_onFinish(target As clsTarget)
    log.xFcsh "Exec completed"
    log.Text vbCrLf
    DisplayBalloon "Flex compiler shell", BUILD_SUCESSFULL, NIIF_INFO
    
    If ((target.fTargetID = 0) And (targets.Exists(target.fName))) Then
        targets.Remove target.fName
    End If
    
    sendRemote BUILD_SUCESSFULL
End Sub

'on new compile target id
Private Sub fcsh_onIdAssigned(target As clsTarget)
    log.xFcsh "Exec completed. id is " & target.fTargetID
    log.Text vbCrLf
    DisplayBalloon "Flex compiler shell", BUILD_SUCESSFULL + ". Assigned Target id " & target.fTargetID, NIIF_INFO
    
    If (Not targets.Exists(target.fName)) Then
        targets.Add target.fName, target
    End If
    
    sendRemote BUILD_SUCESSFULL
End Sub

'on fcsh.exe start
Private Sub fcsh_onStart()
   Toolbar.Buttons.Item(RUN_BUTTON).Image = 2
   Toolbar.Buttons.Item(RUN_BUTTON).ToolTipText = "Stop fcsh"
   targets.RemoveAll
   Set lastTarget = Nothing
   DisplayBalloon "Flex compiler shell", "fcsh is started", NIIF_INFO
End Sub

'on fcsh.exe stop
Private Sub fcsh_onStop()
   Toolbar.Buttons.Item(RUN_BUTTON).Image = 1
   Toolbar.Buttons.Item(RUN_BUTTON).ToolTipText = "Start fcsh"
   targets.RemoveAll
   Set lastTarget = Nothing
   log.Text vbCrLf
   DisplayBalloon "Flex compiler shell", "fcsh is stopped", NIIF_WARNING
End Sub

'***********************************************************************************************
'Start app
'***********************************************************************************************


'start application
Private Sub Form_Load()
        'init prefs
        config.Load
        
        'set up logging
        log.clsLog rtbLog, config

          
        'init vars
        isServerBusy = False
        initSockets 'listen for requests
        
        'setup fcsh
        Set fcsh = New clsFCSH
        fcsh.Initialize log
            
        'add tray icon
        TrayAdd fakeTray.hwnd, Me.Icon, "Flex compiler shell", MouseMove
        
        'log and show tooltip
        log.xDebug "Application initialized"
        
        'load configured apps
        loadApps
End Sub

Public Sub loadApps()
    Toolbar.Buttons(BUILD_BUTTON).ButtonMenus.Clear
    Dim i As Long
    Dim app As clsTarget
    Dim key As String
    Dim ButtonMenu As MSComctlLib.ButtonMenu
    
    For i = 1 To config.APPLICATIONS
        Set app = config.LoadApplication(i)
        key = i & "app"
        Toolbar.Buttons(BUILD_BUTTON).ButtonMenus.Add i, key, app.fName
    Next i
End Sub


'***********************************************************************************************
'Sockets Server
'***********************************************************************************************
'init main server socket
Private Sub initSockets()
    log.xInfo "Server is listening on port " & config.SERVER_PORT
    Server.Close
    Server.LocalPort = config.SERVER_PORT
    On Error Resume Next
    Server.Listen
    If Err.Number <> 0 Then
        log.xError "Cant start server: " + Err.Description
        Err.Clear
    End If
End Sub




Private Sub mnuExit_Click()
    Form_QueryUnload 0, 0
    End
End Sub

Private Sub mnuRecompile_Click()
   If (Not (lastTarget Is Nothing)) Then
       fcsh.exec lastTarget
   Else
       log.xError "No targets were assigned yet. Nothing to recompile."
       log.Text vbCrLf
       DisplayBalloon "Flex compiler shell", "No targets were assigned yet. Nothing to recompile.", NIIF_WARNING
   End If
End Sub

Private Sub mnuRun_Click()
If (fcsh.isRunning) Then
    fcsh.Quit
Else
    fcsh.Start
End If
End Sub

'one more connection
Private Sub Server_ConnectionRequest(ByVal requestID As Long)
    If (Not isServerBusy) Then
        log.xDebug "Accepted connection request " & requestID
        Service.Close
        Service.Accept requestID
    Else
        log.xError "Server is busy. Ignoring connection request " & requestID
        Abort.Accept requestID
        Abort.SendData "busy"
        Abort.Close
    End If
End Sub

Private Sub Abort_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    log.xError "Server socket: " + Description
    Server.Close
End Sub

Private Sub Server_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    log.xError "Abort socket: " + Description
    Abort.Close
End Sub

Private Sub Service_Close()
    log.xDebug "Service connection closed"
    isRemote = False
End Sub

Private Sub Service_Connect()
    isRemote = True
End Sub

Private Sub Service_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    log.xError "Service socket: " + Description
    Service.Close
    isRemote = False
End Sub

Private Sub Service_DataArrival(ByVal bytesTotal As Long)
    Dim strData As String
    Dim intCnt As Integer

    Service.GetData strData, vbString
    
    log.xDebug "Socket in: " + strData
    
    isRemote = True
    
    remoteExec strData
End Sub


Private Sub remoteExec(arg As String)
    Dim i As Long
    Dim app As clsTarget
    Dim appFound As Boolean
    
    For i = 1 To config.APPLICATIONS
        Set app = config.LoadApplication(i)
        If (LCase(app.fName) = LCase(arg)) Then
            appFound = True
            Exit For
        End If
    Next i
    
    If (Not fcsh.isRunning) Then
        sendRemote "fsch is stopped" + vbCrLf + BUILD_FAILED
        Exit Sub
    End If
    
    If (fcsh.isExec) Then
        sendRemote "fsch is busy" + vbCrLf + BUILD_FAILED
        Exit Sub
    End If
    
    If (Not appFound) Then
        sendRemote "Application not found [" + arg + "]" + vbCrLf + BUILD_FAILED
    Else
        build i
    End If
End Sub

Private Sub sendRemote(Msg As String)
   If (isRemote) Then
       Service.SendData Msg
   End If
End Sub



'***********************************************************************************************
'toolbar
'***********************************************************************************************
'click
Private Sub Toolbar_ButtonClick(ByVal Button As MSComctlLib.Button)
    Select Case Button.index
        Case 1:
                If (Not fcsh.isRunning) Then
                    fcsh.Start
                Else
                    fcsh.Quit
                End If
        Case BUILD_BUTTON:
                If ((lastTarget Is Nothing)) Then
                    log.xError "No targets were assigned yet. Nothing to recompile."
                    log.Text vbCrLf
                    Exit Sub
                End If
                If (lastTarget.fTargetID = 0) Then
                    log.xError "No targets were assigned yet. Nothing to recompile."
                    log.Text vbCrLf
                    Exit Sub
                End If
                fcsh.exec lastTarget
        Case 4:
                frmOptions.loadPrefs config, log
                frmOptions.Show 1, Me
        Case 6:
                log.Clear
    End Select
End Sub

Private Sub Toolbar_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Dim index As Long
    index = Val(ButtonMenu.key)
    build index
End Sub

Private Sub build(index As Long)
    Dim app As clsTarget
    Set app = config.LoadApplication(index)
        
    If (fcsh.isRunning) Then
        If (targets.Exists(app.fName)) Then
            Set lastTarget = targets.Item(app.fName)
            fcsh.exec lastTarget
        Else
            Set lastTarget = app
            targets.Add app.fName, app
            fcsh.exec app
        End If
    Else
        app.fMessage = "Cant exec: fcsh stopped"
        fcsh_onError app
    End If
End Sub

'***********************************************************************************************
'basic
'***********************************************************************************************
'tray events
Private Sub fakeTray_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim cEvent As Single
    cEvent = X / Screen.TwipsPerPixelX
    Select Case cEvent
        Case MouseMove
            Debug.Print "MouseMove"
        Case LeftUp
            log.xDebug "Left Up"
            Me.Visible = Not Me.Visible
        Case LeftDown
            log.xDebug "Left Down"
        Case LeftDbClick
            log.xDebug "LeftDbClick"
        Case MiddleUp
            log.xDebug "MiddleUp"
        Case MiddleDown
            log.xDebug "MiddleDown"
        Case MiddleDbClick
            log.xDebug "MiddleDbClick"
        Case RightUp
            log.xDebug "RightUp": PopupMenu mnuShell
        Case RightDown
            log.xDebug "RightDown"
        Case RightDbClick
            log.xDebug "RightDbClick"
    End Select
End Sub

'on resize
Private Sub Form_Resize()
    rtbLog.Width = Me.Width - 130
    
    Dim logWidth As Long
    logWidth = Me.Height - rtbLog.Top - 500
    If (logWidth > 0) Then
        rtbLog.Height = logWidth
    End If
End Sub

'on quit
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    log.xDebug "Application stopped"
    TrayDelete
    Server.Close
    Unload frmOptions
End Sub



