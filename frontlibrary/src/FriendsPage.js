import React from "react";
import Layout from "./component/Layout";
import MyFriends from "./component/MyFriends";
import PersonalInfos from "./component/PersonalInfos";

function FriendsPage() {
  return (
    <div>
      <Layout>
        <PersonalInfos readerId={3}/>
        <MyFriends />

      </Layout>
    </div>
  );
}
export default FriendsPage;
