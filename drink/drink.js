exports.command = "drink";

base = [
"Root Beer",
"Coke",
"Dr. Pepper",
"Sprite",
"Powerade",
"Lemonade",
"Fruit Punch",
"Limeade"
]

mods = [
"Cherry",
"Strawberry",
"Cranberry"
]

rand = function(arr)
{
  return arr[Math.floor(Math.random() * arr.length)];
}

drinkgen = function()
{
  var pre = (rand % 2 ? "Diet" : "");
  return pre + ' ' + rand(base) + ' ' + rand(noun);
}

exports.run = function(r, p, reply)
{
  var drink = '';
  if(p.length > 0)
  {
    drink = drink + p.join(', ') + ': ';
  }
}