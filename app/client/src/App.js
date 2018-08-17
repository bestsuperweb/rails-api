import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import PostsContainer from './components/PostsContainer';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Posts Management System</h1>
        </header>
        <PostsContainer />
      </div>
    );
  }
}

export default App;
