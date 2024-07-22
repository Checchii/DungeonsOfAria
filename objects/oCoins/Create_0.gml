/// @description Insert description here
// You can write your code in this editor
depth = -20;

spr_coins = sAllCoins;

// height and width of sprite 
coins_width = sprite_get_width(spr_coins); // 18
coins_height = sprite_get_height(spr_coins); // 32*3


// width and height of each coin
gcoin_width = coins_width;
gcoin_height = coins_height / 3; // 32

scoin_width = coins_width;
scoin_height = coins_height * (2/3); // 64

ccoin_width = coins_width;
ccoin_height = coins_height; // 96


// offset where it draws
x_offset = coins_width / 2;
y_offset = coins_height;

randomCoin = irandom_range(0,3);

gold_coin = false;
silver_coin = false;
copper_coin = false;
