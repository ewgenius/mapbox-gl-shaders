module.exports = {
  debug: {
    fragmentSource: require('./src/debug.fragment.glsl'),
    vertexSource: require('./src/debug.vertex.glsl')
  },
  fill: {
    fragmentSource: require('./src/fill.fragment.glsl'),
    vertexSource: require('./src/fill.vertex.glsl')
  },
  circle: {
    fragmentSource: require('./src/circle.fragment.glsl'),
    vertexSource: require('./src/circle.vertex.glsl')
  },
  line: {
    fragmentSource: require('./src/line.fragment.glsl'),
    vertexSource: require('./src/line.vertex.glsl')
  },
  linepattern: {
    fragmentSource: require('./src/linepattern.fragment.glsl'),
    vertexSource: require('./src/linepattern.vertex.glsl')
  },
  linesdfpattern: {
    fragmentSource: require('./src/linesdfpattern.fragment.glsl'),
    vertexSource: require('./src/linesdfpattern.vertex.glsl')
  },
  outline: {
    fragmentSource: require('./src/outline.fragment.glsl'),
    vertexSource: require('./src/outline.vertex.glsl')
  },
  outlinepattern: {
    fragmentSource: require('./src/outlinepattern.fragment.glsl'),
    vertexSource: require('./src/outlinepattern.vertex.glsl')
  },
  pattern: {
    fragmentSource: require('./src/pattern.fragment.glsl'),
    vertexSource: require('./src/pattern.vertex.glsl')
  },
  raster: {
    fragmentSource: require('./src/raster.fragment.glsl'),
    vertexSource: require('./src/raster.vertex.glsl')
  },
  icon: {
    fragmentSource: require('./src/icon.fragment.glsl'),
    vertexSource: require('./src/icon.vertex.glsl')
  },
  sdf: {
    fragmentSource: require('./src/sdf.fragment.glsl'),
    vertexSource: require('./src/sdf.vertex.glsl')
  },
  collisionbox: {
    fragmentSource: require('./src/collisionbox.fragment.glsl'),
    vertexSource: require('./src/collisionbox.vertex.glsl')
  }
};

module.exports.util = require('./util.vertex.glsl');
