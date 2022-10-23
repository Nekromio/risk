#include <sdktools_functions>
#include <sdktools_stringtables>
#include <sdktools_engine>
#include <sdktools_sound>
#include <sdktools_entinput>
#include <sdktools_trace>
#include <smartdm>
#include <sdkhooks>
#include <colors_ws>

ConVar
	cvEnable,
	cvTimerEnable,
	cvTimer,
	cvVoiceSoundAll,
	cvKillRisk,
	cvAntispam,
	cvPos2,
	cvButton;
	
char
	Engine_Version,
	sModel[PLATFORM_MAX_PATH],
	sSound[PLATFORM_MAX_PATH],
	sButton;
	
float
	fLastUsed[MAXPLAYERS+1];

#define GAME_UNDEFINED 0
#define GAME_CSS_34 1
#define GAME_CSS 2
#define GAME_CSGO 3

int GetCSGame()
{
	if (GetFeatureStatus(FeatureType_Native, "GetEngineVersion") == FeatureStatus_Available) 
	{ 
		switch (GetEngineVersion()) 
		{ 
			case Engine_SourceSDK2006: return GAME_CSS_34; 
			case Engine_CSS: return GAME_CSS; 
			case Engine_CSGO: return GAME_CSGO; 
		} 
	}
	return GAME_UNDEFINED;
}

public Plugin myinfo =
{
	name = "[Any] Risk/Риска",
	author = "Nek.'a 2x2 | ggwp.site",
	description = "Засвет места противников",
	version = "1.2.8",
	url = "https://ggwp.site/"
};

public void OnPluginStart()
{
	Engine_Version = GetCSGame();
	if(Engine_Version == GAME_UNDEFINED) SetFailState("Game is not supported!");
	if(Engine_Version == GAME_CSS_34) LoadTranslations("risk_cssv34");
	if(Engine_Version == GAME_CSS) LoadTranslations("risk_css");
	if(Engine_Version == GAME_CSGO) LoadTranslations("risk_csgo");
	
	ConVar cvar;
	cvEnable = CreateConVar("sm_risk_enable", "1", "Включить/выключить плагин", _, true, _, true, 1.0);
	
	cvVoiceSoundAll = CreateConVar("sm_risk_soundall", "1", "Включить звук для всех или только для того кто ставит", _, true, _, true, 1.0);

	cvTimerEnable = CreateConVar("sm_risk_announce_enable", "1", "Включить/выключить рекламу плагина", _, true, _, true, 1.0);

	cvTimer = CreateConVar("sm_risk_announce", "70.0", "С какой переодичностью отображать рекламу о работае плагина");
	
	cvKillRisk = CreateConVar("sm_risk_timer", "2.0", "Через сколько секунд пропадёт риска");
	
	cvAntispam = CreateConVar("sm_risk_antispam", "1.3", "Сколько раз в секунду можно вызывать риску");
	
	cvPos2 = CreateConVar("sm_risk_pos2", "100.0", "Высота риски");
	
	cvButton = CreateConVar("sm_risk_button", "0", "На какую клавишу будет работать?");
	
	cvar = CreateConVar("sm_risk_sound", "ggwp/risk.wav", "Путь к звуку который будет проигрывать при создания риски");
	GetConVarString(cvar, sSound, sizeof(sSound));
	HookConVarChange(cvar, OnConVarChanges_Sound);
	
	cvar = CreateConVar("sm_risk_material", "materials/ggwp/riska.vmt", "Текстура риски");
	GetConVarString(cvar, sModel, sizeof(sModel));
	HookConVarChange(cvar, OnConVarChanges_Models);
	
	AutoExecConfig(true, "risk");

	RegConsoleCmd("sm_mark", CmdCreateModel);
	RegConsoleCmd("sm_risk", CmdCreateModel);
	RegConsoleCmd("sm_r", CmdCreateModel);
}

public void OnConVarChanges_Sound(ConVar cvar, const char[] oldValue, const char[] newValue)
{
	GetConVarString(cvar, sSound, sizeof(sSound));
}

public void OnConVarChanges_Models(ConVar cvar, const char[] oldValue, const char[] newValue)
{
	GetConVarString(cvar, sModel, sizeof(sModel));
}

public void OnConfigsExecuted()
{
	switch(cvButton.IntValue)
	{
		case 0: sButton = IN_USE;
		case 1: sButton = IN_JUMP;
		case 2: sButton = IN_ATTACK;
		case 3: sButton = IN_DUCK;
		case 4: sButton = IN_FORWARD;
		case 5: sButton = IN_BACK;
		case 6: sButton = IN_ATTACK3;
		case 7: sButton = IN_CANCEL;
		case 8: sButton = IN_LEFT;
		case 9: sButton = IN_RIGHT;
		case 10: sButton = IN_MOVELEFT;
		case 11: sButton = IN_MOVERIGHT;
		case 12: sButton = IN_ATTACK2;
		case 13: sButton = IN_RUN;
		case 14: sButton = IN_RELOAD;
		case 15: sButton = IN_ALT1;
		case 16: sButton = IN_ALT2;
		case 17: sButton = IN_SCORE;
		case 18: sButton = IN_SPEED;
		case 19: sButton = IN_WALK;
		case 20: sButton = IN_ZOOM;
		case 21: sButton = IN_WEAPON1;
		case 22: sButton = IN_WEAPON2;
		case 23: sButton = IN_BULLRUSH;
		case 24: sButton = IN_GRENADE1;
		case 25: sButton = IN_GRENADE2;
	}
}

