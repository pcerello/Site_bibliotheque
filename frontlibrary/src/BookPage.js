import "./App.css";
import BookInfo from "./component/BookInfo";
import Layout from "./component/Layout";

function BookPage() {
  return (
    <div className="App">
      <Layout>
        <BookInfo />
      </Layout>
    </div>
  );
}
export default BookPage;
