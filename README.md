# Engagement Drop

This project was a part of the MODE SQL Analytics Training. It provided the general description of a business problem togheter with a database. The task was to independently understand the business need, get oriented with data and to dig in (with no specific instructions). 

**Problem to solve:** Unexpected engagement drop on social network for communicating with coworkers.


## Data
The data used for this project are part of internal MODE tutorial database. For this reason only descriptions of the tables are provided:

Table: platform_users
| Variable | Description |
| -------- | ----------- |
| user_id:	| A unique ID per user |
| created_at:	| The time the user was created (first signed up) |
| state: |	The state of the user (active or pending) |
| activated_at: |	The time the user was activated, if they are active |
| company_id:	| The ID of the user's company |
| language:	| The chosen language of the user |

Table: platform_events:
| Variable | Description |
| -------- | ----------- |
| user_id:	| The ID of the user logging the event |
| occurred_at:	| The time the event occurred. |
| event_type:	| The general event type. There are two values in this dataset: "signup_flow", which refers to anything occuring during the process of a user's authentication, and "engagement", which refers to general product usage after the user has signed up for the first time. |
| event_name:	| The specific action the user took. Possible values include: create_user: User is added to platform's database during signup process enter_email: User begins the signup process by entering her email address enter_info: User enters her name and personal information during signup process complete_signup: User completes the entire signup/authentication process home_page: User loads the home page like_message: User likes another user's message login: User logs into platform search_autocomplete: User selects a search result from the autocomplete list search_run: User runs a search query and is taken to the search results page search_click_result_X: User clicks search result X on the results page, where X is a number from 1 through 10. send_message: User posts a message view_inbox: User views messages in her inbox |
| location:	| The country from which the event was logged (collected through IP address). |
| device: |	The type of device used to log the event. |

Table: platform_emails
| Variable | Description |
| -------- | ----------- |
| user_id:	| The ID of the user to whom the event relates. |
| occurred_at:	| The time the event occurred. |
| action:	| The name of the event that occurred. "sent_weekly_digest" means that the user was delivered a digest email showing relevant conversations from the previous day. "email_open" means that the user opened the email. "email_clickthrough" means that the user clicked a link in the email. |

Table: benn.dimension_rollup_periods
| Variable | Description |
| -------- | ----------- |
| period_id:	| The type of rollup period |
| time_id:	| The identifier for any given data point |
| pst_start:	| The start time of the period in PST |
| pst_end:	| The start time of the period in PST |
| utc_start:	| The same as pst_start, but in UTC time |
| pst_start:	| The same as pst_end, but in UTC time |


## Queries and Outputs
Files on this respository include sql code and charts based on query results. Tables retrievied using queries are not included for privacy reasons. The following dimentions were invastigated during the project:
1. **General engagement** - indicating when the engagement drop took place
2. **Engagement types** - types of engagement actions (like log in) the users took over time
3. **Emails** - notification emails sent and user actions towards them over time
4. **Devices** - active users by different device type
