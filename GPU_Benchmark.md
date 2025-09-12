# `glmark2-wayland` test

Power consumption measured stayed under 5W (peak amperage 1.2A)

```
ukhan@orangepi3b:~$ glmark2-wayland
=======================================================
    glmark2 2023.01
=======================================================
    OpenGL Information
    GL_VENDOR:      Mesa
    GL_RENDERER:    Mali-G52 r1 (Panfrost)
    GL_VERSION:     3.2 (Compatibility Profile) Mesa 25.1.5 - kisak-mesa PPA
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
    Surface Size:   800x600 windowed
=======================================================
[build] use-vbo=false: FPS: 103 FrameTime: 9.766 ms
[build] use-vbo=true: FPS: 105 FrameTime: 9.557 ms
[texture] texture-filter=nearest: FPS: 229 FrameTime: 4.375 ms
[texture] texture-filter=linear: FPS: 233 FrameTime: 4.293 ms
[texture] texture-filter=mipmap: FPS: 221 FrameTime: 4.545 ms
[shading] shading=gouraud: FPS: 67 FrameTime: 15.076 ms
[shading] shading=blinn-phong-inf: FPS: 67 FrameTime: 15.140 ms
[shading] shading=phong: FPS: 66 FrameTime: 15.283 ms
[shading] shading=cel: FPS: 66 FrameTime: 15.212 ms
[bump] bump-render=high-poly: FPS: 28 FrameTime: 36.861 ms
[bump] bump-render=normals: FPS: 255 FrameTime: 3.928 ms
[bump] bump-render=height: FPS: 216 FrameTime: 4.641 ms
[effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 214 FrameTime: 4.673 ms
[effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 119 FrameTime: 8.445 ms
[pulsar] light=false:quads=5:texture=false: FPS: 218 FrameTime: 4.589 ms
[desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 113 FrameTime: 8.857 ms
[desktop] effect=shadow:windows=4: FPS: 210 FrameTime: 4.775 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 47 FrameTime: 21.661 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: FPS: 46 FrameTime: 21.842 ms
[buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 45 FrameTime: 22.650 ms
[ideas] speed=duration: FPS: 65 FrameTime: 15.565 ms
[jellyfish] <default>: FPS: 71 FrameTime: 14.260 ms
[terrain] <default>: FPS: 14 FrameTime: 76.187 ms
[shadow] <default>: FPS: 26 FrameTime: 38.586 ms
[refract] <default>: FPS: 3 FrameTime: 341.423 ms
[conditionals] fragment-steps=0:vertex-steps=0: FPS: 233 FrameTime: 4.305 ms
[conditionals] fragment-steps=5:vertex-steps=0: FPS: 246 FrameTime: 4.077 ms
[conditionals] fragment-steps=0:vertex-steps=5: FPS: 244 FrameTime: 4.111 ms
[function] fragment-complexity=low:fragment-steps=5: FPS: 246 FrameTime: 4.073 ms
[function] fragment-complexity=medium:fragment-steps=5: FPS: 245 FrameTime: 4.084 ms
[loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 241 FrameTime: 4.152 ms
[loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 244 FrameTime: 4.103 ms
[loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 245 FrameTime: 4.091 ms
=======================================================
                                  glmark2 Score: 144
=======================================================
```
