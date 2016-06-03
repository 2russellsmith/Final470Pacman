// Generated by gencpp from file sphero_swarm_node/SpheroInfo.msg
// DO NOT EDIT!


#ifndef SPHERO_SWARM_NODE_MESSAGE_SPHEROINFO_H
#define SPHERO_SWARM_NODE_MESSAGE_SPHEROINFO_H

#include <ros/service_traits.h>


#include <sphero_swarm_node/SpheroInfoRequest.h>
#include <sphero_swarm_node/SpheroInfoResponse.h>


namespace sphero_swarm_node
{

struct SpheroInfo
{

typedef SpheroInfoRequest Request;
typedef SpheroInfoResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SpheroInfo
} // namespace sphero_swarm_node


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::sphero_swarm_node::SpheroInfo > {
  static const char* value()
  {
    return "b7dd77d16ce84367917a2e9ab291530a";
  }

  static const char* value(const ::sphero_swarm_node::SpheroInfo&) { return value(); }
};

template<>
struct DataType< ::sphero_swarm_node::SpheroInfo > {
  static const char* value()
  {
    return "sphero_swarm_node/SpheroInfo";
  }

  static const char* value(const ::sphero_swarm_node::SpheroInfo&) { return value(); }
};


// service_traits::MD5Sum< ::sphero_swarm_node::SpheroInfoRequest> should match 
// service_traits::MD5Sum< ::sphero_swarm_node::SpheroInfo > 
template<>
struct MD5Sum< ::sphero_swarm_node::SpheroInfoRequest>
{
  static const char* value()
  {
    return MD5Sum< ::sphero_swarm_node::SpheroInfo >::value();
  }
  static const char* value(const ::sphero_swarm_node::SpheroInfoRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::sphero_swarm_node::SpheroInfoRequest> should match 
// service_traits::DataType< ::sphero_swarm_node::SpheroInfo > 
template<>
struct DataType< ::sphero_swarm_node::SpheroInfoRequest>
{
  static const char* value()
  {
    return DataType< ::sphero_swarm_node::SpheroInfo >::value();
  }
  static const char* value(const ::sphero_swarm_node::SpheroInfoRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::sphero_swarm_node::SpheroInfoResponse> should match 
// service_traits::MD5Sum< ::sphero_swarm_node::SpheroInfo > 
template<>
struct MD5Sum< ::sphero_swarm_node::SpheroInfoResponse>
{
  static const char* value()
  {
    return MD5Sum< ::sphero_swarm_node::SpheroInfo >::value();
  }
  static const char* value(const ::sphero_swarm_node::SpheroInfoResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::sphero_swarm_node::SpheroInfoResponse> should match 
// service_traits::DataType< ::sphero_swarm_node::SpheroInfo > 
template<>
struct DataType< ::sphero_swarm_node::SpheroInfoResponse>
{
  static const char* value()
  {
    return DataType< ::sphero_swarm_node::SpheroInfo >::value();
  }
  static const char* value(const ::sphero_swarm_node::SpheroInfoResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SPHERO_SWARM_NODE_MESSAGE_SPHEROINFO_H
