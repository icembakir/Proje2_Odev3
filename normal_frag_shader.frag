#version 120

varying vec3 fresnel;

void main(void)
{
	gl_FragColor = vec4(normalize(fresnel),1.0);
}
