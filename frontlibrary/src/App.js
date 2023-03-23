import "./App.css";
import MyComponent from "./component/MyComponent.js";
import MyFooter from "./component/MyFooter.js";
import MyMenu from "./component/MyMenu.js";

function App() {
  return (
    <div className="App">
      <MyMenu />
      <MyComponent />
      <MyFooter />
    </div>
  );
}

export default App;
