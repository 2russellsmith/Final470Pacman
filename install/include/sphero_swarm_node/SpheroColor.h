// Generated by gencpp from file sphero_swarm_node/SpheroColor.msg
// DO NOT EDIT!


#ifndef SPHERO_SWARM_NODE_MESSAGE_SPHEROCOLOR_H
#define SPHERO_SWARM_NODE_MESSAGE_SPHEROCOLOR_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sphero_swarm_node
{
template <class ContainerAllocator>
struct SpheroColor_
{
  typedef SpheroColor_<ContainerAllocator> Type;

  SpheroColor_()
    : name()
    , r(0.0)
    , g(0.0)
    , b(0.0)
    , a(0.0)  {
    }
  SpheroColor_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , r(0.0)
    , g(0.0)
    , b(0.0)
    , a(0.0)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef float _r_type;
  _r_type r;

   typedef float _g_type;
  _g_type g;

   typedef float _b_type;
  _b_type b;

   typedef float _a_type;
  _a_type a;




  typedef boost::shared_ptr< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> const> ConstPtr;

}; // struct SpheroColor_

typedef ::sphero_swarm_node::SpheroColor_<std::allocator<void> > SpheroColor;

typedef boost::shared_ptr< ::sphero_swarm_node::SpheroColor > SpheroColorPtr;
typedef boost::shared_ptr< ::sphero_swarm_node::SpheroColor const> SpheroColorConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sphero_swarm_node::SpheroColor_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sphero_swarm_node

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/jade/share/geometry_msgs/cmake/../msg'], 'sphero_swarm_node': ['/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg'], 'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a101c99ac2ead202753f34ba8e5ed649";
  }

  static const char* value(const ::sphero_swarm_node::SpheroColor_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa101c99ac2ead202ULL;
  static const uint64_t static_value2 = 0x753f34ba8e5ed649ULL;
};

template<class ContainerAllocator>
struct DataType< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sphero_swarm_node/SpheroColor";
  }

  static const char* value(const ::sphero_swarm_node::SpheroColor_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
float32 r\n\
float32 g\n\
float32 b\n\
float32 a\n\
";
  }

  static const char* value(const ::sphero_swarm_node::SpheroColor_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.r);
      stream.next(m.g);
      stream.next(m.b);
      stream.next(m.a);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SpheroColor_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sphero_swarm_node::SpheroColor_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sphero_swarm_node::SpheroColor_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "r: ";
    Printer<float>::stream(s, indent + "  ", v.r);
    s << indent << "g: ";
    Printer<float>::stream(s, indent + "  ", v.g);
    s << indent << "b: ";
    Printer<float>::stream(s, indent + "  ", v.b);
    s << indent << "a: ";
    Printer<float>::stream(s, indent + "  ", v.a);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SPHERO_SWARM_NODE_MESSAGE_SPHEROCOLOR_H
