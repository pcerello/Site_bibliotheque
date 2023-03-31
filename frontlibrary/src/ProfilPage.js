import React from "react";
import Layout from "./component/Layout";
import PersonalInfos from "./component/PersonalInfos";

/**
 * This function represents the profile page of the user.
 * It displays the personal information of the user by calling the PersonalInfos component.
 * The userId is retrieved from the local storage.
 * The PersonalInfos component is wrapped inside the Layout component.
 * @returns JS Element
 */
function ProfilPage() {
  const userId = localStorage.getItem("userId");
  return (
    <div className="App">
      <Layout>
        <PersonalInfos readerId={userId} />
      </Layout>
    </div>
  );
}

export default ProfilPage;
