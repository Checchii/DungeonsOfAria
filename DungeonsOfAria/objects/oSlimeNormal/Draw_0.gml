draw_self();

// draw hp bar
var _healthPercent = hp / max_hp;
var _hpImage = _healthPercent * (sprite_get_number( sEnemyHealth ) - 1);
draw_sprite(sEnemyHealth, _hpImage, x - 6 , y + 2);

