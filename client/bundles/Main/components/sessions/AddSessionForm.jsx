import React from "react";

const AddSessionForm = props => {
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
                name="title"
                type="text"
                className="m-4"
            />

            <label htmlFor="start_date">Date and time</label>
            <input
                onChange={props.onChange}
                value={props.start_date}
                id="start_date"
                name="date"
                type="datetime-local"
                className="m-4"
            />

            <label htmlFor="price_table_id">Price</label>
            <input
                onChange={props.onChange}
                value={props.price_table_id}
                id="price_table_id"
                name="price"
                type="number"
                className="m-4"
            />
            
            <button className="button" name="Submit" type="submit" >
				Add Session
			</button>
        </form>
    </div>
};

export default AddSessionForm;
