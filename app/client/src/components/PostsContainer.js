import React, { Component } from 'react';
import Post from './Post';
import axios from 'axios';

class PostsContainer extends Component {
    constructor(props){
        super(props)
        this.state = {
            posts: []
        }
    }
    componentDidMount() {
        axios.get('/posts')
        .then(response => {
            console.log(response)
            this.setState({
                posts: response.data
            })
        })
        .catch(error => console.log(error))
    }
    render() {
        return (
            <div className="container">
                <div class="alert alert-info">
                  There are posts....
                </div>
                {this.state.posts.map( post => {
                    return (<Post post={post} key={post.id} />)
                })}
            </div>
        )
    }
}

export default PostsContainer;