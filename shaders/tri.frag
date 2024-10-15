#version 450
#extension GL_EXT_nonuniform_qualifier : require

layout(push_constant) uniform PushConstants {
    uint texIdx;
} pushConstants;

layout(binding = 1) uniform sampler2D texSampler[];

layout(location = 0) in vec3 fragColor;
layout(location = 1) in vec2 fragTexCoord;

layout(location = 0) out vec4 outColor;

void main() {
    outColor = texture(texSampler[nonuniformEXT(pushConstants.texIdx)], fragTexCoord);
}
