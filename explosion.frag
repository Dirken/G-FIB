#version 330 core

in vec2 vtexCoord;
in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D explosion; 
uniform float time;

void main()
{
    float x = 1.0/8.0; float y = 1.0/6.0;
    int frame = int(30*time) % 48;
    float auxX = frame%8; float auxY = frame/8;
    vec2 Coord = vtexCoord * vec2(x,y) - vec2(0, y);
    vec2 offset = vec2(x*auxX,-y*auxY);
    fragColor = frontColor * texture(explosion, (Coord + offset));
    fragColor = fragColor.a * fragColor;
}

			
			
			
			
			

