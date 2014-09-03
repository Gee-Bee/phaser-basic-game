# loading assets
preload = ->
  # parameters
  # 1: asset key
  # 2: path
  game.load.image 'sky', 'assets/sky.png'
  game.load.image 'ground', 'assets/platform.png'
  game.load.image 'star', 'assets/star.png'
  game.load.spritesheet 'dude', 'assets/dude.png', 32, 48

create = ->

update = ->

game = new Phaser.Game 400, 300, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
