import React from "react";
import Layout from "./component/Layout";

import PersonalInfos from "./component/PersonalInfos";

function ProfilPage() {
  const userId = localStorage.getItem("userId");
  return (
    <div className="App">
      <Layout>
        <PersonalInfos readerId={userId}/>
        

      </Layout>
    </div>
  );
}
export default ProfilPage;