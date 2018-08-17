import React from 'react';
const Post = ({post}) =>
    <div className="single-post" key={post.id}>
        <h4>{post.body}</h4>
        <p>{post.user_id}</p>
    </div>
export default Post;