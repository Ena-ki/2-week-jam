shader_type canvas_item;

uniform float progress : hint_range(0,1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    vec2 centerUV = UV - vec2(0.5);

    float angle = atan(-centerUV.x, centerUV.y);

    float normalizedAngle = (angle + PI) / (2.0 * PI);

    float mixFactor = mix(0.3, 1.0,step(progress, normalizedAngle));
    

    COLOR.rgb *= mixFactor;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
