preload = ->

create = ->

update = ->

# game object
# params:
# 1,2: width, height
# 3: rendering context WEBGL, CANVAS, AUTO
# 4: id of container in DOM, if empty canvas is appended to body element
# 5: optional: object with references to essential functions
game = new Phaser.Game 400, 300, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
