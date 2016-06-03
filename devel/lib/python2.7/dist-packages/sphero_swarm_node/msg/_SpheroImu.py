# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sphero_swarm_node/SpheroImu.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import std_msgs.msg

class SpheroImu(genpy.Message):
  _md5sum = "20ae3401bf7716c60688d084d6c356ec"
  _type = "sphero_swarm_node/SpheroImu"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """std_msgs/Header header
string name
geometry_msgs/Quaternion orientation
float64[9] orientation_covariance
geometry_msgs/Vector3 angular_velocity
float64[9] angular_velocity_covariance
geometry_msgs/Vector3 linear_acceleration
float64[9] linear_acceleration_covariance

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
float64 z
"""
  __slots__ = ['header','name','orientation','orientation_covariance','angular_velocity','angular_velocity_covariance','linear_acceleration','linear_acceleration_covariance']
  _slot_types = ['std_msgs/Header','string','geometry_msgs/Quaternion','float64[9]','geometry_msgs/Vector3','float64[9]','geometry_msgs/Vector3','float64[9]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,name,orientation,orientation_covariance,angular_velocity,angular_velocity_covariance,linear_acceleration,linear_acceleration_covariance

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SpheroImu, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.name is None:
        self.name = ''
      if self.orientation is None:
        self.orientation = geometry_msgs.msg.Quaternion()
      if self.orientation_covariance is None:
        self.orientation_covariance = [0.,0.,0.,0.,0.,0.,0.,0.,0.]
      if self.angular_velocity is None:
        self.angular_velocity = geometry_msgs.msg.Vector3()
      if self.angular_velocity_covariance is None:
        self.angular_velocity_covariance = [0.,0.,0.,0.,0.,0.,0.,0.,0.]
      if self.linear_acceleration is None:
        self.linear_acceleration = geometry_msgs.msg.Vector3()
      if self.linear_acceleration_covariance is None:
        self.linear_acceleration_covariance = [0.,0.,0.,0.,0.,0.,0.,0.,0.]
    else:
      self.header = std_msgs.msg.Header()
      self.name = ''
      self.orientation = geometry_msgs.msg.Quaternion()
      self.orientation_covariance = [0.,0.,0.,0.,0.,0.,0.,0.,0.]
      self.angular_velocity = geometry_msgs.msg.Vector3()
      self.angular_velocity_covariance = [0.,0.,0.,0.,0.,0.,0.,0.,0.]
      self.linear_acceleration = geometry_msgs.msg.Vector3()
      self.linear_acceleration_covariance = [0.,0.,0.,0.,0.,0.,0.,0.,0.]

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_4d.pack(_x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w))
      buff.write(_struct_9d.pack(*self.orientation_covariance))
      _x = self
      buff.write(_struct_3d.pack(_x.angular_velocity.x, _x.angular_velocity.y, _x.angular_velocity.z))
      buff.write(_struct_9d.pack(*self.angular_velocity_covariance))
      _x = self
      buff.write(_struct_3d.pack(_x.linear_acceleration.x, _x.linear_acceleration.y, _x.linear_acceleration.z))
      buff.write(_struct_9d.pack(*self.linear_acceleration_covariance))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.orientation is None:
        self.orientation = geometry_msgs.msg.Quaternion()
      if self.angular_velocity is None:
        self.angular_velocity = geometry_msgs.msg.Vector3()
      if self.linear_acceleration is None:
        self.linear_acceleration = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.name = str[start:end].decode('utf-8')
      else:
        self.name = str[start:end]
      _x = self
      start = end
      end += 32
      (_x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w,) = _struct_4d.unpack(str[start:end])
      start = end
      end += 72
      self.orientation_covariance = _struct_9d.unpack(str[start:end])
      _x = self
      start = end
      end += 24
      (_x.angular_velocity.x, _x.angular_velocity.y, _x.angular_velocity.z,) = _struct_3d.unpack(str[start:end])
      start = end
      end += 72
      self.angular_velocity_covariance = _struct_9d.unpack(str[start:end])
      _x = self
      start = end
      end += 24
      (_x.linear_acceleration.x, _x.linear_acceleration.y, _x.linear_acceleration.z,) = _struct_3d.unpack(str[start:end])
      start = end
      end += 72
      self.linear_acceleration_covariance = _struct_9d.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_4d.pack(_x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w))
      buff.write(self.orientation_covariance.tostring())
      _x = self
      buff.write(_struct_3d.pack(_x.angular_velocity.x, _x.angular_velocity.y, _x.angular_velocity.z))
      buff.write(self.angular_velocity_covariance.tostring())
      _x = self
      buff.write(_struct_3d.pack(_x.linear_acceleration.x, _x.linear_acceleration.y, _x.linear_acceleration.z))
      buff.write(self.linear_acceleration_covariance.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.orientation is None:
        self.orientation = geometry_msgs.msg.Quaternion()
      if self.angular_velocity is None:
        self.angular_velocity = geometry_msgs.msg.Vector3()
      if self.linear_acceleration is None:
        self.linear_acceleration = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.name = str[start:end].decode('utf-8')
      else:
        self.name = str[start:end]
      _x = self
      start = end
      end += 32
      (_x.orientation.x, _x.orientation.y, _x.orientation.z, _x.orientation.w,) = _struct_4d.unpack(str[start:end])
      start = end
      end += 72
      self.orientation_covariance = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=9)
      _x = self
      start = end
      end += 24
      (_x.angular_velocity.x, _x.angular_velocity.y, _x.angular_velocity.z,) = _struct_3d.unpack(str[start:end])
      start = end
      end += 72
      self.angular_velocity_covariance = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=9)
      _x = self
      start = end
      end += 24
      (_x.linear_acceleration.x, _x.linear_acceleration.y, _x.linear_acceleration.z,) = _struct_3d.unpack(str[start:end])
      start = end
      end += 72
      self.linear_acceleration_covariance = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=9)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3I = struct.Struct("<3I")
_struct_3d = struct.Struct("<3d")
_struct_4d = struct.Struct("<4d")
_struct_9d = struct.Struct("<9d")
