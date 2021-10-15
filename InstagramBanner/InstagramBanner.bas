B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.31
@EndOfDesignText@
Sub Class_Globals
	Dim App As AWTRIX
End Sub

' Config your App
Public Sub Initialize() As String
	
	App.Initialize(Me,"App")
	
	'App name (must be unique, avoid spaces)
	App.Name="InstagramBanner"
	
	'Version of the App
	App.Version="1.1"
	
	'Description of the App. You can use HTML to format it
	App.Description=$"Lets you Display your username next to a static Banner Icon"$
	
	App.Author="ephedrum"
	
	App.CoverIcon=58
		
	'SetupInstructions. You can use HTML to format it
	App.setupDescription= $"
	<b>Username</b>  Insert your Instagram username<br />
	<b>IconID:</b>  Choose your desired IconID from AWTRIXER. Instagram: 58, GMAIL: 36,  Spotify: 122, WhatsApp: 146, Twitter: 142, Twitch: 1526, Telegram: 167, Skype: 365, YouTube: 155<br />
	"$
	
	'IconIDs from AWTRIXER. You can add multiple if you want to display them at the same time
	App.Icons=Array As Int(58)
	
	'Tickinterval in ms (should be 65 by default, for smooth scrolling))
	App.Tick=65
	
	
	'needed Settings for this App (Wich can be configurate from user via webinterface)
	App.Settings=CreateMap("Username":"Instagram Username", "IconID":58)
	
	App.MakeSettings
	Return "AWTRIX20"
End Sub

' ignore
public Sub GetNiceName() As String
	Return App.Name
End Sub

Sub App_Started
	
End Sub


' ignore
public Sub Run(Tag As String, Params As Map) As Object
	Return App.interface(Tag,Params)
End Sub

'this sub is called right before AWTRIX will display your App
Sub App_iconRequest
	App.Icons=Array As Int(App.Get("IconID"))
End Sub

'is called every tick, generates the commandlist (drawingroutines) and send it to awtrix
Sub App_genFrame
	App.genText(UserName,True,1,Null,True)
	App.drawBMP(0,0,App.getIcon(App.Get("IconID")),8,8)
End Sub


Sub UserName As String
	Dim usernamestring As String
	usernamestring = App.get("Username")
	
	Return usernamestring
End Sub