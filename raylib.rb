module Raylib
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
  CAMERA_CUSTOM       = 0
  CAMERA_FREE         = 1
  CAMERA_ORBITAL      = 2 
  CAMERA_FIRST_PERSON = 3
  CAMERA_THIRD_PERSON = 4

  # Camera projection modes
  CAMERA_PERSPECTIVE = 0
  CAMERA_ORTHOGRAPHIC = 1
     
  # COlor
  WHITE     = Color.init(255, 255, 255, 255)
  RAYWHITE  = Color.init(245, 245, 245, 255)
  LIGHTGRAY = Color.init(200, 200, 200, 255)
  DARKGRAY  = Color.init(80, 80, 80, 255)
  RED       = Color.init(230, 41, 55, 255)
  MAROON    = Color.init(190, 33, 55, 255)
  SKYBLUE   = Color.init(102, 191, 255, 255)
  BLUE      = Color.init(0, 121, 241, 255)
  BLACK     = Color.init(0, 0, 0, 255)

  KEY_Z               = 90
  KEY_RIGHT           = 262
  KEY_LEFT            = 263
  KEY_DOWN            = 264
  KEY_UP              = 265

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
end

