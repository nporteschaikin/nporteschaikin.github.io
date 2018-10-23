module.exports = function (grunt) {
  grunt.initConfig({
    jade: {
      compile: {
        files: {
          "index.html": "src/index.jade"
        }
      }
    },
    less: {
      compile: {
        files: {
          "css/application.css": ["src/less/application.less"]
        }
      }
    },
    postcss: {
      compile: {
        options: {
          processors: [
            require("autoprefixer-core")()
          ]
        },
        files: {
          "css/application.css": ["css/application.css"]
        }
      }
    },
    watch: {
      src: {
        files: "src/**/*",
        tasks: "compile",
        livereload: true
      }
    }

  });

  grunt.loadNpmTasks("grunt-contrib-jade");
  grunt.loadNpmTasks("grunt-contrib-less");
  grunt.loadNpmTasks("grunt-contrib-watch");
  grunt.loadNpmTasks("grunt-postcss");

  grunt.registerTask("compile", ["jade", "less", "postcss"]);
}
