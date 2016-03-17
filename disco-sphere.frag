#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
in vec4 aux;
uniform sampler2D sampler;
void main()
{	
  	vec3 dx = dFdx(aux.xyz);
    vec3 dy = dFdy(aux.xyz);
    vec3 norm = normalize(cross(dx,dy));
    vec2 v; v.s = norm.x; v.t = norm.y;
    vec4 t = texture2D(sampler,v.st);
	fragColor = t*norm.z;;
}

/*
El fragment shader calcularà el color del fragment utilitzant una textura
uniform sampler2D sampler;
de la següent manera. Primer calcularà una aproximació de la normal n (en eye space) fent servir les
funcions dFdx, dFdy, de forma anàloga a l’exercici calculant la normal al fragment shader. Això és
necessari perquè el viewer proporciona normals per vèrtex, però en aquest shader ens interessa una normal
que sigui aproximadament igual per tots els fragments d’una mateixa cara.
Després farà servir les components (nx, ny) de la normal per calcular el color del fragment com el producte
T * n z
on T és el color del texel al punt (s,t) = (nx, ny) de la textura.
*/
