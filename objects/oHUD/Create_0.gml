depth = -8000;

// keep track of player's health, MP, lvl and XP to next lvl
playerHP = 0;
playerMaxHP = 0;
playerMP = 0;
playerMaxMana = 0;
playerLevel = 0;
playerXP = 0;
playerXpToLevel = 0;
player_coinPouch = 0;


playerQuestItemCount = 0;
hasQuest = false;
questName = "";
questItemCounter = 0;

questCompleted = false;
questReward = 0;

// dialogue stuff
shopInteraction = false;
questInteraction = false;

interactionDistance = 10;

// boss hp bar stuff
healthPointsMax = 1000;
healthPoints = healthPointsMax;
healthPointsPrev = healthPointsMax;


followUpTimerMax = 60;
followUpTimer = 0;
