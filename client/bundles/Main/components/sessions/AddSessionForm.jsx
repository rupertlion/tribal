import React from "react";

const AddSessionForm = props => {
    return <div className="main_container">
        <h1>Add Session</h1>
        <form
            id="Session-form"
            name="Session-form"
            onSubmit={props.onSubmit}
            className="m-4 wrapper-col"
        >
            <label htmlFor="Title">Title</label>
            <input
                onChange={props.onChange}
                value={props.title}
                id="title"
                name="session[title]"
                type="text"
                className="m-4 form_field"
            />
            
            <label htmlFor="startDate">Date and time</label>
            <input
                onChange={props.onChange}
                value={props.startDate}
                id="startDate"
                name="session[startDate]"
                type="datetime-local"
                className="m-4 form_field"
            />

            <label htmlFor="pricePoint">Price</label>
            <input
                onChange={props.onChange}
                value={props.pricePoint}
                id="pricePoint"
                name="session[pricePoint]"
                type="number"
                className="m-4 form_field"
            />
            
            <button className="m-4 button" name="Submit" type="submit" >
				Add Session
			</button>
        </form>
    </div>
};

export default AddSessionForm;
