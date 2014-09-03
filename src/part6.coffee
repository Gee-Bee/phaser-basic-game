# loading assets
preload = ->
  game.load.image 'sky', 'assets/sky.png'
  game.load.image 'ground', 'assets/platform.png'
  game.load.image 'star', 'assets/star.png'
  game.load.spritesheet 'dude', 'assets/dude.png', 32, 48

create = ->
  # start Arcade physics systems
  # sprites are given new body property, instance of ArcadePhysics.Body
  game.physics.startSystem(Phaser.Physics.ARCADE)

  # world building
  game.add.sprite 0, 0, 'sky'

  this.platforms = platforms = game.add.group()
  platforms.enableBody = true
  ground = platforms.create 0, game.world.height - 64, 'ground'
  ground.scale.setTo 2, 2
  ground.body.immovable = true
  ledge = platforms.create 400, 400, 'ground'
  ledge.body.immovable = true
  ledge = platforms.create -150, 250, 'ground'
  ledge.body.immovable = true

  # player
  this.player = player = game.add.sprite 32, game.world.height - 150, 'dude'
  # enable physics on the player
  game.physics.arcade.enable player
  # physics properties
  player.body.bounce.y = .2
  player.body.gravity.y = 300
  player.body.collideWorldBounds = true

  # walking left and right animations
  player.animations.add 'left', [0, 1, 2, 3], 10, true
  player.animations.add 'right', [5, 6, 7, 8], 10, true


update = ->
  # collide player with the platforms
  game.physics.arcade.collide(this.player, this.platforms)

game = new Phaser.Game 800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
