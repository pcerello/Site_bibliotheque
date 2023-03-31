import "./App.css";
import SearchEngine from "./component/SearchEngine";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import MyHomePage from "./component/MyHomePage";
import Layout from "./component/Layout";
import AuthorBooks from "./component/AuthorBooks";

library.add(fas, far, fab); // Add all icons to the library so you can use it in your page

/**
 * This function represents the home page of the application.
 * It displays the home page by calling the MyHomePage component.
 * and the search engine by calling the SearchEngine component.
 * @returns JS Element
 */
function App() {
  const userId = localStorage.getItem("userId");
  return (
    <div className="App">
      <Layout>
        <SearchEngine />
        <MyHomePage readerId={userId} />
      </Layout>
    </div>
  );
}

export default App;
