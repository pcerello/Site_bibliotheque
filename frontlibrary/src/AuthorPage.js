import "./App.css";
import SearchEngine from "./component/SearchEngine";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import Layout from "./component/Layout";
import AuthorBooks from "./component/AuthorBooks";

library.add(fas, far, fab); // Add all icons to the library so you can use it in your page

/**
 * This function represents the page that displays all the books
 * from the author whose id is passed as a parameter.
 * @param {*} param0 the author id
 * @returns JS Element
 */
function AuthorPage({ authorId }) {
  return (
    <div className="App">
      <Layout>
        <SearchEngine />
        <AuthorBooks author={authorId} />
      </Layout>
    </div>
  );
}

export default AuthorPage;
