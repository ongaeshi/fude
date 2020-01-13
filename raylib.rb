module Raylib
  # slower patch: https://github.com/raysan5/raylib/issues/922
  alias clear_background_org clear_background

  def clear_background(color)
    draw_sphere(Vector3.init(0, 0, 0), 0, WHITE)
    clear_background_org(color)
  end

  class Vector2
    def self.init(x, y)
      o = Vector2.new
      o.x = x
      o.y = y
      o
    end
  end

  class Vector3
    def self.init(x, y, z)
      o = Vector3.new
      o.x = x
      o.y = y
      o.z = z
      o
    end
  end

  class Vector4
    def self.init(x, y, z, w)
      o = Vector4.new
      o.x = x
      o.y = y
      o.z = z
      o.w = w
      o
    end
  end

  class Matrix
    def self.init(m0, m4, m8, m12, m1, m5, m9, m13, m2, m6, m10, m14, m3, m7, m11, m15)
      o = Matrix.new
      o.m0 = m0
      o.m4 = m4
      o.m8 = m8
      o.m12 = m12
      o.m1 = m1
      o.m5 = m5
      o.m9 = m9
      o.m13 = m13
      o.m2 = m2
      o.m6 = m6
      o.m10 = m10
      o.m14 = m14
      o.m3 = m3
      o.m7 = m7
      o.m11 = m11
      o.m15 = m15
      o
    end
  end

  class Color
    def self.init(r, g, b, a)
      o = Color.new
      o.r = r
      o.g = g
      o.b = b
      o.a = a
      o
    end
  end

  class Rectangle
    def self.init(x, y, width, height)
      o = Rectangle.new
      o.x = x
      o.y = y
      o.width = width
      o.height = height
      o
    end
  end

  class Image
    def self.init(width, height, mipmaps, format)
      o = Image.new
      o.width = width
      o.height = height
      o.mipmaps = mipmaps
      o.format = format
      o
    end
  end

  class Texture2D
    def self.init(id, width, height, mipmaps, format)
      o = Texture2D.new
      o.id = id
      o.width = width
      o.height = height
      o.mipmaps = mipmaps
      o.format = format
      o
    end
  end

  class RenderTexture2D
    def self.init(id, texture, depth, depthTexture)
      o = RenderTexture2D.new
      o.id = id
      o.texture = texture
      o.depth = depth
      o.depthTexture = depthTexture
      o
    end
  end

  class NPatchInfo
    def self.init(sourceRec, left, top, right, bottom, type)
      o = NPatchInfo.new
      o.sourceRec = sourceRec
      o.left = left
      o.top = top
      o.right = right
      o.bottom = bottom
      o.type = type
      o
    end
  end

  class CharInfo
    def self.init(value, rec, offsetX, offsetY, advanceX)
      o = CharInfo.new
      o.value = value
      o.rec = rec
      o.offsetX = offsetX
      o.offsetY = offsetY
      o.advanceX = advanceX
      o
    end
  end

  class Font
    def self.init(texture, baseSize, charsCount)
      o = Font.new
      o.texture = texture
      o.baseSize = baseSize
      o.charsCount = charsCount
      o
    end
  end

  class Camera3D
    def self.init(position, target, up, fovy, type)
      o = Camera3D.new
      o.position = position
      o.target = target
      o.up = up
      o.fovy = fovy
      o.type = type
      o
    end
  end

  class Camera2D
    def self.init(offset, target, rotation, zoom)
      o = Camera2D.new
      o.offset = offset
      o.target = target
      o.rotation = rotation
      o.zoom = zoom
      o
    end
  end

  class Mesh
    def self.init()
      o = Mesh.new
      o
    end
  end

  class Shader
    def self.init()
      o = Shader.new
      o
    end
  end

  class MaterialMap
    def self.init()
      o = MaterialMap.new
      o
    end
  end

  class Material
    def self.init()
      o = Material.new
      o
    end
  end

  class Model
    def self.init()
      o = Model.new
      o
    end
  end

  class Transform
    def self.init()
      o = Transform.new
      o
    end
  end

  class BoneInfo
    def self.init()
      o = BoneInfo.new
      o
    end
  end

  class ModelAnimation
    def self.init()
      o = ModelAnimation.new
      o
    end
  end

  class Ray
    def self.init(position, direction)
      o = Ray.new
      o.position = position
      o.direction = direction
      o
    end
  end

  class RayHitInfo
    def self.init(hit, distance, position, normal)
      o = RayHitInfo.new
      o.hit = hit
      o.distance = distance
      o.position = position
      o.normal = normal
      o
    end
  end

  class BoundingBox
    def self.init(min, max)
      o = BoundingBox.new
      o.min = min
      o.max = max
      o
    end
  end

  class Wave
    def self.init()
      o = Wave.new
      o
    end
  end

  class Sound
    def self.init()
      o = Sound.new
      o
    end
  end

  class Music
    def self.init()
      o = Music.new
      o
    end
  end

  class AudioStream
    def self.init()
      o = AudioStream.new
      o
    end
  end

  class VrDeviceInfo
    def self.init()
      o = VrDeviceInfo.new
      o
    end
  end

  # Camera system modes
  CAMERA_CUSTOM = 0
  CAMERA_FREE = 1
  CAMERA_ORBITAL = 2
  CAMERA_FIRST_PERSON = 3
  CAMERA_THIRD_PERSON = 4

  # Camera projection modes
  CAMERA_PERSPECTIVE = 0
  CAMERA_ORTHOGRAPHIC = 1

  # Color
  LIGHTGRAY = Color.init(200, 200, 200, 255)  # Light Gray
  GRAY = Color.init(130, 130, 130, 255)  # Gray
  DARKGRAY = Color.init(80, 80, 80, 255)     # Dark Gray
  YELLOW = Color.init(253, 249, 0, 255)    # Yellow
  GOLD = Color.init(255, 203, 0, 255)    # Gold
  ORANGE = Color.init(255, 161, 0, 255)    # Orange
  PINK = Color.init(255, 109, 194, 255)  # Pink
  RED = Color.init(230, 41, 55, 255)    # Red
  MAROON = Color.init(190, 33, 55, 255)    # Maroon
  GREEN = Color.init(0, 228, 48, 255)     # Green
  LIME = Color.init(0, 158, 47, 255)     # Lime
  DARKGREEN = Color.init(0, 117, 44, 255)     # Dark Green
  SKYBLUE = Color.init(102, 191, 255, 255)  # Sky Blue
  BLUE = Color.init(0, 121, 241, 255)    # Blue
  DARKBLUE = Color.init(0, 82, 172, 255)     # Dark Blue
  PURPLE = Color.init(200, 122, 255, 255)  # Purple
  VIOLET = Color.init(135, 60, 190, 255)   # Violet
  DARKPURPLE = Color.init(112, 31, 126, 255)   # Dark Purple
  BEIGE = Color.init(211, 176, 131, 255)  # Beige
  BROWN = Color.init(127, 106, 79, 255)   # Brown
  DARKBROWN = Color.init(76, 63, 47, 255)     # Dark Brown

  WHITE = Color.init(255, 255, 255, 255)  # White
  BLACK = Color.init(0, 0, 0, 255)        # Black
  BLANK = Color.init(0, 0, 0, 0)          # Transparent
  MAGENTA = Color.init(255, 0, 255, 255)    # Magenta
  RAYWHITE = Color.init(245, 245, 245, 255)  # Ray White

  KEY_SPACE = 32
  KEY_A = 65
  KEY_P = 80
  KEY_R = 82
  KEY_S = 83
  KEY_Z = 90

  KEY_RIGHT = 262
  KEY_LEFT = 263
  KEY_DOWN = 264
  KEY_UP = 265

  # Mouse buttons
  MOUSE_LEFT_BUTTON = 0
  MOUSE_RIGHT_BUTTON = 1
  MOUSE_MIDDLE_BUTTON = 2

  # System config flags
  # NOTE: Used for bit masks
  FLAG_RESERVED = 1     # Reserved
  FLAG_FULLSCREEN_MODE = 2     # Set to run program in fullscreen
  FLAG_WINDOW_RESIZABLE = 4     # Set to allow resizable window
  FLAG_WINDOW_UNDECORATED = 8     # Set to disable window decoration (frame and buttons)
  FLAG_WINDOW_TRANSPARENT = 16    # Set to allow transparent window
  FLAG_WINDOW_HIDDEN = 128   # Set to create the window initially hidden
  FLAG_WINDOW_ALWAYS_RUN = 256   # Set to allow windows running while minimized
  FLAG_MSAA_4X_HINT = 32    # Set to try enabling MSAA 4X
  FLAG_VSYNC_HINT = 64    # Set to try enabling V-Sync on GPU

  # Texture parameters: filter mode
  # NOTE 1: Filtering considers mipmaps if available in the texture
  # NOTE 2: Filter is accordingly set for minification and magnification
  FILTER_POINT = 0                  # No filter, just pixel aproximation
  FILTER_BILINEAR = 1               # Linear filtering
  FILTER_TRILINEAR = 2              # Trilinear filtering (linear with mipmaps)
  FILTER_ANISOTROPIC_4X = 3         # Anisotropic filtering 4x
  FILTER_ANISOTROPIC_8X = 4         # Anisotropic filtering 8x
  FILTER_ANISOTROPIC_16X = 5        # Anisotropic filtering 16x

  def window(x, y, title)
    init_window(x, y, title)
    yield
    close_window
  end

  def draw
    begin_drawing
    yield
    end_drawing
  end

  def mode3d(camera)
    begin_mode3d(camera)
    yield
    end_mode3d
  end

  def mode2d(camera)
    begin_mode2d(camera)
    yield
    end_mode2d
  end

  def texture_mode(target)
    begin_texture_mode(target)
    yield
    end_texture_mode
  end
end
