import React from "react";
import Layout from "./component/Layout";
import MyFriends from "./component/MyFriends";
import MyFriendsRecom from "./component/MyFriendsRecom";
import { useEffect, useState } from "react";


function FriendsPage() {

const userId = localStorage.getItem("userId");
const [followerRecommendation, setFollowerRecommendation] = useState(null);
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

useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${userId}/follow/recommendations?max=8`, {
      mode: "cors",
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("404 Not Found");
        }
        return response.json();
      })
      .then((data) => setFollowerRecommendation(data))
      .catch((error) => {
        console.error("Error fetching follower:", error);
        setFollowerRecommendation(null);
      });
  }, [userId]);

console.log("folow" ,followerRecommendation)

  return (
    <div className="App">
      <Layout>
        <div className="bg-white mt-40 flex flex-col items-center text-left">
            <div className="w-[90%] md:w-[80%] py-16 flex flex-col">
            <h1 className="text-2xl mb-8">Mes amis</h1>

                <ul className="flex flex-row flex-wrap ">
                    {follower ? (follower.map((follow) => (
                    <div>
                        <MyFriends follow={follow}/>

                    </div>
                    ))) : (<div className="bg-white py-16">Tu n'as pas d'amis...désolé</div>
                    )}
                </ul>
            </div>
            <div className="w-[90%] md:w-[80%] py-16 flex flex-col">
            <h1 className="text-2xl mb-8">Les amis de mes amis sont mes amis ?</h1>

                <ul className="flex flex-row flex-wrap ">
                    {followerRecommendation ? (followerRecommendation.map((follower) => (
                    <div>
                        <MyFriendsRecom follow={follower}/>
                    </div>
                    ))) : (<div className="bg-white py-16">Aucune suggestion</div>
                    )}
                </ul>
            </div>
        </div>
      </Layout>
    </div>
    
  );
}
export default FriendsPage;
