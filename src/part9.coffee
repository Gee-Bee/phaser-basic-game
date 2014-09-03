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

  # platforms
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
  player.body.bounce.y = 0.2
  player.body.gravity.y = 300
  player.body.collideWorldBounds = true
  # walking left and right animations
  player.animations.add 'left', [0, 1, 2, 3], 10, true
  player.animations.add 'right', [5, 6, 7, 8], 10, true

  #stars
  this.stars = stars = game.add.group()
  stars.enableBody = true
  for i in [0..12]
    star = stars.create i * 70 , 0, 'star'
    star.body.gravity.y = 60
    star.body.bounce.y = 0.3 + Math.random() * 0.2

  this.score = 0
  this.scoreText = game.add.text 16, 16, 'score: 0',
    fontSize: '32px',
    fill: '#000'

update = ->
  player = this.player
  platforms = this.platforms
  stars = this.stars

  # collide player with the platforms
  game.physics.arcade.collide(player, platforms)
  game.physics.arcade.collide(stars, platforms)

  # check if player overlaps the stars
  game.physics.arcade.overlap(player, stars, collectStar, null, this)

  # returns object with 4 Phaser.Key objects: up, down, left, right
  cursors = game.input.keyboard.createCursorKeys()

  if cursors.left.isDown  # move left
    player.body.velocity.x = -150
    player.animations.play 'left'
  else if cursors.right.isDown # move right
    player.body.velocity.x = 150
    player.animations.play 'right'
  else # stand still
    player.body.velocity.x = 0
    player.animations.stop()
    player.frame = 4

  if cursors.up.isDown and player.body.touching.down
    player.body.velocity.y = -300

  return


game = new Phaser.Game 800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update

collectStar = (player, star) ->
  # remove the star from the screen
  star.kill()

  # update the score
  this.score += 10
  this.scoreText.text = "Score: #{this.score}"

  return
