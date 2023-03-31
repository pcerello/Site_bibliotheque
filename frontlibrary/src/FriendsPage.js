import React from "react";
import Layout from "./component/Layout";
import MyFriends from "./component/MyFriends";
import MyFriendsRecom from "./component/MyFriendsRecom";
import { useEffect, useState } from "react";

/**
 * This function represents the friends page of the user.
 * It displays the friends of the user by calling the MyFriends component.
 * It also displays the friends recommendation of the user by calling the MyFriendsRecom component.
 * The userId is retrieved from the local storage.
 * @returns  JS Element
 */
function FriendsPage() {
  const userId = localStorage.getItem("userId"); // Get the userId from the local storage
  const [followerRecommendation, setFollowerRecommendation] = useState(null); // Set the state of the follower recommendation
  const [follower, setFollower] = useState([]); // Set the state of the follower
  const [currentPage, setCurrentPage] = useState(1); // Set the state of the current page
  const [friendsPerPage] = useState(8); // Set the state of the number of friends per page
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
        setFollower(data); // Set the follower state with the data
      })
      .catch((error) => {
        console.error("Error fetching follower:", error);
        setFollower([]); // Set the follower state with an empty array
      });
  }, [userId]); // The useEffect is called when the userId changes

  const indexOfLastFriend = currentPage * friendsPerPage;
  const indexOfFirstFriend = indexOfLastFriend - friendsPerPage;
  const currentFriends = follower.slice(indexOfFirstFriend, indexOfLastFriend);
  const totalPages = Math.ceil(follower.length / friendsPerPage);
  const prevPages = currentPage > 2 ? [currentPage - 2, currentPage - 1] : [1];
  const nextPages =
    currentPage < totalPages - 1
      ? [currentPage + 1, currentPage + 2]
      : [totalPages];

  /**
   * This function represents the pagination of the friends page.
   * It displays the previous and next pages of the current page.
   * @returns  JS Element
   */
  function pagination() {
    return (
      <div className="flex flex-row justify-center py-8">
        <button
          tabIndex={currentPage === 1 ? -1 : 0}
          aria-hidden={currentPage === 1 ? true : false} // If the current page is the first page, the button is hidden
          className="mx-8 bg-white drop-shadow-md p-2 disabled:text-gray-300 disabled:drop-shadow-none disabled:bg-gray-50 disabled:shadow-inner"
          disabled={currentPage === 1} // If the current page is the first page, the button is disabled
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
  // Get the follower recommendation
  useEffect(() => {
    fetch(
      `http://localhost:8000/api/readers/${userId}/follow/recommendations?max=8`,
      {
        mode: "cors",
      }
    )
      .then((response) => {
        if (!response.ok) {
          throw new Error("404 Not Found");
        }
        return response.json();
      })
      .then((data) => setFollowerRecommendation(data)) // Set the follower recommendation state with the data
      .catch((error) => {
        console.error("Error fetching follower:", error);
        setFollowerRecommendation(null); // Set the follower recommendation state with null
      });
  }, [userId]);

  return (
    <div className="App">
      <Layout>
        <div className="bg-white mt-40 flex flex-col items-center text-left">
          <div className="w-[90%] md:w-[80%] py-16 flex flex-col">
            <h1 className="text-2xl mb-8">Mes amis</h1>
            {follower.length > 0 ? ( // If the follower state is not empty, display the friends
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
              <div className="bg-white py-16">Tu n'as pas d'amis...désolé</div> // If the follower state is empty, display a message
            )}
          </div>
          <div className="w-[90%] md:w-[80%] py-16 flex flex-col">
            <h1 className="text-2xl mb-8">
              Les amis de mes amis sont mes amis ?
            </h1>

            <ul className="flex flex-row flex-wrap ">
              {followerRecommendation ? ( // If the follower recommendation state is not empty, display the friends recommendation
                followerRecommendation.map((follower) => (
                  <div>
                    <MyFriendsRecom follow={follower} />
                  </div>
                ))
              ) : (
                <div className="bg-white py-16">Aucune suggestion</div> // If the follower recommendation state is empty, display a message
              )}
            </ul>
          </div>
        </div>
      </Layout>
    </div>
  );
}
export default FriendsPage;
