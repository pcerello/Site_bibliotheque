import React from "react";
import Layout from "./component/Layout";
import MyFriends from "./component/MyFriends";

import { useEffect, useState } from "react";

function FriendsPage() {
  const userId = localStorage.getItem("userId");
  const [followerRecommendation, setFollowerRecommendation] = useState(null);
  const [follower, setFollower] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [friendsPerPage] = useState(8);
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
      .then((data) => {
        setFollower(data);
        console.log("data", follower);
      })
      .catch((error) => {
        console.error("Error fetching follower:", error);
        setFollower([]);
        console.log("data", follower);
      });
  }, [userId]);

  const indexOfLastFriend = currentPage * friendsPerPage;
  const indexOfFirstFriend = indexOfLastFriend - friendsPerPage;
  const currentFriends = follower.slice(indexOfFirstFriend, indexOfLastFriend);

  const totalPages = Math.ceil(follower.length / friendsPerPage);
  const prevPages = currentPage > 2 ? [currentPage - 2, currentPage - 1] : [1];
  const nextPages =
    currentPage < totalPages - 1
      ? [currentPage + 1, currentPage + 2]
      : [totalPages];

  function pagination() {
    return (
      <div className="flex flex-row justify-center py-8">
        <button
          tabIndex={currentPage === 1 ? -1 : 0}
          aria-hidden={currentPage === 1 ? true : false}
          className="mx-8 bg-white drop-shadow-md p-2 disabled:text-gray-300 disabled:drop-shadow-none disabled:bg-gray-50 disabled:shadow-inner"
          disabled={currentPage === 1}
          onClick={() => setCurrentPage(currentPage - 1)}
        >
          Page précédente
        </button>
        {currentPage > 1 &&
          prevPages.map((page) => (
            <button
              key={page}
              tabIndex={0}
              className="mx-2"
              onClick={() => setCurrentPage(page)}
            >
              {page}
            </button>
          ))}
        <button
          key={currentPage}
          tabIndex={-1}
          aria-hidden="true"
          disabled={true}
          className="cursor-default underline mx-2"
        >
          {currentPage}
        </button>
        {currentPage < totalPages &&
          nextPages.map((page) => (
            <button
              key={page}
              tabIndex={0}
              className="mx-2"
              onClick={() => setCurrentPage(page)}
            >
              {page}
            </button>
          ))}
        <button
          tabIndex={currentPage === totalPages ? -1 : 0}
          aria-hidden={currentPage === totalPages ? true : false}
          className="mx-8 bg-white drop-shadow-md p-2 disabled:text-gray-300 disabled:drop-shadow-none disabled:bg-gray-50 disabled:shadow-inner"
          disabled={currentPage === totalPages}
          onClick={() => setCurrentPage(currentPage + 1)}
        >
          Page suivante
        </button>
      </div>
    );
  }
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

              {follower.length > 0 ? (
                <>
                {pagination()}
                <ul className="flex flex-row flex-wrap ">
                  {currentFriends.map((follow) => (
                    <MyFriends follow={follow} />
                  ))}
                </ul>
                {pagination()}
                </>
              ) : (
                <div className="bg-white py-16">
                  Tu n'as pas d'amis...désolé
                </div>
              )}
          </div>
          <div className="w-[90%] md:w-[80%] py-16 flex flex-col">
            <h1 className="text-2xl mb-8">Les amis de mes amis sont mes amis ?</h1>

                <ul className="flex flex-row flex-wrap ">
                    {followerRecommendation ? (followerRecommendation.map((follower) => (
                    <div>
                        <MyFriends follow={follower}/>
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
