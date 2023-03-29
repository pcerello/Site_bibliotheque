import React from "react";

import defaultImage from "./livre.png";

function MyFriends(props) {
    const follower = props.follow;
    
  
  return (
    <li key={follower.id} className=" flex flex-col text-left mb-12 ml-12">
        {follower.picture ? (
          <img src={`${follower.picture}`} alt={follower.firstName} className="object-cover h-[24vh] w-[100%] md:object-contain drop-shadow-md"/>
        ) : (
          <img src={defaultImage} alt="default" style={{ width: "10vw" }} />
        )}
        <div className="">
          <h3 className="font-medium">
            <p>{follower.firstName} {follower.lastName}</p>
          </h3>
        </div>
    </li>

    
  )
}
export default MyFriends;