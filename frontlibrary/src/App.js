import "./App.css";
import SearchEngine from "./component/SearchEngine";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import MyHomePage from "./component/MyHomePage";
import Layout from "./component/Layout";
import AuthorBooks from "./component/AuthorBooks";


library.add(fas, far, fab);

function App({authorId}) {
  return (
    <div className="App">
      <Layout>
        <SearchEngine />
        {authorId ? (<AuthorBooks author={authorId}/>) : (<MyHomePage readerId={3} />)}
        
      </Layout>
    </div>
  );
}

export default App;
