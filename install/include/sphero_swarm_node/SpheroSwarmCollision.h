// Generated by gencpp from file sphero_swarm_node/SpheroSwarmCollision.msg
// DO NOT EDIT!


#ifndef SPHERO_SWARM_NODE_MESSAGE_SPHEROSWARMCOLLISION_H
#define SPHERO_SWARM_NODE_MESSAGE_SPHEROSWARMCOLLISION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace sphero_swarm_node
{
template <class ContainerAllocator>
struct SpheroSwarmCollision_
{
  typedef SpheroSwarmCollision_<ContainerAllocator> Type;

  SpheroSwarmCollision_()
    : header()
    , name()
    , x(0)
    , y(0)
    , z(0)
    , axis(0)
    , x_magnitude(0)
    , y_magnitude(0)
    , speed(0)
    , timestamp(0)  {
    }
  SpheroSwarmCollision_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , name(_alloc)
    , x(0)
    , y(0)
    , z(0)
    , axis(0)
    , x_magnitude(0)
    , y_magnitude(0)
    , speed(0)
    , timestamp(0)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef int32_t _x_type;
  _x_type x;

   typedef int32_t _y_type;
  _y_type y;

   typedef int32_t _z_type;
  _z_type z;

   typedef int32_t _axis_type;
  _axis_type axis;

   typedef int32_t _x_magnitude_type;
  _x_magnitude_type x_magnitude;

   typedef int32_t _y_magnitude_type;
  _y_magnitude_type y_magnitude;

   typedef int32_t _speed_type;
  _speed_type speed;

   typedef int32_t _timestamp_type;
  _timestamp_type timestamp;




  typedef boost::shared_ptr< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> const> ConstPtr;

}; // struct SpheroSwarmCollision_

typedef ::sphero_swarm_node::SpheroSwarmCollision_<std::allocator<void> > SpheroSwarmCollision;

typedef boost::shared_ptr< ::sphero_swarm_node::SpheroSwarmCollision > SpheroSwarmCollisionPtr;
typedef boost::shared_ptr< ::sphero_swarm_node::SpheroSwarmCollision const> SpheroSwarmCollisionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sphero_swarm_node

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'geometry_msgs': ['/opt/ros/jade/share/geometry_msgs/cmake/../msg'], 'sphero_swarm_node': ['/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg'], 'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ac8a5273e1209bdbf3dc1e72a29bdfee";
  }

  static const char* value(const ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xac8a5273e1209bdbULL;
  static const uint64_t static_value2 = 0xf3dc1e72a29bdfeeULL;
};

template<class ContainerAllocator>
struct DataType< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sphero_swarm_node/SpheroSwarmCollision";
  }

  static const char* value(const ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n\
string name\n\
int32 x\n\
int32 y\n\
int32 z\n\
int32 axis\n\
int32 x_magnitude\n\
int32 y_magnitude \n\
int32 speed\n\
int32 timestamp\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.name);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.axis);
      stream.next(m.x_magnitude);
      stream.next(m.y_magnitude);
      stream.next(m.speed);
      stream.next(m.timestamp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SpheroSwarmCollision_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sphero_swarm_node::SpheroSwarmCollision_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int32_t>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<int32_t>::stream(s, indent + "  ", v.z);
    s << indent << "axis: ";
    Printer<int32_t>::stream(s, indent + "  ", v.axis);
    s << indent << "x_magnitude: ";
    Printer<int32_t>::stream(s, indent + "  ", v.x_magnitude);
    s << indent << "y_magnitude: ";
    Printer<int32_t>::stream(s, indent + "  ", v.y_magnitude);
    s << indent << "speed: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed);
    s << indent << "timestamp: ";
    Printer<int32_t>::stream(s, indent + "  ", v.timestamp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SPHERO_SWARM_NODE_MESSAGE_SPHEROSWARMCOLLISION_H
