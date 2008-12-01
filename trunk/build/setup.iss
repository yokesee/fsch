; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{F8D67705-8244-4864-A722-7966741FC208}
AppName=Flex Compiler Shell Wrapper
AppVerName=Flex Compiler Shell Wrapper 1.0.1.87
AppPublisher=nimrod97@gmail.com
AppPublisherURL=http://code.google.com/p/fsch/
AppSupportURL=http://code.google.com/p/fsch/
AppUpdatesURL=http://code.google.com/p/fsch/
DefaultDirName={pf}\Fcsh wrapper
DefaultGroupName=Flex Compiler Shell Wrapper
AllowNoIcons=yes
LicenseFile=license.txt
InfoBeforeFile=
InfoAfterFile=
OutputDir=/flex compiler shell
OutputBaseFilename=fcsh-setup-1.0.1.87
SetupIconFile=Adobe-Flex-CS3.ico
Compression=lzma/ultra
SolidCompression=yes
VersionInfoVersion=1.0.1.87
VersionInfoCopyright=nimrod97@gmail.com


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]

Source: "shell.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "fcsh.ini"; DestDir: "{app}"; Flags: uninsneveruninstall onlyifdoesntexist
Source: "shell.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion
Source: "compiler.exe"; DestDir: "{app}"; Flags: ignoreversion

Source: "msvbvm60.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "oleaut32.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "olepro32.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "asycfilt.dll"; DestDir: "{sys}"; Flags: sharedfile  onlyifdoesntexist
Source: "stdole2.tlb"; DestDir: "{sys}"; Flags: sharedfile regtypelib  onlyifdoesntexist
Source: "COMCAT.DLL"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "ARINIMgr.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "Redirect.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "scrrun.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall onlyifdoesntexist
Source: "COMCTL32.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "COMDLG32.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "RICHTX32.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "MSWINSCK.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "MSCOMCTL.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "COMCT232.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "QProGIF.ocx"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "MCLHotkey.ocx"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "HotKeyConfig.ocx"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "TABCTL32.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\Flex Compiler Shell wrapper"; Filename: "{app}\shell.exe"
Name: "{group}\{cm:ProgramOnTheWeb,Flex Compiler Shell Wrapper}"; Filename: "http://code.google.com/p/fsch/"
Name: "{group}\{cm:UninstallProgram,Flex Compiler Shell Wrapper}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Flex compiler shell Wrapper"; Filename: "{app}\shell.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Flex Compiler Shell Wrapper"; Filename: "{app}\shell.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\shell.exe"; Description: "{cm:LaunchProgram,Flex Compiler Shell wrapper}"; Flags: nowait postinstall skipifsilent

