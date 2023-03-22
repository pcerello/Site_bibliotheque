import axios from "axios";
import React from "react";

class MyComponent extends React.Component {
  state = {
    data: [],
  };

  componentDidMount() {
    axios
      .get("http://localhost:8000", "cors")
      .then((response) => {
        const jsonString = JSON.stringify(response.data);
        this.setState({ data: jsonString });

        console.log(jsonString);
        console.log(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  }

  render() {
    return (
      <div>
        <h1>MyComponent</h1>
        <p>{this.state.data}</p>
      </div>
    );
  }
}
export default MyComponent;
