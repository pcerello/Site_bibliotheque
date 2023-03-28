import "./App.css";
import SearchEngine from "./component/SearchEngine";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import MyHomePage from "./component/MyHomePage";
import Layout from "./component/Layout";

library.add(fas, far, fab);

function App() {
  return (
    <div className="App">
      <Layout>
        <SearchEngine />
        <MyHomePage readerId={3} />
      </Layout>
    </div>
  );
}

export default App;
