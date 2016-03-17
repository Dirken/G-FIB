#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    //Una vegada realitzada la divisió de perfectiva les y oscilen entre -1 i 1
    float minimY = -1.0;
    float maximY = 1.0;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
    //gl_Position és el en coordenades de clip space i només s'ha de dividir per w per tenir les coordenades normalitzades
    float val_color = 4.0 * (gl_Position.y/gl_Position.w - minimY) / (maximY - minimY);
    float mixed_value = fract(val_color);
    vec4 final_color;
    if (val_color <= 0.0) final_color = vec4(1,0,0,0);
    //red to yellow
    else if (val_color < 1.0) final_color = mix(vec4(1,0,0,0), vec4(1,1,0,0), mixed_value);
    //yellow to green
    else if (val_color < 2.0) final_color = mix(vec4(1,1,0,0), vec4(0,1,0,0), mixed_value);
    //green to cian
    else if (val_color < 3.0) final_color = mix(vec4(0,1,0,0), vec4(0,1,1,0), mixed_value);
    //cian to blue
    else if (val_color < 4.0) final_color = mix(vec4(0,1,1,0), vec4(0,0,1,0), mixed_value);
    else final_color = vec4(0,0,1,0);
    frontColor = final_color;
    vtexCoord = texCoord;
}
