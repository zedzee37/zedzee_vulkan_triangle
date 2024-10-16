#version 450
#extension GL_EXT_nonuniform_qualifier : require

layout(push_constant) uniform PushConstants {
    uint modelIdx;
} pushConstants;

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubos[];

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    mat4 model = ubos[nonuniformEXT(pushConstants.modelIdx)].model;
    mat4 view = ubos[nonuniformEXT(pushConstants.modelIdx)].view;
    mat4 proj = ubos[nonuniformEXT(pushConstants.modelIdx)].proj;
    gl_Position = proj * view * model * vec4(inPosition, 1.0);
    fragColor = inColor;
    fragTexCoord = inTexCoord;
}
