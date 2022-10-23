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

Available buttons:

case 0: BUTTONS = IN_USE; //Button E
case 1: BUTTONS = IN_JUMP; //Jump button
case 2: BUTTONS = IN_ATTACK; //PCM
case 3: BUTTONS =IN_DUCK; //CTRL
case 4: BUTTONS=IN_FORWARD; //W
case 5: BUTTONS=IN_BACK; //S
case 6: BUTTONS= IN_ATTACK3; //SCM
case 7: BUTTONS = IN_CANCEL; //
case 8: BUTTONS = IN_LEFT; //
Case 9: BUTTONS = IN_RIGHT; //D
case 10: BUTTONS = IN_MOVELEFT; //
case 11: BUTTONS = IN_MOVERIGHT; //
case 12: BUTTONS = IN_ATTACK2; //
case 13: BUTTONS = IN_RUN; //
case 14: BUTTONS = IN_RELOAD; //
case 15: BUTTONS = IN_ALT1; //
case 16: BUTTONS = IN_ALT2; //
case 17: BUTTONS = IN_SCORE; //Tab button (viewing the list of players)
case 18: BUTTONS = IN_SPEED; //
case 19: BUTTONS = IN_WALK; //
case 20: BUTTONS = IN_ZOOM; //
case 21: BUTTONS = IN_WEAPON1; //
case 22: BUTTONS = IN_WEAPON2; //
case 23: BUTTONS = IN_BULLRUSH; //
case 24: BUTTONS = IN_GRENADE1; //
Case 25: BUTTONS = IN_GRENADE2; //

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

case 0: BUTTONS = IN_USE;                //Кнопка E

case 1: BUTTONS = IN_JUMP;                //Кнопка прыжок

case 2: BUTTONS = IN_ATTACK;            //ПКМ

case 3: BUTTONS = IN_DUCK;                //CTRL

case 4: BUTTONS = IN_FORWARD;            //W
case 5: BUTTONS = IN_BACK;                //S
case 6: BUTTONS = IN_ATTACK3;            //СКМ
case 7: BUTTONS = IN_CANCEL;            //
case 8: BUTTONS = IN_LEFT;                //A
case 9: BUTTONS = IN_RIGHT;                //D
case 10: BUTTONS = IN_MOVELEFT;            //
case 11: BUTTONS = IN_MOVERIGHT;        //
case 12: BUTTONS = IN_ATTACK2;            //
case 13: BUTTONS = IN_RUN;                //
case 14: BUTTONS = IN_RELOAD;            //
case 15: BUTTONS = IN_ALT1;                //
case 16: BUTTONS = IN_ALT2;                //
case 17: BUTTONS = IN_SCORE;            //Кнопка TAB (просмотр списка игроков)
case 18: BUTTONS = IN_SPEED;            //
case 19: BUTTONS = IN_WALK;                //
case 20: BUTTONS = IN_ZOOM;                //
case 21: BUTTONS = IN_WEAPON1;            //
case 22: BUTTONS = IN_WEAPON2;            //
case 23: BUTTONS = IN_BULLRUSH;            //
case 24: BUTTONS = IN_GRENADE1;            //
case 25: BUTTONS = IN_GRENADE2;            //
