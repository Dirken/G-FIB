#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform vec2 mousePosition; //coordenades del cursor

void main()
{
    if(distance(mousePosition, gl_FragCoord.xy) < 90) {
        fragColor = 2.0*frontColor;
    }
    else{
        discard;
        //fragColor = vec4(1,0,0,0);
    }
}
