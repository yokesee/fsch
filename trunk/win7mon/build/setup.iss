; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{16B4B946-D6D2-4A3F-9F71-D85CFBEF6937}
AppName=FCSHServer
AppVerName=FCSHServer 1.0.133
AppPublisher=nimrod97@gmail.com
AppPublisherURL=http://code.google.com/p/fsch/
AppSupportURL=http://code.google.com/p/fsch/
AppUpdatesURL=http://code.google.com/p/fsch/
DefaultDirName={pf}\Fcsh Server
DefaultGroupName=FCSHServer
AllowNoIcons=yes
LicenseFile=license.txt
InfoBeforeFile=
InfoAfterFile=
OutputDir=/setup
OutputBaseFilename=fcsh-server-setup-1.0.133
SetupIconFile=all.ico
Compression=lzma/ultra
SolidCompression=yes
VersionInfoVersion=1.0.133
VersionInfoCopyright=nimrod97@gmail.com
ChangesEnvironment=yes


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]

Source: "FCSHServer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "server.ini"; DestDir: "{app}"; Flags: uninsneveruninstall onlyifdoesntexist
Source: "FCSHServer.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion
Source: "fcsh.jar"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.TXT"; DestDir: "{app}"; Flags: isreadme

Source: "msvbvm60.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "oleaut32.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "olepro32.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "asycfilt.dll"; DestDir: "{sys}"; Flags: sharedfile  onlyifdoesntexist
Source: "scrrun.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall onlyifdoesntexist
Source: "RICHTX32.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "stdole2.tlb"; DestDir: "{sys}";  Flags: sharedfile regtypelib  onlyifdoesntexist; MinVersion: 4.0,4.0; OnlyBelowVersion: 0,6.0
Source: "COMCAT.DLL"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "ARINIMgr.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "Redirect.dll"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "COMCTL32.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "MSWINSCK.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "MSCOMCTL.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "COMCT232.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist
Source: "TABCTL32.OCX"; DestDir: "{sys}"; Flags: sharedfile regserver  onlyifdoesntexist


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\FCSHServer"; Filename: "{app}\FCSHServer.exe"
Name: "{group}\{cm:ProgramOnTheWeb,Flex Compiler Shell Server}"; Filename: "http://code.google.com/p/fsch/"
Name: "{group}\{cm:UninstallProgram,Flex Compiler Shell Server}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Flex Compiler SHell Server"; Filename: "{app}\FCSHServer.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Flex Compiler Shell Server"; Filename: "{app}\FCSHServer.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\FCSHServer.exe"; Description: "{cm:LaunchProgram,Flex Compiler Shell Server}"; Flags: nowait postinstall skipifsilent

