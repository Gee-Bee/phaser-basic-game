# loading assets
preload = ->
  game.load.image 'sky', 'assets/sky.png'
  game.load.image 'ground', 'assets/platform.png'
  game.load.image 'star', 'assets/star.png'
  game.load.spritesheet 'dude', 'assets/dude.png', 32, 48

create = ->
  # create a new Phaser.Sprite and add to the game world
  # arguments:
  # 1,2: coordinates
  # 3: asset key
  game.add.sprite 0, 0, 'star'

update = ->

game = new Phaser.Game 400, 300, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
