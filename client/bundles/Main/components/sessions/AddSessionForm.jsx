import React from "react";

const AddSession = props => {

    return <div className="main_container">
        <h1 className="m-4">Create Session</h1>
        <form
            id="Session-form"
            name="Session-form"
            onSubmit={props.onSubmit}
            className="wrapper-col"
        >
            <label htmlFor="Title">Title</label>
            <input
                onChange={props.onChange}
                value={props.title}
                id="title"
                name="session[title]"
                type="text"
                className="m-4"
            />
            <label htmlFor="date">Start date</label>
            <input
                onChange={props.onChange}
                value={props.password}
                id="start_date"
                name="session[start_date]"
                type="datetime-local"
                className="m-4"
            />
            <button className="button" name="Submit" type="submit">
                Create Session
        </button>
        </form>
    </div>
};

export default AddSession;