# risk
Installing the subway by the player on the map


EN:
The plugin allows you to set tags for your team on a button or command.
In the say !r !risk
Or the "E" button according to the standard (it can be changed in the settings)

The settings file under the path cfg/sourcemod/risk.cfg

// With what frequency to display ads about the sm_risk_announce plugin
"70.0"

// Enable/disable
sm_risk_announce_enable plugin advertising "1"

// How many times per second can sm_risk_antispam
"1.3" be called

// Which key will it work on?
sm_risk_button "0"

// Enable/disable sm_risk_enable plugin
"1"

// Texture risks
sm_risk_material "materials/ggwp/risk.vmt"

// Height of the risk
sm_risk_pos2 "100.0"

// Path to the sound that will be played when creating the risk
sm_risk_sound "ggwp/risk.wav"

// Turn on the sound for everyone or only for the one who puts
sm_risk_soundall "1"

// After how many seconds
will the sm_risk_timer "2.0" risk disappear

/********************************************************************************/

RU:
Плагин позволяет на кнопку или команду устанавливать метки для своей команды.
В чат !r !risk
Или кнопка "E" по стандарту (её можно изменить в настройках)

Файл настроек по пути cfg/sourcemod/risk.cfg

// С какой переодичностью отображать рекламу о работае плагина
sm_risk_announce "70.0"

// Включить/выключить рекламу плагина
sm_risk_announce_enable "1"

// Сколько раз в секунду можно вызывать риску
sm_risk_antispam "1.3"

// На какую клавишу будет работать?
sm_risk_button "0"

// Включить/выключить плагин
sm_risk_enable "1"

// Текстура риски
sm_risk_material "materials/ggwp/riska.vmt"

// Высота риски
sm_risk_pos2 "100.0"

// Путь к звуку который будет проигрывать при создания риски
sm_risk_sound "ggwp/risk.wav"

// Включить звук для всех или только для того кто ставит
sm_risk_soundall "1"

// Через сколько секунд пропадёт риска
sm_risk_timer "2.0"

Доступные кнопки:

0: IN_USE;	//Кнопка E

1: IN_JUMP;	//Кнопка прыжок

2: IN_ATTACK;	//ПКМ

3: IN_DUCK;	//CTRL

4: IN_FORWARD;	//W

5: IN_BACK;	//S

6: IN_ATTACK3;	//СКМ

7: IN_CANCEL;	//

8: IN_LEFT;	//A

9: IN_RIGHT;	//D

10: IN_MOVELEFT;	//

11: IN_MOVERIGHT;	//

12: IN_ATTACK2;	//

13: IN_RUN;	//

14: IN_RELOAD;	//

15: IN_ALT1;	//

16: IN_ALT2;	//

17: IN_SCORE;	//Кнопка TAB (просмотр списка игроков)

18: IN_SPEED;	//

19: IN_WALK;	//

20: IN_ZOOM;	//

21: IN_WEAPON1;	//

22: IN_WEAPON2;	//

23: IN_BULLRUSH;	//

24: IN_GRENADE1;	//

25: IN_GRENADE2;	//
