module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.initConfig
    coffee:
      compile:
        expand: true,
        flatten: true,
        cwd: "#{__dirname}/src/",
        src: ['*.coffee'],
        dest: 'js/',
        ext: '.js'
    watch:
      coffee:
        files: 'src/*.coffee'
        tasks: ['coffee:compile']
        options:
          livereload: true
    connect:
      uses_defaults: {}

  grunt.registerTask 'default', ['connect', 'watch']
