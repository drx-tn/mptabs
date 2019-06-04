Name "MPTabs"
LoadLanguageFile "${NSISDIR}\Contrib\Language files\French.nlf"
OutFile "mptabs-${VERSION}_${PLATFORM}.exe"
# Unicode true
SetCompress force
SetCompressor /FINAL /SOLID lzma
SetDatablockOptimize on
SetDateSave off
SetOverwrite on
CRCCheck force
AllowSkipFiles off
RequestExecutionLevel admin
WindowIcon off
SetFont "Tahoma" 8
InstallDir $PROGRAMFILES\MPTabs
InstallDirRegKey HKLM "Software\MPTabs" "Install_Dir"
Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles
UninstallCaption "MPTabs"
UninstallButtonText "D�sinstaller"
UninstallSubCaption 0 " [D�sinstallation]"
UninstallSubCaption 1 " [Nettoyage]"
UninstallSubCaption 2 " [D�sinstallation termin�e]"
UninstallText "Voulez-vous vraiment d�sinstaller MPTabs?" "D�sinstallation: "
AllowRootDirInstall false
# ManifestDPIAware true
MiscButtonText "Pr�c�dent" "Suivant" "Annueler" "Fermer"
BGFont "Tahoma" height 12
Caption "MPTabs"
BrandingText "MPTabs"
CompletedText "All is done."
DetailsButtonText "Details"
FileErrorText "Erreur lors de l'�criture de $\r$\n$0$\r$\nVeuillez r�essayer.$\r$\nSi le probl�me persiste veuillez le rapporter."
InstallColors 00ff00 000000
InstallButtonText "Installer"
InstProgressFlags colored
ShowInstDetails show
ShowUninstDetails show
VIAddVersionKey /LANG=${LANG_FRENCH} "ProductName" "MPTabs"
VIAddVersionKey /LANG=${LANG_FRENCH} "CompanyName" "DrX@TN"
VIAddVersionKey /LANG=${LANG_FRENCH} "FileDescription" "Application tableaux des maladies professionnelles en Tunisie"
VIAddVersionKey /LANG=${LANG_FRENCH} "LegalCopyright" "No Copyright"
VIAddVersionKey /LANG=${LANG_FRENCH} "FileVersion" "${VERSION}"
VIAddVersionKey /LANG=${LANG_FRENCH} "ProductVersion" "${VERSION}"
VIProductVersion "${VERSION}.1"
Function .onInit
	# Pour v�rifier si l'installateur n'est pas d�j� en cours d'ex�cution.
	# http://nsis.sourceforge.net/Allow_only_one_installer_instance
	System::Call 'kernel32::CreateMutex(i 0, i 0, t "MPTabsInstallation") ?e'
	Pop $R0
	StrCmp $R0 0 +3
		MessageBox MB_OK "Le programme d'installation est d�j� en cours d'ex�cution."
	Abort
	MessageBox MB_YESNO "Voulez-vous installer MPTabs l'application tableaux des maladies professionnelles en Tunisie sur votre ordinateur?" IDYES gogogo
	Abort
	gogogo:
FunctionEnd
Function .onInstSuccess
	MessageBox MB_YESNO "L'installation s'est termin�e avec succ�s. Voulez-vous ex�cuter MPTabs maintenant?" IDNO noexec
	Exec $INSTDIR\mptabs.exe
	noexec:
FunctionEnd
Function .onInstFailed
	MessageBox MB_OK "L'installation a �chou�."
FunctionEnd
Function un.onUninstSuccess
	MessageBox MB_OK "L'application MPTabs a �t� d�sinstall�e avec succ�s."
FunctionEnd
Function un.onUninstFailed
	MessageBox MB_OK "La d�sinstallation de MPTabs a �chou�."
FunctionEnd
Section "Install"
	SectionIn RO
	SetAutoClose true
	SetOutPath $INSTDIR
	File /r "qt\release\*"
	WriteRegStr HKLM SOFTWARE\MPTabs "Install_Dir" "$INSTDIR"
	WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\MPTabs" "DisplayName" "MPTabs"
	WriteRegStr HKLM Software\Microsoft\Windows\CurrentVersion\Uninstall\MPTabs" "UninstallString" '"$INSTDIR\uninstall.exe"'
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MPTabs" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MPTabs" "NoRepair" 1
	WriteUninstaller "uninstall.exe"
	CreateDirectory "$SMPROGRAMS\MPTabs\"
	CreateShortCut "$SMPROGRAMS\MPTabs\MPTabs.lnk" "$INSTDIR\mptabs.exe"
	CreateShortCut "$DESKTOP\MPTabs.lnk" "$INSTDIR\mptabs.exe"
	CreateShortCut "$SMPROGRAMS\MPTabs\D�sinstaller.lnk" "$INSTDIR\uninstall.exe"
SectionEnd
Section "Uninstall"
	SetAutoClose true
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MPTabs"
	DeleteRegKey HKLM "SOFTWARE\MPTabs"
	Delete "$INSTDIR\*"
	RMDir /R "$INSTDIR"
	Delete "$SMPROGRAMS\MPTabs\*"
	RMDir /R "$SMPROGRAMS\MPTabs"
	Delete "$DESKTOP\MPTabs.lnk"
SectionEnd
