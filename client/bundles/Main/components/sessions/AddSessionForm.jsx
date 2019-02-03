import React from "react";

const AddSession = props => {

    return <div className="main_container">
        <h1>Add Session</h1>
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

            <label htmlFor="start_date">Date and time</label>
            <input
                onChange={props.onChange}
                value={props.start_date}
                id="start_date"
                name="session[start_date]"
                type="text"
                className="m-4"
            />
            <button className="button" name="Submit" type="submit" onclick={this.onSubmit} >
				Add Session
			</button>
        </form>
    </div>
};

export default AddSession;
