# loading assets
preload = ->
  game.load.image 'sky', 'assets/sky.png'
  game.load.image 'ground', 'assets/platform.png'
  game.load.image 'star', 'assets/star.png'
  game.load.spritesheet 'dude', 'assets/dude.png', 32, 48

# world building
create = ->
  # Arcade Physics system
  game.physics.startSystem(Phaser.Physics.ARCADE)

  # Sky background
  game.add.sprite 0, 0, 'sky'

  # group that will contain ground and 2 ledges
  platforms = game.add.group()
  # enable physics for any object in this group
  platforms.enableBody = true
  # add ground to platforms group and scale it
  ground = platforms.create 0, game.world.height - 64, 'ground'
  ground.scale.setTo 2, 2
  # stops ground from falling away when you jump on it
  ground.body.immovable = true
  # 2 ledges
  ledge = platforms.create 400, 400, 'ground'
  ledge.body.immovable = true
  ledge = platforms.create -150, 250, 'ground'
  ledge.body.immovable = true

update = ->

game = new Phaser.Game 800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
