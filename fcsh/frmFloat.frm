VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmFloat 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   540
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   1245
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmFloat.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   540
   ScaleWidth      =   1245
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar Toolbar1 
      Height          =   540
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   690
      _ExtentX        =   1217
      _ExtentY        =   953
      ButtonWidth     =   767
      ButtonHeight    =   953
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Style           =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   2
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Build"
            Style           =   5
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Image buildIcon 
      Height          =   240
      Left            =   840
      Picture         =   "frmFloat.frx":000C
      Top             =   120
      Width           =   240
   End
End
Attribute VB_Name = "frmFloat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Sub ReleaseCapture Lib "user32" ()

Private Const ERROR_PNG As Long = 15
Private Const EXEC_PNG As Long = 14
Private Const STOPPED_PNG As Long = 13
Private Const IDLE_PNG As Long = 12

Private Const BUILD_STOPPED As String = "Stopped"
Private Const BUILD_ACTIVE As String = "Active"
Private Const BUILD_IDLE As String = "Idle"
Private Const BUILD_ERROR As String = "Error"

Private Sub Form_Load()
    Toolbar1.ImageList = MainForm.pngImages
    Toolbar1.Buttons(1).Image = 3
    Toolbar1.Buttons(2).Image = STOPPED_PNG
    buildIcon.Picture = MainForm.pngImages.ListImages(STOPPED_PNG).ExtractIcon
    buildIcon.ToolTipText = BUILD_STOPPED
End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Const WM_NCLBUTTONDOWN = &HA1
  Const HTCAPTION = 2
  If Button = vbLeftButton Then
    ReleaseCapture
    Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
  End If
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
    Select Case Button.Index
    Case 1:
            buildIcon.Picture = MainForm.pngImages.ListImages(EXEC_PNG).ExtractIcon
            buildIcon.ToolTipText = BUILD_ACTIVE
            MainForm.rebuild
    End Select
End Sub

Private Sub Toolbar1_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
    Dim Index As Long
    Index = Val(ButtonMenu.key)
    buildIcon.Picture = MainForm.pngImages.ListImages(EXEC_PNG).ExtractIcon
    buildIcon.ToolTipText = BUILD_ACTIVE
    MainForm.build Index
End Sub

Private Sub buildIcon_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Const WM_NCLBUTTONDOWN = &HA1
  Const HTCAPTION = 2
  If Button = vbLeftButton Then
    ReleaseCapture
    Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
  End If
End Sub

Public Sub idle()
    buildIcon.Picture = MainForm.pngImages.ListImages(IDLE_PNG).ExtractIcon
    buildIcon.ToolTipText = BUILD_IDLE
End Sub

Public Sub stopped()
    buildIcon.Picture = MainForm.pngImages.ListImages(STOPPED_PNG).ExtractIcon
    buildIcon.ToolTipText = BUILD_STOPPED
End Sub

Public Sub error()
    buildIcon.Picture = MainForm.pngImages.ListImages(ERROR_PNG).ExtractIcon
    buildIcon.ToolTipText = BUILD_ERROR
End Sub


