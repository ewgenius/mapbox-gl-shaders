#ifdef GL_ES
precision highp float;
#else
#define lowp
#define mediump
#define highp
#endif

attribute vec2 a_pos;
attribute vec2 a_offset;
attribute vec4 a_data1;
attribute vec4 a_data2;


// matrix is for the vertex position, exmatrix is for rotating and projecting
// the extrusion vector.
uniform mat4 u_matrix;
#ifndef MAPBOX_GL_JS
uniform mat4 u_exmatrix;
#endif

uniform mediump float u_zoom;
uniform bool u_skewed;
#ifdef MAPBOX_GL_JS
uniform vec2 u_extrude_scale;
#endif

uniform vec2 u_texsize;

varying vec2 v_tex;
varying vec2 v_fade_tex;
varying float v_gamma_scale;

void main() {
    vec2 a_tex = a_data1.xy;
    mediump float a_labelminzoom = a_data1[2];
    mediump vec2 a_zoom = a_data2.st;
    mediump float a_minzoom = a_zoom[0];
    mediump float a_maxzoom = a_zoom[1];

    // u_zoom is the current zoom level adjusted for the change in font size
#ifndef MAPBOX_GL_JS
    float show = step(a_minzoom, u_zoom) * (1.0 - step(a_maxzoom, u_zoom));
#else
    mediump float z = 2.0 - step(a_minzoom, u_zoom) - (1.0 - step(a_maxzoom, u_zoom));
#endif

#ifdef MAPBOX_GL_JS
    vec2 extrude = u_extrude_scale * (a_offset / 64.0);
#endif
    if (u_skewed) {
#ifndef MAPBOX_GL_JS
        vec4 extrude = u_exmatrix * vec4(a_offset * show / 64.0, 0, 0);
        gl_Position = u_matrix * vec4(a_pos + extrude.xy, 0, 1);
#else
        gl_Position = u_matrix * vec4(a_pos + extrude, 0, 1);
        gl_Position.z += z * gl_Position.w;
#endif
    } else {
#ifndef MAPBOX_GL_JS
        vec4 extrude = u_exmatrix * vec4(a_offset * show / 64.0, 0, 0);
        gl_Position = u_matrix * vec4(a_pos, 0, 1) + extrude;
#else
        gl_Position = u_matrix * vec4(a_pos, 0, 1) + vec4(extrude, 0, 0);
#endif
    }

    v_gamma_scale = (gl_Position.w - 0.5);

    v_tex = a_tex / u_texsize;
    v_fade_tex = vec2(a_labelminzoom / 255.0, 0.0);
}