import React from "react";
import Layout from "./component/Layout";
import MyFriends from "./component/MyFriends";
import { useEffect, useState } from "react";


function FriendsPage() {

const userId = localStorage.getItem("userId");
const [follower, setFollower] = useState(null);
console.log("readerId", userId);
useEffect(() => {
  fetch(`http://localhost:8000/api/readers/${userId}/follow`, {
    mode: "cors",
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("404 Not Found");
      }
      return response.json();
    })
    .then((data) => setFollower(data))
    .catch((error) => {
      console.error("Error fetching follower:", error);
      setFollower(null);
    });
}, [userId]);



  return (
    <div className="App">
      <Layout>
        <div className="bg-white mt-40 flex flex-col items-center text-left">
            <div className="w-[90%] md:w-[80%] py-16 flex flex-col">
            <h1 className="text-2xl mb-8">Mes amis</h1>

                <ul className="flex flex-row flex-wrap ">
                    {follower ? (follower.map((follow) => (
                    <MyFriends follow={follow}/>
                    ))) : (<div className="bg-white py-16">Tu n'as pas d'amis...désolé</div>
                    )}
                </ul>
            </div>
        </div>
      </Layout>
    </div>
    
  );
}
export default FriendsPage;
