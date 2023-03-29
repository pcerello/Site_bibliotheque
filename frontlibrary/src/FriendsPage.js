import React from "react";
import Layout from "./component/Layout";
import MyFriends from "./component/MyFriends";
import PersonalInfos from "./component/PersonalInfos";

function FriendsPage() {
  const userId = localStorage.getItem("userId");
  return (
    <div>
      <Layout>
        <PersonalInfos readerId={userId}/>
        <MyFriends />

      </Layout>
    </div>
  );
}
export default FriendsPage;