public void OnMapStart() 
{
	if(!cvEnable.BoolValue)
		return;
		
	char sBuffer[PLATFORM_MAX_PATH];
	
	if(sSound[0])
	{
		PrecacheSound(sSound, true);
		Format(sBuffer, sizeof(sBuffer), "sound/%s", sSound);
		AddFileToDownloadsTable(sBuffer);
	}
	
	if(sModel[0])
	{
		PrecacheModel(sModel);
		Downloader_AddFileToDownloadsTable(sModel);
	}
}

public void OnClientPutInServer(int client)
{
	if(cvEnable.BoolValue && cvTimerEnable.BoolValue)
		CreateTimer(cvTimer.FloatValue, TimerAnnounce, GetClientUserId(client), TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
}

public void OnClientDisconnect(int client)
{
	fLastUsed[client] = 0.0;
}

Action TimerAnnounce(Handle timer, any userid) 
{
	int client = GetClientOfUserId(userid);
	if(client > 0 && IsClientConnected(client) && IsClientInGame(client)) 
	{
		CPrint(client, "Print announce");
		return Plugin_Continue; 
	}
	return Plugin_Stop; 
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon)
{
	if(!cvEnable.BoolValue)
		return;

	if(buttons & sButton && IsClientInGame(client) && IsPlayerAlive(client))
	{
		ActionRisk(client);
	}
}

Action CmdCreateModel(int client, any args)	
{
	if(cvEnable.BoolValue)
		ActionRisk(client);
		
	return Plugin_Continue;
}

void ActionRisk(int client)
{
	if(fLastUsed[client] > GetGameTime() - cvAntispam.FloatValue)
		return;
	if(client && IsPlayerAlive(client))
		CreateIcon(client);
	if(IsPlayerAlive(client)) CPrint(client, "Caused a risk client");

	fLastUsed[client] = GetGameTime();
	
	for(int i = 1; i <= MaxClients; i++) if(IsClientInGame(i) && !IsFakeClient(i) && GetClientTeam(client) == GetClientTeam(i) && i != client)
		CPrint(i, "Caused a risk", "%t", "Caused a risk", client);
}

void CreateIcon(int client)
{
	float fPos[3], fAng[3];
	int iEntity;
	
	GetClientEyePosition(client, fPos);
	GetClientEyeAngles(client, fAng);
	TR_TraceRayFilter(fPos, fAng, MASK_SOLID, RayType_Infinite, TRDontHitSelf, client);	
	
	if(TR_DidHit(INVALID_HANDLE))
	{
		TR_GetEndPosition(fPos, INVALID_HANDLE);
		if(Engine_Version == GAME_CSS_34)
		{
			iEntity = CreateEntityByName("env_sprite");
			DispatchKeyValue(iEntity, "classname", "env_sprite");
		}
		else
		{
			iEntity = CreateEntityByName("env_sprite_oriented");
			DispatchKeyValue(iEntity, "classname", "env_sprite_oriented");
		}
		fPos[2] += cvPos2.FloatValue;
		DispatchKeyValue(iEntity, "model", sModel);
		DispatchKeyValueVector(iEntity, "origin", fPos);
		if(!cvVoiceSoundAll.BoolValue)
			EmitSoundToClient(client, sSound);
		else
			EmitSoundToAll(sSound, client);
		SetEntPropEnt(iEntity, Prop_Send, "m_hOwnerEntity", client);
		DispatchSpawn(iEntity)
		SetEdictFlags(iEntity, GetEdictFlags(iEntity) & ~(FL_EDICT_ALWAYS|FL_EDICT_DONTSEND|FL_EDICT_PVSCHECK));
		SDKHook(iEntity, SDKHook_SetTransmit, OnTransmit);
		CreateTimer(cvKillRisk.FloatValue, TimerKillRisk, iEntity);
	}
}

Action OnTransmit(int iEntity, int client)
{
	SetEdictFlags(iEntity, GetEdictFlags(iEntity) & ~(FL_EDICT_ALWAYS|FL_EDICT_DONTSEND|FL_EDICT_PVSCHECK));
	
	if(GetClientTeam(GetEntPropEnt(iEntity, Prop_Send, "m_hOwnerEntity")) == GetClientTeam(client))
		return Plugin_Continue;
	else
		return Plugin_Handled;
}

Action TimerKillRisk(Handle hTimer, any iEntity)
{
	if (IsValidEdict(iEntity))
	{
		float fPos[3];
		GetEntPropVector(iEntity, Prop_Send, "m_vecOrigin", fPos);
		AcceptEntityInput(iEntity, "Kill");
	}
}

bool TRDontHitSelf(int client, int mask, any data)
{
	return client != data;
}

